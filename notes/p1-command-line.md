# P1.2 – Command Line Essentials (PowerShell and cmd)

What I picked up from the Microsoft Learn "Introduction to PowerShell" module, plus my own practice runs.

## 1. cmd vs PowerShell

A shell is just the window where you type commands and get text back. Windows has two:

- **cmd (Command Prompt):** the old one. Short commands like `dir`, `cd`, `set`.
- **PowerShell:** the newer one. Its commands (called *cmdlets*) are named Verb-Noun, like `Get-ChildItem` or `Set-Location`. The big difference is that when you pipe (`|`) one command into another, PowerShell passes real objects, not just text.

The nice part is that PowerShell keeps aliases for the old commands, so `dir`, `ls`, `cd`, `cat` and `type` all still work.

Three commands that help when I'm stuck in PowerShell:
- `Get-Command *process*`: find a command when I only half remember its name.
- `Get-Help Get-ChildItem -Examples`: show me how to use it.
- `Get-Process | Get-Member`: show what properties the output has.

## 2. Moving around and handling files

I made a practice folder and tried each of these:

| What I wanted | cmd | PowerShell | What happened |
|---|---|---|---|
| Where am I? | `cd` | `pwd` | Printed the full path of my current folder. |
| What's in here? | `dir` | `dir` / `ls` | Listed `a.txt` and `c.txt`. |
| Go into a folder | `cd demo` | `cd demo` | Moved into `demo`. `cd ..` goes back up. |
| Make a folder | `mkdir demo` | `mkdir demo` | Created `demo`. |
| Make a file | `echo hello from p1.2 > a.txt` | `"hello from p1.2" \| Out-File a.txt` | Created `a.txt` with one line in it. |
| Copy a file | `copy a.txt b.txt` | `Copy-Item a.txt b.txt` | Got a `b.txt` identical to `a.txt`. |
| Move / rename | `move b.txt c.txt` | `Move-Item b.txt c.txt` | `b.txt` was gone, `c.txt` appeared. |
| Read a file | `type c.txt` | `cat c.txt` | Printed `hello from p1.2`. |
| Delete a file | `del c.txt` | `Remove-Item c.txt` | `c.txt` deleted; only `a.txt` left. |

Small things that save time:
- If a path has spaces, wrap it in quotes: `cd "C:\Users\me\OneDrive - psiog.com\Desktop"`.
- **Tab** autocompletes file and folder names. **Up arrow** brings back the last command.

## 3. Environment variables and PATH

An environment variable is a named value that the terminal, and any program started from it, can read.

| | cmd | PowerShell |
|---|---|---|
| Set it | `set GREETING=hello` | `$env:GREETING = "hello"` |
| Read it | `echo %GREETING%` | `echo $env:GREETING` |
| See all | `set` | `Get-ChildItem env:` |

Both printed `hello` for me.

The catch: a variable set like this only lives in **that one terminal window**. Close it and it's gone, and a second window won't see it either. To make it stick, use `setx GREETING hello` (and open a new terminal), or set it in System Properties → Environment Variables.

The course writes commands cmd-style (`set NAME=value`), so when I'm in PowerShell I translate to `$env:NAME = "value"`.

**PATH** is the important one. It's a list of folders separated by `;`. When I type `git`, Windows walks through those folders in order looking for `git.exe`. If it doesn't find it in any of them, you get "not recognized". Mine has 25 folders.

- See it: `echo %PATH%` (cmd) or `$env:Path -split ';'` (PowerShell, one folder per line, much easier to read).
- Find where a command lives: `where git` (cmd) or `where.exe git` / `Get-Command git` (PowerShell).

What I got:
- `where.exe git` → `C:\Program Files\Git\cmd\git.exe`
- `where.exe python` → three different Pythons! Whichever comes first on PATH is the one that runs.
- `where.exe jmeter` → "Could not find files". JMeter isn't installed or isn't on PATH yet.

## 4. Arguments, flags, stopping and saving output

Anything after the program name is an **argument**. Arguments starting with `-` or `--` are usually called **flags** or options.

- `python --version` → `Python 3.14.3`
- `git --version` → `git version 2.53.0.windows.1`
- `git --help` → a list of git's common commands

**Ctrl+C** stops whatever is running. I tried it on `ping -t localhost`, which otherwise pings forever.

**Saving output to a file:** `dir > files.txt 2>&1`
- `>` writes the normal output into `files.txt` (overwriting it). `>>` would add to the end instead.
- `2>&1` means "send errors to the same place as normal output", so any error messages end up in the file too instead of on screen.
- My `files.txt` came out with 9 lines of directory listing.

## 5. Two terminals side by side

This matters later, when the app runs in one terminal and the load test runs in the other.

- **Windows Terminal:** `Alt+Shift+D` splits the pane; `Alt+Arrow` jumps between panes.
- **VS Code:** open the terminal with `` Ctrl+` ``, then hit the split icon (or `Ctrl+Shift+5`).

## Self-check

**"You type `jmeter` and get 'not recognized'. What two things do you check?"**

1. **Is JMeter actually installed?** Check that the folder exists and that `bin\jmeter.bat` is inside it (e.g. `C:\tools\apache-jmeter-5.6.3\bin`). While I'm at it, `java -version` to make sure Java is there, because JMeter won't run without it.
2. **Is its `bin` folder on PATH?** Run `where jmeter` or look through `echo %PATH%`. If it's not there, add it, then **open a new terminal**, because the one already open still has the old PATH. In the meantime I can always run it using the full path.
