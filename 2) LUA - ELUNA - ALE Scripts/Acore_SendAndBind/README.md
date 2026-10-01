# Acore_SendAndBind v2 / sendItemAndBind (Lua/Eluna Script)

**File:** `Acore_SendAndBindV2.lua`

> [!NOTE]
> You will need to have [mod-eluna](https://github.com/azerothcore/mod-eluna) to use this.

Originally made by [55Honey](https://github.com/55Honey) and modified by me.

You can see a showcase of Acore_SendAndBind v2 [here](https://www.youtube.com/watch?v=sE2LwZVG0HE). You see some errors on the video because I miss-typed the command.

## What does this do and how?

Sends an item by mail to a character and makes it soulbound to that character, so it can't be traded or sold on. Made for things like shop or reward items.

It works for online and offline characters, by name or by GUID. If the character is online the script sets the owner and the binding on the item directly, if it is offline it does it with two `UPDATE` queries on `item_instance`. Everything is written to a log file.

## How to use this

1. Drop `Acore_SendAndBindV2.lua` into your `lua_scripts`.
2. Restart the worldserver or reload Eluna.
3. Use the command in-game or in the worldserver console:

```
.senditemandbind $target $itemID [$amount] [by] [message]
.sendandbind $target $itemID [$amount] [by] [message]
```

| Part | What it is |
|---|---|
| `$target` | Character name or character GUID |
| `$itemID` | Entry of the item |
| `$amount` | How many, optional |
| `by` | Name of who is running the command, optional. Only needed from the console, since the console can't tell who typed it. It shows up in the log |
| `message` | Text for the mail, optional |

Typing the command without parameters, or with `help`, shows the syntax.

## How to customise it

Config block at the top of the file:

| Setting | What it is |
|---|---|
| `Config.subject` | Subject of the mail (`"Shop Item"`) |
| `Config.message` | Default text of the mail (empty) |
| `Config.minGMRankForSend` | Minimum GM rank to use the command in-game (`2`) |

Nothing below the `NO ADJUSTMENTS REQUIRED BELOW THIS LINE` line needs to be changed.

## Other Technical Stuff

- In my case (for Windows), `lua_scripts` is at the same level / location as the `worldserver.exe` and my `mod_eluna.conf` / `mod_LuaEngine.conf` has `Eluna.ScriptPath = "lua_scripts"`.
- The log file is `send-and-bind.log`, created next to the script.
- Items which are Bind on Equip by default will arrive soulbound in the mail.
- Using a webshop? Change the `.send mail` it uses to `.senditemandbind`.

### What changed from the original script

Clearer feedback text upon usage of the command, from:

<img width="776" height="360" alt="image" src="https://github.com/user-attachments/assets/21381335-a8e7-4fab-983a-f9cca18e2322" />

to:

<img width="1050" height="509" alt="image" src="https://github.com/user-attachments/assets/61874935-59b5-4cea-8f94-f93cd4698682" />

- Name of the Player (online or offline)
- Name of the Item
- Name of the person who ran the command (logging purposes)
- Message feedback (so you know what you've typed)
- Separation of the useful/human information and the technical information

Improvement to the command parameters, from:

`.senditemandbind $targetGUID $itemID [$amount] [message]`

to:

`.senditemandbind $targetGUID or $name $itemID $amount $by [message]`

It also accepts `.sendandbind` as a shorter version of `.senditemandbind`.

### Example of how the log looks

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
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this folder. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
