json = require "json"
utils = require "utils"

-- these are lua hooks related to results, for help please view lua_readme.md!
-- there are some example functions here to give you an idea of what is possible, feel free to write your own!
-- if you do and think other people would be interested in them consider making a pull request at https://github.com/JustaPenguin/assetto-server-manager

-- called whenever results are loaded, including by championships and race weekends
function onResultsLoad(encodedResults)
    -- Decode block, you probably shouldn't touch these!
    local results = json.decode(encodedResults)

    -- Uncomment these lines and run the function (load a results file) to print out the structure of each object.
    --print("Results:", utils.dump(results))

    -- Function block NOTE: this hook BLOCKS, make sure your functions don't loop forever!
    -- uncomment functions to enable them!
    --results = autoDisqualifyForCollisions(results, 140.0, 20)
    --results = invalidateLapIfSpeedingAtStart(results)

    -- Encode block, you probably shouldn't touch these either!
    return json.encode(results)
end

-- invalidate a lap if the speed at the first speed trap is too high
function invalidateLapIfSpeedingAtStart(results)
    -- there may not be any events, Result may be empty on list pages
    if results["Result"] == nil or results["Laps"] == nil then
        return results
    end

    for k, resultTable in pairs(results["Result"]) do
        local bestLap = 0

        for i, lapTable in pairs(results["Laps"]) do
            (function()
                if lapTable["SpeedTrapHits"] == nil then
                    -- no speed traps hit, skip this lap
                    return
                end

                if lapTable["Cuts"] >= 1 then
                    -- lap already invalid
                    return
                end

                -- this lap was completed by the current driver in the current car
                if lapTable["DriverGuid"] == resultTable["DriverGuid"] and lapTable["CarModel"] == resultTable["CarModel"] then
                    local numCuts = lapTable["Cuts"]

                    for y, speedTrapTable in pairs(lapTable["SpeedTrapHits"]) do
                        if not speedTrapTable["TrapIndex"] == 0 then
                            break
                        end

                        local speed = 0

                        -- get the magnitude of the velocity, note that this is in meters per second
                        speed = math.sqrt(speedTrapTable["Velocity"]["X"] * speedTrapTable["Velocity"]["X"] +
                                speedTrapTable["Velocity"]["Y"] * speedTrapTable["Velocity"]["Y"] +
                                speedTrapTable["Velocity"]["Z"] * speedTrapTable["Velocity"]["Z"])

                        -- 15 km/h, could instead switch on the track filename to apply different limits for different tracks
                        -- (from results["TrackName"] and results["TrackConfig"] (layout name))
                        if speed > 4.17 then
                            -- invalidate lap
                            lapTable["Cuts"] = lapTable["Cuts"] + 1
                        else
                            -- reset lap (driver reset to pits and started again)
                            lapTable["Cuts"] = numCuts

                            if bestLap == 0 or lapTable["LapTime"] < bestLap then
                                bestLap = lapTable["LapTime"]
                            end
                        end
                    end
                end
            end)()
        end

        if bestLap ~= 0 then
            resultTable["BestLap"] = bestLap
        end
    end

    return results
end

-- disqualify a driver if they have a collision faster than minSpeed or more total collisions than maxCollisions
function autoDisqualifyForCollisions(results, minSpeed, maxCollisions)
    -- there may not be any events, Result may be empty on list pages
    if results["Result"] == nil or results["Events"] == nil then
        return results
    end

    for k, resultTable in pairs(results["Result"]) do

        local numCollisions = 0

        for i, eventTable in pairs(results["Events"]) do
            -- this collision involved the current driver
            if eventTable["Driver"]["Guid"] == resultTable["DriverGuid"] then
                -- count the number of collisions
                numCollisions = numCollisions + 1

                -- if this collision is faster than the minSpeed, or max collisions have been exceeded
                if eventTable["ImpactSpeed"] > minSpeed or numCollisions > maxCollisions then
                    -- disqualify the driver
                    resultTable["Disqualified"] = true
                end
            end
        end
    end

    -- sort disqualified drivers to the back of the results list
    table.sort(results["Result"], sortDisqualifiedToBack)

    return results
end

function sortDisqualifiedToBack (a, b)
    if a["Disqualified"] and not b["Disqualified"] then
        return false
    elseif not a["Disqualified"] and b["Disqualified"] then
        return true
    else
        return false
    end
end
