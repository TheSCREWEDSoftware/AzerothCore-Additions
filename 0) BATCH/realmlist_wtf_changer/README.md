# realmlist_wtf_changer

**File:** `AC_CLI_REALM_CHANGE.bat`

> [!NOTE]
> This is a batch file, meant to be used on Windows.

## What does this do and how?

Changes your `realmlist.wtf` via CMD / CLI, and optionally your locale and video settings in `WTF\config.wtf`.

1. **Realm selection** - a numbered menu of the servers you defined. You pick one and it writes `SET realmlist <your choice>` into `realmlist.wtf`.
2. **Locale selection** (`ASK_FOR_LOCALE=1`) - a numbered menu of the locales installed in your `Data` folder. The realmlist is written to `Data\<Locale>\realmlist.wtf` and `SET locale "<Locale>"` is set in `WTF\config.wtf`.
3. **Video settings** (`VIDEO_SETTINGS=1`) - writes the display mode (`gxWindow`, `gxMaximized`) and resolution (`gxResolution`) to `WTF\config.wtf`.
4. **Optional blocks** - clear the cache, clear the realm name and start the game.

Example:

```
Choose your server:
01 - SET realmlist 127.0.0.1
02 - SET realmlist logon.chromiecraft.com [Current]
03 - SET realmlist 91.98.80.71

Enter 1, 2 or 3 [ENTER = keep logon.chromiecraft.com]: 1
Selected server: 127.0.0.1

Choose your locale:
01 - deDE
02 - enCN
03 - enGB [Current]
...
11 - zhTW

Enter 1 - 11 [ENTER = keep enGB]: 1
Selected locale: deDE

realmlist.wtf change from: "SET realmlist logon.chromiecraft.com" to "SET realmlist 127.0.0.1"
config.wtf change from: SET locale "enGB" to SET locale "deDE"
```

## How to use this

1. Set the path, your servers and the settings in the file (see below).
2. Close the game (the client overwrites `config.wtf` when it exits).
3. Double click the file.
4. Type the number of the server you want and press ENTER, or just ENTER to keep the `[Current]` one.
5. If `ASK_FOR_LOCALE=1`: type the number of the locale and press ENTER, or just ENTER to keep the `[Current]` one.

A wrong choice shows "Invalid choice." and the same menu again.

## How to customise it

### Path and servers

- `REALMLIST_PATH` - full path to your `realmlist.wtf`, for example `C:\Games\WoW\Data\enUS\realmlist.wtf`. `Data\realmlist.wtf` also works, the `Data` folder is found 1 or 2 folders back.
- `option1`, `option2`, ... - the realmlists to pick from. Add more with `option3`, `option4` and so on, the menu updates by itself.

### Settings

| Setting | Values | What it does |
| --- | --- | --- |
| `ASK_FOR_LOCALE` | `1` / `0` | `1` = ask for the locale after the realm. `0` = only write to `REALMLIST_PATH`, the locale in `config.wtf` is not touched. |
| `KNOWN_LOCALES` | list | The 11 locales extracted from the client: `deDE enCN enGB enUS esES esMX frFR koKR ruRU zhCN zhTW`. Only the ones with a folder in `Data` are listed, the rest are shown as "Not installed". Any other `xxYY` folder (e.g. `itIT`) is listed with `[Custom]`. |
| `VIDEO_SETTINGS` | `1` / `0` | `1` = write `DISPLAY_MODE` and the resolution to `config.wtf`. `0` = the video lines in `config.wtf` are not touched. |
| `DISPLAY_MODE` | `1` / `2` / `3` | See the table below. |
| `RES_WIDTH` / `RES_HEIGHT` | e.g. `1920` / `1080` | Written as `SET gxResolution "<Width>x<Height>"`. Leave both empty to not touch it. For `DISPLAY_MODE 3` use your desktop resolution. |

| `DISPLAY_MODE` | Mode | `gxWindow` | `gxMaximized` |
| --- | --- | --- | --- |
| `1` | Fullscreen | `"0"` | `"0"` |
| `2` | Windowed | `"1"` | `"0"` |
| `3` | Windowed Fullscreen (Borderless) | `"1"` | `"1"` |

**Why the video settings?** Some clients/servers show a black screen when you change the resolution or switch to windowed mode from inside the game. Writing these values to `config.wtf` while the game is closed avoids that, the client simply starts with them.

### Optional blocks

At the bottom of the file. Remove the `::` at the start of each line of a block to turn it on (add it back to turn it off). They run in this order:

- **Clear Cache** - deletes the `Cache` folder of the game.
- **Clear Realm Name** - removes the `SET realmName` line from `WTF\config.wtf`, so the client doesn't try the last realm of the previous server.
- **Start World of Warcraft** - runs `Wow.exe`. It's last so the game only starts after every file is written.

## Other Technical Stuff

- Menus are numbered `01`, `02`, ... and both `01` and `1` are accepted. Spaces in what you type are removed (`1 ` = `1`).
- ENTER keeps the `[Current]` choice. The current realmlist is read from the current locale's `realmlist.wtf` (the locale in `config.wtf`) when `ASK_FOR_LOCALE=1`, otherwise from `REALMLIST_PATH`. The current locale is read from `config.wtf`.
- `realmlist.wtf` is overwritten with a single `SET realmlist` line, anything else that was in it is lost. It's written into the chosen locale folder, so each locale folder keeps its own realmlist.
- After writing it shows `realmlist.wtf change from: "<old line>" to "SET realmlist <new>"`.
- Every `config.wtf` value (`locale`, `gxWindow`, `gxMaximized`, `gxResolution`) is replaced in place if its `SET` line exists, otherwise it's added at the end. All other lines are kept. If `config.wtf` doesn't exist it's created. Each change is shown as `config.wtf change from: <old> to <new>`.
- Options must be numbered without gaps (`option1`, `option2`, `option3`). The menu stops at the first missing number and reads up to 50.
- The optional blocks find the game folder by going two folders up from the realmlist path (`Data\<Locale>\realmlist.wtf` -> game folder).

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this folder. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
