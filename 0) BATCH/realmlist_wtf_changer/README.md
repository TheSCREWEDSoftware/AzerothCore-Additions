# realmlist_wtf_changer

**File:** `AC_CLI_REALM_CHANGE.bat`

> [!NOTE]
> This is a batch file, meant to be used on Windows.

## What does this do and how?

Changes your `realmlist.wtf` via CMD / CLI. It shows a numbered menu of the servers you defined, you pick one, and it writes `SET realmlist <your choice>` into the file. The menu is built from the "Define options" part, so adding a server there is all you need to do.

## How to use this

1. Set the path and your servers in the file (see below).
2. Double click it.
3. Type the number of the server you want and press ENTER.

## How to customise it

- `REALMLIST_PATH` - full path to your `realmlist.wtf`, for example `C:\Games\WoW\Data\enUS\realmlist.wtf`.
- `option1`, `option2`, ... - the realmlists to pick from. Add more with `option3`, `option4` and so on, the menu updates by itself.
- Optional blocks at the bottom, remove the `::` at the start of each line of a block to turn it on:
  - **Start World of Warcraft** - runs `Wow.exe` after the realmlist is set.
  - **Clear Cache** - deletes the `Cache` folder of the game.
  - **Clear Realm Name** - removes the `SET realmName` line from `WTF\config.wtf`, so the client doesn't try the last realm of the previous server.

## Other Technical Stuff

- The file is overwritten with a single `SET realmlist` line, anything else that was in `realmlist.wtf` is lost.
- Options must be numbered without gaps (`option1`, `option2`, `option3`). The menu stops at the first missing number and reads up to 50.
- The optional blocks find the game folder by going two folders up from `REALMLIST_PATH` (`Data\<Locale>\realmlist.wtf` -> game folder).
- A wrong number changes nothing and shows "Invalid choice".

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this folder. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
