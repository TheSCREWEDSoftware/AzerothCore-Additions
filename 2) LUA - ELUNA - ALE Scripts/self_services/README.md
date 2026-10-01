# self_services (Lua/Eluna Script)

**File:** `self_services.lua`

> [!NOTE]
> You will need to have [mod-eluna](https://github.com/azerothcore/mod-eluna) to use this.

Inspired by [55Honey](https://github.com/55Honey)'s script and created for the usage of [Chromiecraft](https://www.chromiecraft.com/en/)'s PTR.

You can see a showcase of the self services script [here](https://www.youtube.com/watch?v=0ARvJBiEr8c). It displays an error (for non-gm characters) in the video, that is no longer an issue.

## What does this do and how?

Allows any player to customise, change race or change faction of their own character with a command, without having gm permissions and without running queries in the database.

It uses the existing gm commands (`character customize`, `character changerace`, `character changefaction`), runs them from the server side for the player that typed the command, saves the character and then kicks the player after 5 seconds so the service shows up on the character screen.

## How to use this

1. Drop `self_services.lua` into your `lua_scripts`.
2. Restart the worldserver or reload Eluna.
3. Type one of the commands in-game:

| Command | Service |
|---|---|
| `.selfcustomise` or `.selfcustomize` | Character Customisation |
| `.selfchangerace` | Race Change |
| `.selfchangefaction` | Faction Change |

If you run all three before logging back in, they are used in this order: `Customisation` -> `Faction Change` -> `Race Change`

Want to use all services at once in a macro? (doesn't work while dead, be free to change `/say` to something else)

```
/say .selfcustomise
/say .selfchangerace
/say .selfchangefaction
```

## How to customise it

- `local ENABLE_LOGGING = 0` - change the `0` to `1` if you wish to enable logging.
- `end, 5000, 1)` - change the `5000` to the value you prefer (in milliseconds). This is the time the script waits before kicking the player, by default 5 seconds. The message "You will be disconnected in 5 seconds..." is plain text, change it too if you change the time.

## Other Technical Stuff

- In my case (for Windows), `lua_scripts` is at the same level / location as the `worldserver.exe` and my `mod_eluna.conf` / `mod_LuaEngine.conf` has `Eluna.ScriptPath = "lua_scripts"`.
- The commands only work in-game. From the worldserver console they answer "This command can only be used in-game by players."
- The log file is named after the script and is created next to it. `self_services.lua` writes `self_services.log`, rename the script and the log name follows. The `worldserver` output uses the `[SelfServices]` prefix.
- The logging will look something like this:

```
[07-16-2025 03:53 PM] Executing: character customize Ada | Ada (GUID: 84) from RYAN4 (Account ID: 7)
[07-16-2025 03:53 PM] Ada used Character Customization | Ada (GUID: 84) from RYAN4 (Account ID: 7)

[07-16-2025 03:54 PM] Executing: character changefaction Ada | Ada (GUID: 84) from RYAN4 (Account ID: 7)
[07-16-2025 03:54 PM] Ada used Faction Change | Ada (GUID: 84) from RYAN4 (Account ID: 7)

[07-16-2025 03:54 PM] Executing: character changerace Ada | Ada (GUID: 84) from RYAN4 (Account ID: 7)
[07-16-2025 03:54 PM] Ada used Race Change | Ada (GUID: 84) from RYAN4 (Account ID: 7)
```

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this folder. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
