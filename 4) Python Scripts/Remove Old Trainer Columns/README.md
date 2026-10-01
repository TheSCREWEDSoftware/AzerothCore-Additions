# Remove Old Trainer Columns

**File:** `removeTrainerColumns.py`

**Created and tested with:** Python 3.12.4

## How to use?

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
- `filename_1.sql`
- `filename_1.sql.diff`

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) from the existing write-up in this project's main README. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
