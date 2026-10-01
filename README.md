# AzerothCore Additions

> [!NOTE]
> You will need to have [AzerothCore](https://github.com/azerothcore/azerothcore-wotlk) to run the below.

> [!WARNING]
> Not everything here is finished:
> - **MobileBanks** is a work in progress, the gossip option and the SmartAI that spawns the bank are still missing.
> - **StartingZonesTeleporter** works, but its optional guild bank file only covers Horde locations so far and the main file still has some leftover test data at the bottom.
>
> Each sub-folder README says what is missing.

---

## Folder Structure

<details>
<summary>Click me to see more</summary>

```
|   README.md
|
|---0) BATCH
|   |---CMAKE_source_build_path
|   |   |   AC_CLI_CMAKE.bat
|   |   |   AC_GUI_CMAKE.bat
|   |   |   README.md
|   |
|   |---realmlist_wtf_changer
|       |   AC_CLI_REALM_CHANGE.bat
|       |   README.md
|
|---1) SQL
|   |---MobileBanks
|   |   |   README.md
|   |   |   search.sql
|   |   |   tsg_guildBankQuery.sql
|   |
|   |---StartingZonesTeleporter
|       |   1_TeleporterNPCandSAI.sql
|       |   2_(Optional)_CapitalPortals.sql
|       |   3_(Optional)_Mailboxes.sql
|       |   4_(Optional)_GuildBank.sql
|       |   5_(Optional)_SouthSeasSpawnPointForAll.sql
|       |   README.md
|
|---2) LUA - ELUNA - ALE Scripts
|   |---Acore_SendAndBind
|   |   |   Acore_SendAndBindV2.lua
|   |   |   README.md
|   |
|   |---self_services
|       |   README.md
|       |   self_services.lua
|
|---4) Python Scripts
    |---Copper to Silver or Gold Converter
    |   |   copperToSilverOrGoldConverter.py
    |   |   README.md
    |
    |---Remove Old Trainer Columns
        |   README.md
        |   removeTrainerColumns.py
```

</details>

---

## 0) BATCH

### [realmlist_wtf_changer](<0) BATCH/realmlist_wtf_changer/README.md>)
Changes your `realmlist.wtf` from a small CMD menu instead of editing the file by hand.

### [CMAKE_source_build_path](<0) BATCH/CMAKE_source_build_path/README.md>)
Runs CMake (CLI or GUI) with your source and build paths already filled in.

---

## 1) SQL

### [MobileBanks](<1) SQL/MobileBanks/README.md>)
A guild bank that an NPC can spawn for you. Work in progress.

### [StartingZonesTeleporter](<1) SQL/StartingZonesTeleporter/README.md>)
An NPC in every starting zone that teleports you to the other starting zones of your faction, plus optional portals, mailboxes, guild banks and a shared spawn point.

---

## 2) LUA - ELUNA - ALE Scripts

### [self_services](<2) LUA - ELUNA - ALE Scripts/self_services/README.md>)
Lets players customise, race change or faction change their own character with a command, no GM needed.

### [Acore_SendAndBind v2](<2) LUA - ELUNA - ALE Scripts/Acore_SendAndBind/README.md>)
Mails an item to a player (online or offline) and makes it soulbound, with clear feedback and logging.

---

## 4) Python Scripts

### [Remove Old Trainer Columns](<4) Python Scripts/Remove Old Trainer Columns/README.md>)
Removes the old trainer columns from `creature_template` statements in a SQL file.

### [Copper to Silver or Gold Converter](<4) Python Scripts/Copper to Silver or Gold Converter/README.md>)
Turns a copper value into gold, silver and copper.

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this repository. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
