
# AzerothCore Additions

> [!NOTE]
> You will need to have [AzerothCore](https://github.com/azerothcore/azerothcore-wotlk) to run the below.

---


## Folder Structure

```
|   README.md
|
|---0) BATCH
|   |---CMAKE_source_build_path
|   |   |   AC_CLI_CMAKE.bat
|   |   |   AC_GUI_CMAKE.bat
|   |
|   |---realmlist_wtf_changer
|       |   AC_CLI_REALM_CHANGE.bat
|
|---1) SQL
|   |---MobileBanks
|   |   |   search.sql
|   |   |   tsg_guildBankQuery.sql
|   |
|   |---StartingZonesTeleporter
|       |   tsg_query.sql
|
|---2) LUA - ELUNA - ALE Scripts
|   |---Acore_SendAndBind
|   |   |   Acore_SendAndBindV2.lua
|   |
|   |---quest_checker
|   |   |   quest_checker.lua
|   |
|   |---self_services
|       |   self_services.lua
|
|---4) Python Scripts
		|---Copper to Silver or Gold Converter
		|   |   copperToSilverOrGoldConverter.py
		|
		|---Remove Old Trainer Columns
				|   removeTrainerColumns.py
```

---

## Disclaimer

This README was updated on 11th of January 2026 with the help of AI (GitHub Copilot) to be less verbose and more structured.

---


## 0) BATCH

### realmlist_wtf_changer
Changes your `realmlist.wtf` via CMD/CLI instead of editing it by hand.
[Read more](<0) BATCH/realmlist_wtf_changer/README.md>)

### CMAKE_source_build_path
Runs CMake with a predefined source and build path via CLI or GUI, without having to change it manually every time.
[Read more](<0) BATCH/CMAKE_source_build_path/README.md>)

---


## 1) SQL

### MobileBanks
SQL queries for the mobile/portable guild bank setup.
[Read more](<1) SQL/MobileBanks/README.md>)

### StartingZonesTeleporter
Adds an NPC that teleports players to all starting zones for their faction.
[Read more](<1) SQL/StartingZonesTeleporter/README.md>)

---


## 2) LUA - ELUNA - ALE Scripts

### self_services (Lua/Eluna Script)
Lets players self-service character customisation, race change, and faction change without GM permissions.
[Read more](<2) LUA - ELUNA - ALE Scripts/self_services/README.md>)

### Acore_SendAndBind v2 / sendItemAndBind (Lua/Eluna Script)
Mails an item to a player and binds it, with clearer feedback and improved command parameters.
[Read more](<2) LUA - ELUNA - ALE Scripts/Acore_SendAndBind/README.md>)

### quest_Checker (Lua/Eluna Script)
Not finished.
[Read more](<2) LUA - ELUNA - ALE Scripts/quest_checker/README.md>)

---

## 4) Python Scripts

### Remove Old Trainer Columns
Strips old trainer columns out of a SQL file.
[Read more](<4) Python Scripts/Remove Old Trainer Columns/README.md>)

### Copper to Silver or Gold Converter
Converts a copper value into gold, silver, and copper.
[Read more](<4) Python Scripts/Copper to Silver or Gold Converter/README.md>)
