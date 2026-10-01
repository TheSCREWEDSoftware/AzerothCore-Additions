# self_services (Lua/Eluna Script)

> [!NOTE]  
> You will need to have [mod-eluna](https://github.com/azerothcore/mod-eluna) to use this.

Inspired by [55Honey](https://github.com/55Honey)'s script and created for the usage [Chromiecraft](https://www.chromiecraft.com/en/)'s PTR

In my case (for Windows), `lua_scripts` is at the same level / location as the `worldserver.exe` my `mod_eluna.conf` / `mod_LuaEngine.conf` has the `Eluna.ScriptPath = "lua_scripts"`.

You can see a showcase of self services script [here](https://www.youtube.com/watch?v=0ARvJBiEr8c).

It displays an error (for non-gm characters) in the video, no longer an issue.

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

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) from the existing write-up in this project's main README. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
