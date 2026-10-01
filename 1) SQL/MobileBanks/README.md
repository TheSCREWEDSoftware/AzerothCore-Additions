# MobileBanks

> [!WARNING]
> Work in progress, not a finished drop-in feature. Right now it only creates the guild bank object and prepares the NPC, nothing spawns the bank yet. See "What is still missing" at the bottom.

**Files:** `search.sql`, `tsg_guildBankQuery.sql`

## What does this do and how?

The goal is a "mobile guild bank": you talk to an NPC, pick an option, and a small Guild Vault appears next to it for a short time.

- `tsg_guildBankQuery.sql` creates the Guild Vault object (half size) and turns the chosen NPC into a gossip + SmartAI NPC.
- `search.sql` is only a helper to find an NPC to use: it lists creatures of type 12 (non-combat pets) that have no script and no AI yet.

## How to use this

1. Run `search.sql` in `acore_world` and pick a creature from the result. It is meant to be used along side [this AoWoW item list](https://wowgaming.altervista.org/aowow/?items=15.2&filter=cr=128;crs=2;crv=0;qu=1:2:3:4:5:6:7#0-2).
2. Put its entry in `@CreatureEntry` inside `tsg_guildBankQuery.sql`.
3. Run `tsg_guildBankQuery.sql` in `acore_world`.

## How to customise it

In the order they are in `tsg_guildBankQuery.sql`:

| Variable | What it is |
|---|---|
| `@ObjectEntry` | Entry of the new guild bank object (`450500`) |
| `@ObjectName` | Name for the object. Not used yet, the INSERT still has `'Guild Vault'` typed in |
| `@ObjectModel` | Display ID of the object (`259`) |
| `@ObjectScale` | Size of the object (`0.50` = half size) |
| `@GossipTextID` | ID for the NPC greeting text. Not used yet |
| `@GossipText` | The greeting text. Not used yet |
| `@GossipMenuID` | ID for the gossip menu. Not used yet |
| `@CreatureEntry` | The NPC that will offer the bank (`32841` by default) |

## Other Technical Stuff

- Tables touched: `gameobject_template` (delete + insert of `@ObjectEntry`) and `creature_template` (adds the gossip flag and sets `AIName` to `SmartAI` on `@CreatureEntry`).
- The object uses `type = 34`, which is the guild bank type.

### What is still missing

- Gossip text, menu and options (guild bank or normal bank).
- The SmartAI that spawns the object next to the NPC and despawns it after a timer (60 or 120 seconds).
- A cooldown on the gossip, if that is possible with conditions.

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this folder. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
