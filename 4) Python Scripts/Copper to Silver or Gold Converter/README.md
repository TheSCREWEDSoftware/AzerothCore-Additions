# Copper to Silver or Gold Converter

**File:** `copperToSilverOrGoldConverter.py`

**Created and tested with:** Python 3.12.4

## What does this do and how?

The database stores money in copper (for example `BuyPrice`, `SellPrice` or quest rewards). This script turns a copper value into gold, silver and copper so it is easier to read.

It divides the value: 10000 copper = 1 gold, 100 copper = 1 silver, the rest stays as copper.

## How to use this

Just run the script and insert the value in copper. It will display the gold, silver, and copper value.

```
python copperToSilverOrGoldConverter.py
```

Example:

```
Type the value in copper (or 'q' to quit): 234516
23g 45s 16c
```

It keeps asking for a new value until you type `q`, `quit` or `exit`.

## How to customise it

Nothing to set up. If you want a different output, change the `return f"{gold}g {silver}s {copper}c"` line.

## Other Technical Stuff

- Only whole numbers are accepted. Text or negative values show a message and it asks again.

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this folder. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
