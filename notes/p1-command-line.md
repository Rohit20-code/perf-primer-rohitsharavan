# P1.2 – Command Line Essentials (PowerShell and cmd)

Reference: Microsoft Learn module "Introduction to PowerShell".

## 1. What a shell is

- A shell is a program where I type commands and get text back.
- **cmd** (Command Prompt) is the old Windows shell. Commands are plain text: `dir`, `cd`, `set`.
- **PowerShell** is the newer Windows shell. Its commands are *cmdlets* named Verb-Noun (`Get-ChildItem`, `Set-Location`) and they pass **objects**, not just text, through the pipe `|`.
- PowerShell has **aliases** so old commands still work: `dir`, `ls` → `Get-ChildItem`; `cd` → `Set-Location`; `cat`, `type` → `Get-Content`.
- Useful discovery commands in PowerShell:
  - `Get-Command *process*` – find commands by name.
  - `Get-Help Get-ChildItem -Examples` – see how a command is used.
  - `Get-Process | Get-Member` – see what properties an object has.

## 2. Files and folders

| Task | cmd | PowerShell | What it did when I ran it |
|---|---|---|---|
| Show current folder | `cd` (no args) | `pwd` / `Get-Location` | Printed the full path of the folder I am in. |
| List files | `dir` | `dir`, `ls`, `Get-ChildItem` | Listed `a.txt` and `c.txt` in my practice folder. |
| Change folder | `cd demo` | `cd demo` / `Set-Location demo` | Moved into the `demo` folder. `cd ..` goes up one level. |
| Create folder | `mkdir demo` | `mkdir demo` / `New-Item -ItemType Directory demo` | Created the `demo` folder. |
| Create a file | `echo hello from p1.2 > a.txt` | `"hello from p1.2" \| Out-File a.txt` | Created `a.txt` with one line of text. |
| Copy a file | `copy a.txt b.txt` | `Copy-Item a.txt b.txt` | Made `b.txt`, identical to `a.txt`. |
| Move / rename | `move b.txt c.txt` | `Move-Item b.txt c.txt` | `b.txt` disappeared and `c.txt` appeared. |
| Show contents | `type c.txt` | `cat c.txt` / `Get-Content c.txt` | Printed `hello from p1.2`. |
| Delete a file | `del c.txt` | `Remove-Item c.txt` | `c.txt` was gone; only `a.txt` was left. |

Tips:
- Paths with spaces need quotes: `cd "C:\Users\me\OneDrive - psiog.com\Desktop"`.
- Tab completes file and folder names; Up arrow repeats the last command.

## 3. Environment variables and PATH

An **environment variable** is a named value that the shell and any program it starts can read.

| | cmd | PowerShell |
|---|---|---|
| Set | `set GREETING=hello` | `$env:GREETING = "hello"` |
| Read | `echo %GREETING%` | `echo $env:GREETING` |
| List all | `set` | `Get-ChildItem env:` |

Both printed `hello` when I ran them.

- A variable set this way lives only in **that terminal window**. Close it and it is gone. A second terminal does not see it.
- To make it permanent: `setx GREETING hello` (then open a **new** terminal), or System Properties → Environment Variables.
- This course writes commands in cmd style (`set NAME=value`); in PowerShell I use `$env:NAME = "value"`.

**PATH** is a special variable: a `;`-separated list of folders. When I type `git`, Windows searches each PATH folder in order for `git.exe` (or `.cmd`, `.bat`). My PATH had 25 folders.

- See it: `echo %PATH%` (cmd) or `$env:Path -split ';'` (PowerShell).
- Find where a program comes from: `where git` (cmd) or `where.exe git` / `Get-Command git` (PowerShell).
  - `where.exe git` → `C:\Program Files\Git\cmd\git.exe`
  - `where.exe python` → found three, the first one on PATH wins.
  - `where.exe jmeter` → "Could not find files" (JMeter is not installed / not on PATH yet).

## 4. Running programs with arguments and flags

- An **argument** is extra text after the program name; a **flag** (option) is an argument that starts with `-` or `--`.
  - `python --version` → `Python 3.14.3`
  - `git --version` → `git version 2.53.0.windows.1`
  - `git --help` → prints git's usage and common commands.
- **Ctrl+C** stops a running program (e.g. `ping -t localhost` runs forever until Ctrl+C).
- **Redirecting output to a file**: `dir > files.txt 2>&1`
  - `>` sends normal output (stream 1, stdout) to `files.txt`, overwriting it. `>>` appends instead.
  - `2>&1` sends errors (stream 2, stderr) to the same place as stream 1, so errors land in the file too.
  - When I ran it, `files.txt` had 9 lines (the directory listing).

## 5. Two terminals side by side

- Windows Terminal: `Alt+Shift+D` (or `Alt+Shift+=` / `Alt+Shift+-`) splits the pane; `Alt+Arrow` moves between panes.
- VS Code: open the terminal with `` Ctrl+` `` and click the **Split** icon (or `Ctrl+Shift+5`).
- Later tasks: the app runs in one terminal, the load test (JMeter) runs in the other, so I can watch both.

## Self-check

**"You type `jmeter` and get 'not recognized'. What two things do you check?"**

1. **Is JMeter actually installed, and where?** Check the folder exists and that `jmeter.bat` is in its `bin` folder (e.g. `C:\tools\apache-jmeter-5.6.3\bin\jmeter.bat`). Also check Java is installed (`java -version`), because JMeter needs it.
2. **Is that `bin` folder on PATH?** Run `where jmeter` / `echo %PATH%`. If the folder is missing, add it to PATH and **open a new terminal** (an already-open terminal keeps the old PATH). Until then I can run it with its full path.
