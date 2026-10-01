# Acore_SendAndBind v2 / sendItemAndBind (Lua/Eluna Script)

> [!NOTE]
> You will need to have [mod-eluna](https://github.com/azerothcore/mod-eluna) to use this.

Originally made by [55Honey](https://github.com/55Honey) and modified by me.

In my case (for Windows), `lua_scripts` is at the same level / location as the `worldserver.exe` my `mod_eluna.conf` / `mod_LuaEngine.conf` has the `Eluna.ScriptPath = "lua_scripts"`.

You can see a showcase of Acore_SendAndBind v2 [here](https://www.youtube.com/watch?v=sE2LwZVG0HE).

You see some errors on the video because I miss-typed the command (being deslexic very good).

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

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) from the existing write-up in this project's main README. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
