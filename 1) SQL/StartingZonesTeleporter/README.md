# StartingZonesTeleporter

> [!WARNING]
> Not everything here is finished:
> - `4_(Optional)_GuildBank.sql` only has Horde locations so far (Kalimdor, Eastern Kingdoms, Isle of Quel'Danas and Hellfire Peninsula). The rest of Outland, Northrend and the whole Alliance side are still missing.
> - `1_TeleporterNPCandSAI.sql` works, but it still has leftover test data at the bottom (one extra NPC spawn with a typed in GUID and a test quest with ID `90000`). See [Other Technical Stuff](#other-technical-stuff) before running it on a live server.

| File | Needed? | What it adds |
|---|---|---|
| `1_TeleporterNPCandSAI.sql` | Yes | The teleporter NPC |
| `2_(Optional)_CapitalPortals.sql` | Optional | Portals to the capitals |
| `3_(Optional)_Mailboxes.sql` | Optional | Mailboxes in the starting zones |
| `4_(Optional)_GuildBank.sql` | Optional | Guild vaults in towns and outposts |
| `5_(Optional)_SouthSeasSpawnPointForAll.sql` | Optional | Every new character starts in the South Seas |

You can see a showcase of the Teleporter by clicking [here](https://www.youtube.com/watch?v=4ZdNJEGGdRs&ab_channel=TheSCREWEDSoftware).

## What does this do and how?

- **Teleporter NPC** - a new NPC standing in every starting zone. Talk to it, pick a starting zone of your faction, confirm, and you are teleported there. Death Knights are not counted, their starting zone is not in the list.
- **Portals** - a portal in every starting zone that takes you to the capital of that race.
- **Mailboxes** - a mailbox in every starting zone.
- **Guild vaults** - a guild bank in a lot of towns and outposts, so you don't need to go to a capital for it.
- **South Seas spawn** - all new characters (all races, both factions) start in the same place in the South Seas instead of their own starting zone. The teleporter NPC and two portals are there too.

How: it is all plain SQL for the [`acore_world`](https://www.azerothcore.org/wiki/database-world) database. The NPC and the portals work with gossip + SmartAI, so there is no core change, no module and no script to install.

## How to use this

1. Run `1_TeleporterNPCandSAI.sql` in your [`acore_world`](https://www.azerothcore.org/wiki/database-world). Without changing the SQL query / file it works out of the box.
2. Run any of the optional files you want. They don't depend on each other, the number is only the order they were made in.
3. Restart the worldserver.

Every file deletes its own rows before inserting them, so you can run the same file again after changing something.

## How the Entry and GUID numbers work

Every file that creates something new gets its own block of 100 numbers, and each new file starts 100 after the one before it. This is what keeps the files from stepping on each other.

| File | Entry (template) | GUID (spawn) | Gossip text / menu |
|---|---|---|---|
| `1_TeleporterNPCandSAI.sql` | `450000` | `5300681` - `5300689` | `20000` / `12000` |
| `2_(Optional)_CapitalPortals.sql` | `550000` - `550007` | `1250500` - `1250509` | `20001` / `12001` - `12008` |
| `3_(Optional)_Mailboxes.sql` | `550100` - `550107` | `1250600` - `1250609` | none |
| `4_(Optional)_GuildBank.sql` | `550200` - `550207` | `1250700` - `1250729` | none |
| `5_(Optional)_SouthSeasSpawnPointForAll.sql` | none | none | none |

A next file would start at Entry `550300` and GUID `1250800`.

The rules behind it:

- **Entry** is the "what" (the NPC or object itself), **GUID** is the "where" (one copy of it placed in the world). The same Entry can be placed many times, each with its own GUID.
- Only the first number of a block is typed in. Everything after it is `first + 1`, `first + 2` and so on, with the real number in a comment next to it. Change the first number and the whole block moves with it.
- A new location always goes at the end of the block with the next free number. Numbers in the middle are never reused or shifted.
- The Entry must exist before something can be spawned with it, so the files always create the template first and the spawns after.
- Horde always comes before Alliance.
- The GUIDs of file 1 are the odd one out. They were taken from NPCs placed in-game before this numbering existed, so they don't follow the blocks of 100.
- If you place something in-game to get its coordinates (`.npc add` / `.gobject add`), the game gives it a GUID of its own. Don't put that GUID in the file. Use the next free number of the block and delete the one you placed in-game, or you end up with two on top of each other.

## How to customise it

If one of the numbers above is already used in your database, change the first number of that block and nothing else.

### The NPC (`1_TeleporterNPCandSAI.sql`)

| Variable | What to change | Wiki |
|---|---|---|
| `@CreatureEntry` | The Entry (of creature) / ID that you want | [`creature_template.entry`](https://www.azerothcore.org/wiki/creature_template) |
| `@CreatureName` | The name you want to give to the creature | [`creature_template.name`](https://www.azerothcore.org/wiki/creature_template) |
| `@CreatureSubName` | The title below the name that appears in < this > | [`creature_template.subname`](https://www.azerothcore.org/wiki/creature_template) |
| `@CreatureModelID` | The Model via the ID you want to use | [`creature_template_model.CreatureDisplayID`](https://www.azerothcore.org/wiki/creature_template_model) |

### The texts (`1_TeleporterNPCandSAI.sql`)

| Variable | What to change | Wiki |
|---|---|---|
| `@GossipText` | What the NPC says when you talk to it | [`npc_text.text0_0`](https://www.azerothcore.org/wiki/npc_text) |
| `@GossipMenuOptionText0` to `8` | The name shown for each destination | [`gossip_menu_option.OptionText`](https://www.azerothcore.org/wiki/gossip_menu_option) |
| `@GossipMenuOptionTextDefaultConfirmation` | The start of the confirmation box ("Teleport to: ") | [`gossip_menu_option.BoxText`](https://www.azerothcore.org/wiki/gossip_menu_option) |

### Where you land (`1_TeleporterNPCandSAI.sql`)

Every destination has `@SmartAIMapID`, `@SmartAITargetX`, `@SmartAITargetY`, `@SmartAITargetZ` and `@SmartAITargetO` with its number at the end. Stand where you want to land, type `.gps` and copy the map, x, y, z and orientation.

### Adding a location to files 2, 3 or 4

1. Stand on the spot in-game and place the object to see how it looks (`.gobject add <entry>`).
2. Add a new GUID variable at the end of the block, with the next number.
3. Add a `DELETE` line and an `INSERT` row for it, copying the map, position and rotation of the object you placed.
4. Delete the object you placed in-game and run the file.

### The South Seas spawn (`5_(Optional)_SouthSeasSpawnPointForAll.sql`)

Each race has its own line with its own position. Change the numbers of a line to move where that race starts. Remove a line and that race keeps its normal starting zone.

## Other Technical Stuff

The numbers at the end of the variables in file 1 are always the same destination:

| Number | Destination | For |
|---|---|---|
| 0 | Valley of Trials | Horde (Orc/Troll) |
| 1 | Deathknell | Horde (Undead) |
| 2 | Red Cloud Mesa | Horde (Tauren) |
| 3 | Sunstrider Isle | Horde (Blood Elf) |
| 4 | Northshire Abbey | Alliance (Human) |
| 5 | Coldridge Valley | Alliance (Dwarf/Gnome) |
| 6 | Shadowglen | Alliance (Night Elf) |
| 7 | Ammen Vale | Alliance (Draenei) |
| 8 | South Seas | Everyone |

### 1_TeleporterNPCandSAI.sql

What it does, in the order of the file:

1. Sets all the variables.
2. Deletes everything this file made before (text, menu, options, conditions, NPC, spawns, SmartAI).
3. Adds the greeting text and the gossip menu.
4. Adds the 9 gossip options, each with a confirmation box.
5. Adds the conditions: options 0 to 3 only show for Horde, 4 to 7 only for Alliance. Option 8 (South Seas) has no condition, everyone sees it.
6. Adds the NPC and its model.
7. Spawns the NPC 9 times, once in every destination.
8. Adds the SmartAI: when an option is picked, teleport the player and close the gossip window.
9. Leftover: spawns one more copy of the NPC behind the barrels of the Lion's Pride Inn (an anti-stuck helper). It uses the typed in GUID `5300692` and Entry `450000` instead of the variables, and it has no `DELETE` before it, so running the file a second time fails on this line.
10. Leftover: a test quest with ID `90000` named "Test", given by creature `6774` and turned in at creature `6749`. It is marked `-- Ignore test` in the file. Remove that part if you don't want it in your database.

<details>
<summary>Variables, in the order of the file</summary>

| Variable | What it is | Wiki |
|---|---|---|
| `@GossipTextID` | ID of the greeting text | [`npc_text.ID`](https://www.azerothcore.org/wiki/npc_text) |
| `@GossipText` | The greeting text | [`npc_text.text0_0`](https://www.azerothcore.org/wiki/npc_text) |
| `@GossipMenuID` | ID of the gossip menu | [`gossip_menu.MenuID`](https://www.azerothcore.org/wiki/gossip_menu) |
| `@GossipMenuOptionID0` to `8` | Number of each option in the menu. Only `0` is typed in, the rest is `0 + N` | [`gossip_menu_option.OptionID`](https://www.azerothcore.org/wiki/gossip_menu_option) |
| `@GossipMenuOptionIcon` | Icon next to every option, `2` is the flight icon | [`gossip_menu_option.OptionIcon`](https://www.azerothcore.org/wiki/gossip_menu_option) |
| `@GossipMenuOptionTextDefaultConfirmation` | Start of the confirmation text, "Teleport to: " | [`gossip_menu_option.BoxText`](https://www.azerothcore.org/wiki/gossip_menu_option) |
| `@GossipMenuOptionText0` to `8` | Name of each destination | [`gossip_menu_option.OptionText`](https://www.azerothcore.org/wiki/gossip_menu_option) |
| `@GossipMenuOptionTextConfirmation0` to `8` | The full confirmation text, made by joining the two above | [`gossip_menu_option.BoxText`](https://www.azerothcore.org/wiki/gossip_menu_option) |
| `@ConditionGossipMenuOptionDefaultMessage` | Start of the condition comment, "Only show teleport: " | [`conditions.Comment`](https://www.azerothcore.org/wiki/conditions) |
| `@ConditionGossipMenuOptionFactionHorde` | End of the condition comment for Horde | [`conditions.Comment`](https://www.azerothcore.org/wiki/conditions) |
| `@ConditionGossipMenuOptionFactionAlliance` | End of the condition comment for Alliance | [`conditions.Comment`](https://www.azerothcore.org/wiki/conditions) |
| `@ConditionGossipMenuOptionComment0` to `7` | The full comment of each condition, made by joining the three above and the destination name. There is no `8`, South Seas has no condition | [`conditions.Comment`](https://www.azerothcore.org/wiki/conditions) |
| `@CreatureEntry` | Entry of the NPC | [`creature_template.entry`](https://www.azerothcore.org/wiki/creature_template) |
| `@CreatureName` | Name of the NPC | [`creature_template.name`](https://www.azerothcore.org/wiki/creature_template) |
| `@CreatureSubName` | Title under the name | [`creature_template.subname`](https://www.azerothcore.org/wiki/creature_template) |
| `@CreatureModelID` | Model of the NPC | [`creature_template_model.CreatureDisplayID`](https://www.azerothcore.org/wiki/creature_template_model) |
| `@SmartAIMapID0` | Map of destination 0 | [`smart_scripts.action_param1`](https://www.azerothcore.org/wiki/smart_scripts) |
| `@SmartAITargetX0` | X of destination 0 | [`smart_scripts.target_x`](https://www.azerothcore.org/wiki/smart_scripts) |
| `@SmartAITargetY0` | Y of destination 0 | [`smart_scripts.target_y`](https://www.azerothcore.org/wiki/smart_scripts) |
| `@SmartAITargetZ0` | Z of destination 0 | [`smart_scripts.target_z`](https://www.azerothcore.org/wiki/smart_scripts) |
| `@SmartAITargetO0` | Direction you face at destination 0 | [`smart_scripts.target_o`](https://www.azerothcore.org/wiki/smart_scripts) |
| `@SmartAIMapID1` ... `@SmartAITargetO8` | The same five variables again for destinations 1 to 8, one group after the other | [`smart_scripts`](https://www.azerothcore.org/wiki/smart_scripts) |
| `@CreatureGUID0` to `8` | GUID of each of the 9 NPC spawns | [`creature.guid`](https://www.azerothcore.org/wiki/creature) |

</details>

### 2_(Optional)_CapitalPortals.sql

What it does, in the order of the file:

1. Sets all the variables.
2. Adds 8 portal objects, one per capital ("Portal to Orgrimmar", "Portal to Undercity" and so on).
3. Adds their faction row ([`gameobject_template_addon`](https://www.azerothcore.org/wiki/gameobject_template_addon)).
4. Adds the portal text and one gossip menu per portal, with a single option and a "Teleport to: ..." confirmation box.
5. Adds the SmartAI: when the option is picked, the portal casts the normal teleport spell of that capital on you and closes the gossip window.
6. Spawns 10 portals. One in each of the 8 starting zones, leading to the capital of that race, plus two in the South Seas: one to Orgrimmar for Horde and one to Stormwind for Alliance.

<details>
<summary>Variables, in the order of the file</summary>

| Variable | What it is | Wiki |
|---|---|---|
| `@GameobjectEntryOrgrimmar` | Entry of the portal to Orgrimmar. First of the block, the only one typed in | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryUndercity` | Entry of the portal to Undercity | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryThunderBluff` | Entry of the portal to Thunder Bluff | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntrySilvermoon` | Entry of the portal to Silvermoon | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryStormwind` | Entry of the portal to Stormwind | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryIronforge` | Entry of the portal to Ironforge | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryDarnassus` | Entry of the portal to Darnassus | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryExodar` | Entry of the portal to Exodar | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectGUID` | First GUID of the block, the only one typed in | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDOrgrimmarValleyOfTrials` | Spawn in Valley of Trials, to Orgrimmar | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDOrgrimmarSouthSeas` | Spawn in the South Seas, to Orgrimmar (Horde) | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDUndercity` | Spawn in Deathknell, to Undercity | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDThunderBluff` | Spawn in Red Cloud Mesa, to Thunder Bluff | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDSilvermoon` | Spawn in Sunstrider Isle, to Silvermoon | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDStormwindNorthshire` | Spawn in Northshire Abbey, to Stormwind | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDStormwindSouthSeas` | Spawn in the South Seas, to Stormwind (Alliance) | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDIronforge` | Spawn in Coldridge Valley, to Ironforge | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDDarnassus` | Spawn in Shadowglen, to Darnassus | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDExodar` | Spawn in Ammen Vale, to Exodar | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GossipTextID` | ID of the portal text | [`npc_text.ID`](https://www.azerothcore.org/wiki/npc_text) |
| `@GossipText` | The portal text, "A shimmering portal. Do you wish to step through?" | [`npc_text.text0_0`](https://www.azerothcore.org/wiki/npc_text) |
| `@GossipMenuID` | First gossip menu ID of the block, the only one typed in | [`gossip_menu.MenuID`](https://www.azerothcore.org/wiki/gossip_menu) |
| `@GossipMenuIDOrgrimmar` to `@GossipMenuIDExodar` | Gossip menu of each portal, same order as the Entries above | [`gossip_menu.MenuID`](https://www.azerothcore.org/wiki/gossip_menu) |

</details>

### 3_(Optional)_Mailboxes.sql

What it does, in the order of the file:

1. Sets all the variables.
2. Adds 8 mailbox objects, one per capital. They all work the same, the difference is the look and the faction of that capital.
3. Adds their faction row ([`gameobject_template_addon`](https://www.azerothcore.org/wiki/gameobject_template_addon)).
4. Spawns 10 mailboxes in the starting zones. No gossip or SmartAI is needed, a mailbox works by itself.

<details>
<summary>Variables, in the order of the file</summary>

| Variable | What it is | Wiki |
|---|---|---|
| `@GameobjectEntryOrgrimmar` | Entry of the Orgrimmar mailbox. First of the block, the only one typed in | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryUndercity` | Entry of the Undercity mailbox | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryThunderBluff` | Entry of the Thunder Bluff mailbox | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntrySilvermoon` | Entry of the Silvermoon mailbox | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryStormwind` | Entry of the Stormwind mailbox | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryIronforge` | Entry of the Ironforge mailbox | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryDarnassus` | Entry of the Darnassus mailbox | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryExodar` | Entry of the Exodar mailbox | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectGUIDOrgrimmar` | Spawn in Valley of Trials. First GUID of the block, the only one typed in | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDUndercity` | Spawn in Deathknell | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDThunderBluff` | Spawn in Red Cloud Mesa | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDSilvermoon` | Spawn in Sunstrider Isle | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDOrgrimmarExtra` | Spawn in Sen'jin Village | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDStormwind` | Spawn in Northshire Abbey | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDIronforge` | Spawn in Coldridge Valley | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDDarnassus` | Spawn in Shadowglen | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDExodar` | Spawn in Ammen Vale, where Draenei start | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDExodarExtra` | Spawn in Ammen Vale, at the Crash Site | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |

</details>

### 4_(Optional)_GuildBank.sql

What it does, in the order of the file:

1. Sets the Entry variables.
2. Adds 8 guild vault objects, one per capital. They all work the same, the difference is the look of that capital.
3. Adds their faction row ([`gameobject_template_addon`](https://www.azerothcore.org/wiki/gameobject_template_addon)), Horde for the first four and Alliance for the last four.
4. Sets the GUID variables.
5. Spawns 30 guild vaults, all on the Horde side for now: 14 in Kalimdor, then 16 in the Eastern Kingdoms, Isle of Quel'Danas and Hellfire Peninsula.

Nothing is spawned in the capitals themselves, and the four Alliance vaults are created but not placed anywhere yet.

<details>
<summary>Variables, in the order of the file</summary>

| Variable | What it is | Wiki |
|---|---|---|
| `@GameobjectEntryOrgrimmar` | Entry of the Orgrimmar style vault. First of the block, the only one typed in | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryUndercity` | Entry of the Undercity style vault | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryThunderBluff` | Entry of the Thunder Bluff style vault | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntrySilvermoon` | Entry of the Silvermoon style vault | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryStormwind` | Entry of the Stormwind style vault | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryIronforge` | Entry of the Ironforge style vault | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryDarnassus` | Entry of the Darnassus style vault | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectEntryExodar` | Entry of the Exodar style vault | [`gameobject_template.entry`](https://www.azerothcore.org/wiki/gameobject_template) |
| `@GameobjectGUIDValormok` | Spawn in Valormok. First GUID of the block, the only one typed in | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDZoramgarOutpost` | Spawn in Zoram'gar Outpost | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDCampMojache` | Spawn in Camp Mojache | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDCampTaurajo` | Spawn in Camp Taurajo | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDBloodhoofVillage` | Spawn in Bloodhoof Village | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDSplintertreePost` | Spawn in Splintertree Post | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDShadowpreyVillage` | Spawn in Shadowprey Village | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDFreewindPost` | Spawn in Freewind Post | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDRazorHill` | Spawn in Razor Hill | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDSenjinVillage` | Spawn in Sen'jin Village | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDBloodvenomPost` | Spawn in Bloodvenom Post | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDCrossroads` | Spawn in Crossroads | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDSunRockRetreat` | Spawn in Sun Rock Retreat | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDHiveRegal` | Spawn in Hive'Regal | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDBrill` | Spawn in Brill | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDTheBulwark` | Spawn in The Bulwark | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDLightsHopeChapel` | Spawn in Light's Hope Chapel | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDTranquillien` | Spawn in Tranquillien | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDFalconwingSquare` | Spawn in Falconwing Square | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDFairbreezeVillage` | Spawn in Fairbreeze Village | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDTheSepulcher` | Spawn in The Sepulcher | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDTarrenMill` | Spawn in Tarren Mill | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDHammerfall` | Spawn in Hammerfall | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDKargath` | Spawn in Kargath | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDRevantuskVillage` | Spawn in Revantusk Village | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDStonard` | Spawn in Stonard | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDGromgolBaseCamp` | Spawn in Grom'gol Base Camp | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDSunsReachHarbor` | Spawn in Sun's Reach Harbor | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDStairOfDestiny` | Spawn in The Stair of Destiny | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |
| `@GameobjectGUIDThrallmar` | Spawn in Thrallmar | [`gameobject.guid`](https://www.azerothcore.org/wiki/gameobject) |

</details>

### 5_(Optional)_SouthSeasSpawnPointForAll.sql

What it does, in the order of the file:

1. Sets the variables.
2. Changes the starting position ([`playercreateinfo`](https://www.azerothcore.org/wiki/playercreateinfo)) of every race to the South Seas, one line per race, Horde first. Death Knights are skipped and keep their own start.

It only changes existing rows, it adds nothing new. That is why this file has no Entry or GUID numbers. It only affects characters created after you run it.

<details>
<summary>Variables, in the order of the file</summary>

| Variable | What it is | Wiki |
|---|---|---|
| `@RaceOrc` | Race ID of Orc (`2`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@RaceUndead` | Race ID of Undead (`5`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@RaceTauren` | Race ID of Tauren (`6`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@RaceTroll` | Race ID of Troll (`8`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@RaceBloodElf` | Race ID of Blood Elf (`10`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@RaceHuman` | Race ID of Human (`1`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@RaceDwarf` | Race ID of Dwarf (`3`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@RaceNightElf` | Race ID of Night Elf (`4`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@RaceGnome` | Race ID of Gnome (`7`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@RaceDraenei` | Race ID of Draenei (`11`) | [`playercreateinfo.race`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@ClassDeathKnight` | Class ID of Death Knight (`6`), the class that is skipped | [`playercreateinfo.class`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@SouthSeasMap` | Map the new start is on (`1`, Kalimdor) | [`playercreateinfo.map`](https://www.azerothcore.org/wiki/playercreateinfo) |
| `@SouthSeasZone` | Zone of the new start (`0`) | [`playercreateinfo.zone`](https://www.azerothcore.org/wiki/playercreateinfo) |

</details>

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this folder. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
