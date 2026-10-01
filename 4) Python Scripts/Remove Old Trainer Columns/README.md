# Remove Old Trainer Columns

**File:** `removeTrainerColumns.py`

**Created and tested with:** Python 3.12.4

## What does this do and how?

AzerothCore removed the trainer columns from `creature_template`, so older SQL files that still have them fail to run. This script removes those columns and their values for you.

It reads your SQL file, finds every `INSERT INTO creature_template` that has a column list, drops these four columns and the matching value from every row, and saves the result as a new file:

- `trainer_type`
- `trainer_spell`
- `trainer_class`
- `trainer_race`

Your original file is never changed.

## How to use this

**Using CLI:**

```
python pathOfPythonFile SQLfileName
```
(The SQL file is expected to be in the same place as the Python script.)

You can also just go into the path directly and just run both file names:

```
C:\Users\Ryan Turner\Desktop>python removeTrainerColumns.py myTest.sql
> Modified file: myTest_1.sql
> Diff file: myTest_1.sql.diff
```

This generates 2 files:
- `filename_1.sql` - the cleaned SQL
- `filename_1.sql.diff` - what was changed, so you can check it before running the SQL

## How to customise it

- `FIELDS_TO_REMOVE` at the top of the script is the list of columns to remove. Add or remove names there if you need other columns gone.

## Other Technical Stuff

- Only `creature_template` statements are touched, everything else in the file is copied as it is.
- An INSERT without a column list is left alone, the script can't know which value belongs to which column.
- If `filename_1.sql` already exists it uses `_2`, `_3` and so on, it never overwrites.
- Files are read and written as UTF-8.

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this folder. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
