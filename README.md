## StartingZonesTeleporter

<details>

<summary>Click me to see more</summary>

> [!NOTE]  
> Without changing the SQL query / file it works out of the box.

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
