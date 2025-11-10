# AzerothCore Additions

> [!NOTE]  
> You will need to have [AzerothCore](https://github.com/azerothcore/azerothcore-wotlk) to run the below.

---

## BATCH_realmlist_wtf_changer

Allows you to change your realmlist.wtf via CMD / CLI this dynamically updates the option values based on the "Define option" part. You also can run the exe after pressing ENTER if you remove the comments `::` in Optional, for `for` `cd` and `start`. It sets the realmlist than runs the game.

> [!NOTE]  
> This is a batch file, meant to be used on windows.

## CMAKE_source_build_path

Allows you to run (with a defined source and path) via CLI or GUI without having to change the Source or Build manually everytime, useful for people that use more than 1 core and build (being AC or any other core).

> [!NOTE]  
> This is a batch file, meant to be used on windows, You need to have CMAKE System PATH set, otherwise doesn't work, normally when you install CMAKE it should already have the PATH set.

## StartingZonesTeleporter

> [!NOTE]  
> Without changing the SQL query / file it works out of the box.

You can see a showcase of the Teleporter by clicking [here](https://www.youtube.com/watch?v=4ZdNJEGGdRs&ab_channel=TheSCREWEDSoftware). 

<details>

<summary>Click me to see more</summary>

## What does this bring?

- A new NPC that allows you to teleport to all starting zones of your respective faction (not counting for Death Knights).
- Confirmation text before teleportation.
- Customisable experience.

## How do use this?

Download and run the `tsg_query.sql` in your `acore_world`.

## What should I change?

### NPC
- `@CreatureEntry` use the Entry (of creature) / ID that you want.
- `@CreatureName` the name you want to give to the creature.
- `@CreatureSubName` the title below the name that appears in < this >
- `@CreatureModelID` the Model via the ID you want to use.

### Gossip Text

To be finished.

## Variable Indexes

Variables refer to what in the database.

- `@GossipTextID` (npc_text.ID)
- `@GossipText` (npc_text.text0_0)
- `@GossipMenuID` (gossip_menu_option.MenuID)
- `@GossipMenuOptionID0` (gossip_menu_option.OptionID)
- `@GossipMenuOptionIcon` (gossip_menu_option.OptionIcon)
- `@GossipMenuOptionTextDefaultConfirmation` (gossip_menu_option.BoxText)
- `@GossipMenuOptionTextX` (gossip_menu_option.OptionText)
- `@ConditionGossipMenuOptionDefaultMessage` (conditions.Comment)
- `@ConditionGossipMenuOptionFactionHorde`(conditions.Comment)
- `@ConditionGossipMenuOptionFactionAlliance`(conditions.Comment)
- `@CreatureEntry` (creature_template.entry)
- `@CreatureName` (creature_template.name)
- `@CreatureSubName` (creature_template.subname)
- `@CreatureModelID` (creature_template_model.CreatureDisplayID)
- `@SmartAIMapID0` (smart_scripts.action_param1)
- `@SmartAITargetXA` (smart_scripts.target_x)
- `@SmartAITargetYA` (smart_scripts.target_y)
- `@SmartAITargetZA` (smart_scripts.target_z)
- `@SmartAITargetOA` (smart_scripts.target_o)

</details>

---

## self_services (Lua/Eluna Script)

> [!NOTE]  
> You will need to have [mod-eluna](https://github.com/azerothcore/mod-eluna) to use this.

Inspired by [55Honey](https://github.com/55Honey)'s script and created for the usage [Chromiecraft](https://www.chromiecraft.com/en/)'s PTR

In my case (for Windows), `lua_scripts` is at the same level / location as the `worldserver.exe` my `mod_eluna.conf` / `mod_LuaEngine.conf` has the `Eluna.ScriptPath = "lua_scripts"`.

You can see a showcase of self services script [here](https://www.youtube.com/watch?v=0ARvJBiEr8c).

It displays an error (for non-gm characters) in the video, no longer an issue.

<details>

<summary>Click me to see more</summary>

## What does this bring?

- Allows anyone who runs the command to use the service customise, change race or change faction without having gm permissions or running direct queries into the database, this uses the existing gm commands to achieve this and then kicks the player so they use the service(s).


If you run all the three (3) unique commands without using the service after, they have a specific order that they appear as to be used:
`Customisation` -> `Faction Change` -> `Race Change`

## How do use this?

Just drop `self_services.lua` into your `lua_scripts`

In-game commands: `.selfcustomise` | `.selfcustomize` | `.selfchangerace` | `.selfchangefaction`

## What should I change?

`local ENABLE_LOGGING = 0` change the `0` to `1` if you wish to enable logging.
The logging will something like this:

```
[07-16-2025 03:53 PM] Executing: character customize Ada | Ada (GUID: 84) from RYAN4 (Account ID: 7)
[07-16-2025 03:53 PM] Ada used Character Customization | Ada (GUID: 84) from RYAN4 (Account ID: 7)

[07-16-2025 03:54 PM] Executing: character changefaction Ada | Ada (GUID: 84) from RYAN4 (Account ID: 7)
[07-16-2025 03:54 PM] Ada used Faction Change | Ada (GUID: 84) from RYAN4 (Account ID: 7)

[07-16-2025 03:54 PM] Executing: character changerace Ada | Ada (GUID: 84) from RYAN4 (Account ID: 7)
[07-16-2025 03:54 PM] Ada used Race Change | Ada (GUID: 84) from RYAN4 (Account ID: 7)
```

`end, 5000, 1)` change the `5000` to what value you prefer (in millieseconds), this is the time that the script waits before kicking the player, by default is 5 seconds.

The `self_services.lua` is dynamic naming for the log file (will always match, in this case `self_services.log`, and same for `worldserver` output messages).

Want to use all services at once in a macro? (doesn't work while dead be free to change `/say` to something else).

```
/say .selfcustomise
/say .selfchangerace
/say .selfchangefaction
```

</details>

##  Acore_SendAndBind v2 / sendItemAndBind (Lua/Eluna Script)

> [!NOTE]  
> You will need to have [mod-eluna](https://github.com/azerothcore/mod-eluna) to use this.

Originally madeby [55Honey](https://github.com/55Honey) and modified by me.

In my case (for Windows), `lua_scripts` is at the same level / location as the `worldserver.exe` my `mod_eluna.conf` / `mod_LuaEngine.conf` has the `Eluna.ScriptPath = "lua_scripts"`.

You can see a showcase of Acore_SendAndBind v2 [here](https://www.youtube.com/watch?v=sE2LwZVG0HE).

You see some errors on the video because I miss-typed the command (being deslexic very good).

<details>

<summary>Click me to see more</summary>

## What does this bring?

This expands on the original script in the following ways:
- Clearer feedback text upon usage of the command
from:
<img width="776" height="360" alt="image" src="https://github.com/user-attachments/assets/21381335-a8e7-4fab-983a-f9cca18e2322" />

to:
<img width="1050" height="509" alt="image" src="https://github.com/user-attachments/assets/61874935-59b5-4cea-8f94-f93cd4698682" />

Name of the Player (online or offline)
Name of the Item
Name of the person who ran the command (logging purposes)
Message feedback (so you know what you've typed)
Seperation of the useful/human information and technical information

- Improvement to the command parametres
from:
`.senditemandbind $targetGUID $itemID [$amount] [message]`

to
`.senditemandbind $targetGUID or $name $itemID $amount $by [message]`

`by` refers to the person running the command, since if you run this via the terminal it wont tell who did it, by adding a name now it shows on logs) and `name` are both optinal commands.

Also accepts `.sendandbind` as sorter version as the command `.senditemandbind`.


## How do use this?

Just drop `Acore_SendAndBindV2.lua` into your `lua_scripts`

In-game commands: `.senditemandbind` | `.sendandbind` 

## Example how it looks

```
[====07-16-2025 06:17 PM====]
targetGUID = 33 (Testtwo is offline)
item_id = 31100 (Leggings of the Forgotten Protector)
item_amount = 1
executed by: Moo

Sent mail, itemGUID = 3823
UPDATE `item_instance` SET `flags` = `flags` | 1 WHERE `guid` = 3823;
UPDATE `item_instance` SET `owner_guid` = 33 WHERE `guid` = 3823;
Executed UPDATE queries.

[====07-16-2025 06:19 PM====]
targetGUID = 129 (Dade)
item_id = 31100 (Leggings of the Forgotten Protector)
item_amount = 1
executed by: console (ryan)

Sent mail, itemGUID = 3843
Executed SetOwner and SetBinding.

[====07-16-2025 06:20 PM====]
targetGUID = 129 (Dade is offline)
item_id = 31100 (Leggings of the Forgotten Protector)
item_amount = 1
executed by: console (ryan)
message: forgotten pantalones
```

</details>

##  quest_Checker (not finished) (Lua/Eluna Script)

> [!NOTE]  
> You will need to have [mod-eluna](https://github.com/azerothcore/mod-eluna) to use this.

In my case (for Windows), `lua_scripts` is at the same level / location as the `worldserver.exe` my `mod_eluna.conf` / `mod_LuaEngine.conf` has the `Eluna.ScriptPath = "lua_scripts"`.

You can see a showcase of quest_Checker [here (no video yet)]().


<details>

<summary>Click me to see more</summary>

</details>
