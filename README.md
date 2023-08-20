Assetto Server Manager (ACSM)
=============================

An advanced web interface for managing Assetto Corsa servers.

## Installation

Hi! Thanks for purchasing ACSM. It means a lot to us, and we hope you enjoy using it!

Let's get started with the installation process. Please note, we don't cover all configurable options here, but these steps
should be enough to get you set up with basic server manager install.

### Single Server

"Single Server" means that you only want to run 1 Assetto Corsa Server. This is the simplest install,
and definitely the best place to start!

#### Windows

1. Extract the zip file you downloaded (you probably already did this, as you're reading this guide!)
2. Make a new folder somewhere you would like to store your Assetto Corsa server. Some sensible places include:
   * C:\Users\YourUsernameHere\AssettoCorsaServer
   * C:\Users\YourUsernameHere\Desktop\AssettoCorsaServer
   * C:\AssettoCorsaServer
   Or somewhere else, it doesn't matter too much! We'll refer to this as your 'server manager install folder' 
   from now on.
3. Take the 'server-manager.exe' and 'config.yml' (the ones you just extracted), 
   and move them in to your server manager install folder.
4. Copy your ACSM.License (you can get this from emperorservers.com, or your purchase email!) 
   into the server manager install folder too. This should now be in the same folder as the server-manager.exe.
5. Open the config.yml to edit it. You can open it in Notepad, or something like NotePad++ or Visual Studio code.
6. There are lots of options in the config.yml, they all have descriptions of what they do. Most are set to 
   sensible defaults - so you don't need to change them all! However, there are a few important ones...
7. Find the "steam" -> "install_path" option. 
   This option tells Server Manager where the Assetto Corsa server is installed.
   You have a few options here:
   a) Set this option to the location where the server is installed, for example:
        "C:\Program Files\Steam\steamapps\common\Assetto Corsa Dedicated Server\"
   b) In explorer, copy the Assetto Corsa server folder into your server manager install folder 
      and rename it to 'assetto', and leave this option set to 'assetto'
   c) Leave this option unchanged. Don't copy any files. Server Manager will create a 'barebones' install
      with the default cars, and you can upload the tracks and more car details later.
   d) Install steamcmd, and set the steam username and password, then let Server Manager install the
      Assetto Corsa server for you.
8. Find the "http" -> "session_key" option. You must change this to a random string. 
   Think of it like a password. Create something random and don't share it with anyone.
9. Save the config.yml
10. You should now be ready to launch server manager. You can do this by double clicking the "server-manager.exe".
11. When it has opened, Server Manager will open your browser. If it doesn't, you can open it by going to
    http://127.0.0.1:8772 in your browser.
12. Log in using the username 'admin' and the password 'servermanager'. You will then be asked to change your
    password.
13. We recommend that you then go to the Tracks page, and follow the instructions to upload your tracks.
14. We also recommend that you go to the Cars page, and follow the instructions to upload your cars. You may need to do
    them in smaller batches, of say 20-30 cars. You can upload multiple at once by selecting them together in windows 
    explorer and dragging them into the Drag and Drop area of the upload form.
15. Go to the Server Options page. Please read through the options carefully. Pay specific attention to the port values of:
    UDP Port, HTTP Port, TCP Port, Content Manager Wrapper Port. These will all need to be made accessible on the web
    by a technique called "Port Forwarding". This is not covered in this guide, but you will find many guides on Google.
    Make sure to save your server options.
16. You can now try running an event! We recommend a 'Quick Race' to test that the server is working OK. Go to the
    Quick Race page, and set up an event. Press 'Start Race'.
17. If you can't join your quick race, or the server goes offline, please go to the 'Server Logs' page, and read the logs
    for both the "Assetto Corsa Server" and "Server Manager". Often errors will be shown in red there.
18. Enjoy using Server Manager!

If you struggle with any of these steps, or Server Manager doesn't open properly, you can check your server-manager.log
for more information on what might have gone wrong!

#### Linux

1. Extract the zip file you downloaded (you probably already did this, as you're reading this guide!)
2. Make a new folder somewhere you would like to store your Assetto Corsa server. An example of a sensible place is:
   * /home/<yourusername/AssettoCorsaServer
   Or somewhere else, it doesn't matter too much! We'll refer to this as your 'server manager install folder' 
   from now on.
3. Take the 'server-manager' binary and 'config.yml' (the ones you just extracted), 
   and move them in to your server manager install folder.
4. Copy your ACSM.License (you can get this from emperorservers.com, or your purchase email!) 
   into the server manager install folder too. This should now be in the same folder as the server-manager.
5. Open the config.yml to edit it. You can open it in Notepad, or something like NotePad++ or Visual Studio code.
6. There are lots of options in the config.yml, they all have descriptions of what they do. Most are set to 
   sensible defaults - so you don't need to change them all! However, there are a few important ones...
7. Find the "steam" -> "install_path" option. 
   This option tells Server Manager where the Assetto Corsa server is installed.
   You have a few options here:
   a) Set this option to the location where the server is installed, for example:
        "/var/lib/steamcmd/Assetto Corsa Server"
   b) Copy the Assetto Corsa server folder into your server manager install folder 
      and rename it to 'assetto', and leave this option set to 'assetto'
   c) Leave this option unchanged. Don't copy any files. Server Manager will create a 'barebones' install
      with the default cars, and you can upload the tracks and more car details later.
   d) Install steamcmd, and set the steam username and password, then let Server Manager install the
      Assetto Corsa server for you.
8. Find the "http" -> "session_key" option. You must change this to a random string. 
   Think of it like a password. Create something random and don't share it with anyone.
9. Save the config.yml
10. You should now be ready to launch server manager. You can do this by running "./server-manager" in terminal from the 
    server manager install path.
11. Open the server manager web UI by going to http://127.0.0.1:8772 (this may be different if you changed the http port!)
12. Log in using the username 'admin' and the password 'servermanager'. You will then be asked to change your
    password.
13. We recommend that you then go to the Tracks page, and follow the instructions to upload your tracks.
14. We also recommend that you go to the Cars page, and follow the instructions to upload your cars. You may need to do
    them in smaller batches, of say 20-30 cars. You can upload multiple at once by selecting them together in windows 
    explorer and dragging them into the Drag and Drop area of the upload form.
15. Go to the Server Options page. Please read through the options carefully. Pay specific attention to the port values of:
    UDP Port, HTTP Port, TCP Port, Content Manager Wrapper Port. These will all need to be made accessible on the web
    by a technique called "Port Forwarding". This is not covered in this guide, but you will find many guides on Google.
    Make sure to save your server options.
16. You can now try running an event! We recommend a 'Quick Race' to test that the server is working OK. Go to the
    Quick Race page, and set up an event. Press 'Start Race'.
17. If you can't join your quick race, or the server goes offline, please go to the 'Server Logs' page, and read the logs
    for both the "Assetto Corsa Server" and "Server Manager". Often errors will be shown in red there.
18. Enjoy using Server Manager!

If you struggle with any of these steps, or Server Manager doesn't open properly, you can check your server-manager.log
for more information on what might have gone wrong!

### Multi-Server

A multi-server install shares content, accounts and some settings between multiple Server Managers.

#### Windows

1. Follow steps 1 to 9 in the 'Single Server Windows' guide above.
2. Copy the assetto-multiserver-manager.exe from the zip file to your server manager install folder
3. Copy the servers.yml from the zip file to your server manager install folder
4. Open servers.yml. Set 'num_servers' to the number of servers you want to install. You can change this later!
5. Run assetto-multiserver-manager.exe by double clicking on it.
6. Navigate to http://127.0.0.1:8772.
7. Follow steps 11-18 in the guide above. You should only need to upload content once, and it will be shared between 
   servers. Server Options will need to be configured for each server. You can switch between servers by using the 
   'Multiserver' icon in the top right hand corner of Server Manager.
8. When you want to launch Server Manager, make sure to use assetto-multiserver-manager.exe, not server-manager.exe.

#### Linux

1. Follow steps 1 to 9 in the 'Single Server Linux' guide above.
2. Copy the assetto-multiserver-manager binary from the zip file to your server manager install folder
3. Copy the servers.yml from the zip file to your server manager install folder
4. Open servers.yml. Set 'num_servers' to the number of servers you want to install. You can change this later!
5. Run assetto-multiserver-manager from the terminal, e.g. ./assetto-multiserver-manager
6. Navigate to http://127.0.0.1:8772.
7. Follow steps 11-18 in the guide above. You should only need to upload content once, and it will be shared between 
   servers. Server Options will need to be configured for each server. You can switch between servers by using the 
   'Multiserver' icon in the top right hand corner of Server Manager.
8. When you want to launch Server Manager, make sure to use the assetto-multiserver-manager binary, not server-manager.


### Docker Installation

This guide is brief, and expects that the reader is experienced with Docker.

In the linux zip download of Server Manager (available from emperorservers.com), there is a Dockerfile and a docker-compose.yml file. 
The dockerfile expects all binaries to be placed next to it, for it to build successfully. You must volume mount all required dependencies
(described in the normal install methods above). You must also volume mount the ACSM.License file.

Feel free to edit the Dockerfile as you wish to add extra dependencies, etc.

## Upgrading

When you are upgrading Server Manager or Assetto Multi-Server Manager, you just need to replace the executable (exe) files.
You should then just be able to run them as normal.

## Server Plugins

Server Plugins such as Real Penalty, KissMyRank and sTracker must be enabled by setting the 
'server' -> 'disable_plugins' key to 'false'. Please read the disclaimer before doing so.

## Lua Plugins

The plugins folder in the Server Manager zip contains a detailed guide (lua_readme.txt) on how to use the plugins.

## Forgotten Password

If you've forgotten your password, you can set the "accounts" -> "admin_password_override" key in the config.yml. 
It will change the admin password to be whatever you have specified in plain text. 
You will then be prompted to change your password on next login.

The default admin user cannot be deleted or have its group changed.

## Support

If you need help with Server Manager, we recommend joining our Discord community. There are plenty of experienced
and helpful people who will assist you. Please be patient when asking questions, and follow our rules.

You can join the discord here: https://discordapp.com/invite/6DGKJzB

You can also email our support email. Note that it can take a little while for us to respond, but we do our best to
answer all queries. The discord is usually the best way of getting support!

You can email us at: support@emperorservers.com


## UDP Plugin Documentation

ACSM v2 is entirely compatible with the original Kunos UDP plugin implementations, so most existing plugins should work.

If you want to write your own plugin for ACSM, the additions to the plugin protocol have been documented below.

### Examples

You can find many examples of the acServer UDP plugin protocol on the web, such as:

- a python implementation: https://github.com/mathiasuk/ac-pserver
- a javascript/websockets bridge: https://github.com/germanrcuriel/assetto-corsa-server-udp2ws
- Server Manager v1's golang implementation: https://github.com/JustaPenguin/assetto-server-manager/tree/master/pkg/udp

For brevity, only the changes/improvements added to ACSM v2 will be listed here.

### Requests

Your plugin can send these messages to the server.

#### Enable Enhanced Reporting

**To receive the new messages added to ACSM, you must first send a message to the UDP plugin requesting 'enhanced reporting'
to be enabled.** This message only needs to be sent **once** per plugin run.

The main protocol is the same as the acServer implementation, but with a new message as follows:

```cgo
{
    uint8 messageType; // to enable enhanced reporting, send a uint8 with value '210'.
}
```

The server will then output "UDP Plugin: Enhanced reporting is enabled" to the log.
You will then start to receive the extra messages listed below.

#### Request Ping

*Doesn't require 'Enable Enhanced Reporting'*

```cgo
{
    uint8 messageType; // to request the Ping event, send a uint8 with value '211'.
    int64 pluginTime;  // time that the plugin sent the Request Ping event (unix milliseconds)
}
```

### Messages

The server will send these messages to your plugin.

#### On Sector/Split Completed

Sent on every sector/split complete. Message format is as follows:

```cgo
{
  uint8 messageType; // always 150 for sector complete messages
  uint8 carID;       // car ID of car that completed the sector
  uint8 sectorIndex; // sector index just completed (indexed from 0)
  uint32 sectorTime; // the time it took the car to complete the split
  uint8 numCuts;     // the number of cuts in the sector
}
```

#### On Tyre Change

Sent every time a car changes tyre. Note that when cars go into the pits, the game reports
tyre changes even if the user did not request a tyre change nor change their tyre.

```cgo
{
  uint8 messageType;  // always 151 for tyre change messages
  uint8 carID;        // car ID of car that changed tyre
  string currentTyre; // the current tyre that the car changed to. string == uint8 specifying the length, followed by the byte encoded string. 
}
```

#### Ping

Sent whenever Request Ping is received.

*Doesn't require 'Enable Enhanced Reporting'*

```cgo
{
  uint8 messageType; // always 152 for ping messages
  int64 pluginTime; // time that the plugin sent the Request Ping event (unix milliseconds), returned without modification
  int64 serverTime; // server time on receipt of the Request Ping event (unix milliseconds) 
}
```

---

## Credits and Thanks

Assetto Corsa Server Manager would not have been possible without the following people:

* Joseph Elton
* Ilja Jusupov and the incredible Content Manager and Shaders Patch
* The Pizzabab Championship
* Andy from T116
* All of our testers
* The ACSM community, for their feedback, feature requests.
* [ACServerManager](https://github.com/Pringlez/ACServerManager) and its authors, for inspiration and reference on understanding the AC configuration files
* The many libraries and existing pieces of software used by ACSM. Check out the 'About' page in the web interface for more details.
