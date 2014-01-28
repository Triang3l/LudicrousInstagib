Ludicrous Instagib
==================

A mod that brings instagib deathmatch to Rise of the Triad.

Every player wields a pistol and a pair of knives that explode enemies into (sometimes ludicrous) gibs on hit.

There are no pickups on the maps except for the Elasto Mode, the Mercury Mode and the Shrooms.

Steam Discussions topic: http://steamcommunity.com/app/217140/discussions/5/540731691341913556/

(If you fall into lava and the crosshair disappears, use the knives and it will appear again - this is a bug in the game itself.)

Installing and running
======================

Download the repository and copy the files in the `ROTTGame` folder to the `My Games/Rise Of The Triad/ROTTGame` folder in your Documents directory.

To join an instagib server, simply install the mod and connect to the server using the server browser.

To start a listen server, select "Instagib Death Match" in the game type drop-down menu on the Host Game screen.

If you want to start a dedicated server, first *insert the contents of `ROTTGame/Config/ROTTInstagib.ini` into `ROTTGame/Config/MultiplayerData.ini` in the game folder under `[ROTTGame_MultiplayerDM ROTTUIDataProvider_GameModeInfo]`*, and then select "Instagib Death Match" in the game type drop-down menu in the dedicated server launcher.

Modifying
=========

In order to rebuild the mod, you need to copy some files to your Rise of the Triad game folder:
* `Development` to the folder's root.
* `ROTTGame/Published/CookedPC/Packages/Archetypes/InstagibArchetypes.upk` to `ROTTGame/Content/Archetypes`.
* `UDKBase.u` to `ROTTGame/Script`.

Then, open `ROTTGame/Config/ROTTEngine.ini` in your game folder using a text editor, and after all `EditPackages` definition add a line containing `EditPackages=ROTTInstagib`.

To compile the scripts, use the `make -nodelete` commandlet of `ROTTEditor.exe`. The `-nodelete` option is important since the tool will try to delete `UDKBase.u`, which is incompatible with Rise of the Triad, but is required to build the mod.

If you do everything correctly, the compilation will end with 1 warning and 1 error about the `UDKBase.u` file. Simply ignore them, it is explained why in the previous paragraph.

To test your changes, close both the server and the clients if you have them running and copy `ROTTGame/Script/ROTTInstagib.u` in the game directory to `My Games/Rise Of The Triad/ROTTGame/Published/Script` in your Documents folder.

If you want to modify the pistol's parameters, you can do it using the LDK UnrealEd in the Content Browser (say "no" to the "script are outdated" message when you launch it). When you're done with editing the `Archetypes/InstagibArchetypes` package, copy it from `Content` to `My Games/Rise Of The Triad/ROTTGame/Published/CookedPC/Packages`.

Feel free to make pull requests if you want to see your changes in this repository.
