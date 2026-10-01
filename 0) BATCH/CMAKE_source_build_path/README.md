# CMAKE_source_build_path

**Files:** `AC_CLI_CMAKE.bat`, `AC_GUI_CMAKE.bat`

> [!NOTE]
> These are batch files, meant to be used on Windows. You need to have CMAKE in your System PATH, otherwise it doesn't work. Normally, when you install CMAKE it should already have the PATH set.

## What does this do and how?

Runs CMake with your source and build folders already filled in, so you don't have to change the Source or Build manually every time. Useful for people that use more than 1 core and build (being AC or any other core).

- `AC_CLI_CMAKE.bat` runs `cmake -S <source> -B <build>` in a CMD window.
- `AC_GUI_CMAKE.bat` opens `cmake-gui` with the same two paths already set.

## How to use this

1. Put your paths in the file you want to use (see below).
2. Double click it.
3. For the CLI one, read the output and press ENTER to close the window.

## How to customise it

- Replace `Your_SOURCE_PATH` with the folder of the core source (the one with `CMakeLists.txt`).
- Replace `Your_BUILD_PATH` with your build folder.
- Keep the quotes around both paths, they are needed if the path has spaces.
- Using more than one core? Copy the file, rename it, and set different paths in each copy.

## Other Technical Stuff

- The CLI file passes anything you type after it straight to CMake (`%*`). Example: `AC_CLI_CMAKE.bat -DTOOLS_BUILD=all`.
- The GUI file uses `start ""`, so the CMD window closes right away and only cmake-gui stays open.

---

> [!NOTE]
> This README was modified by Claude (Anthropic's AI assistant, via Claude Code) using the previous README and the files in this folder. Read every command/query before running it, and treat any example values as placeholders to be replaced with your own.
