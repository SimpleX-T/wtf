# wtf — _Write To File_

**`wtf`** is a tiny but mighty UNIX-style CLI tool that lets you easily write or append content to files — with sane defaults, readable syntax, and full support for multi-line input.

> Built for developers who live in the terminal.

---

## Features

- Write to **any file** in any directory
- Append (default) or **overwrite** with `-o` or `--overwrite`
- Support for **multi-line input** via heredocs (`<<EOF`) or piping
- Works in Bash, Zsh, macOS, Linux
- Prevents writing into directories by mistake
- Avoids silent failures with helpful messages
- Safe and scriptable

---

## Installation

### Manual

```bash
curl -s https://raw.githubusercontent.com/SimpleX-T/wtf/main/install.sh | bash
```

Or clone this repo:

```bash
git clone https://github.com/SimpleX-T/wtf.git
cd wtf
chmod +x wtf
sudo mv wtf /usr/local/bin/
```

Usage

```bash
wtf [directory] <filename> [-o|--overwrite] ["content"]
wtf <filename> [-o] <<EOF
wtf <filename> [-o] < file.txt
```

Examples
One-liner (append mode by default):

```bash
wtf .env "NODE_ENV=development"
```

Overwrite file:

```bash
wtf .env -o "NODE_ENV=production"
```

Multi-line input:

```bash
wtf .env <<EOF
SUPABASE_URL=https://xyz.supabase.co
SUPABASE_ANON_KEY=abcd1234
EOF
```

Pipe content:

```bash
echo "LOG_LEVEL=debug" | wtf config.env
```

Write to specific folder:

```bash
wtf ./config settings.json -o '{"debug":true}'
```

Flags
|Flag | Description|
|------|-------------|
|`-o`, `--overwrite` | Overwrite file instead of appending|
|`-h`, `--help` | Show full usage instructions|
|`-v`, `--version` | Print current version|

⚠Quoting Notes
To avoid shell interpreting special characters like $, always quote your strings when using variable-looking content:

```bash
wtf .env "API_KEY=\$MY_SECRET"
```

Or better:

```bash
wtf .env 'API_KEY=$MY_SECRET'
```

This prevents Bash from expanding $MY_SECRET and keeps it literal in the file.

Test Matrix
Shell OS
Bash 4+, Zsh Ubuntu 22+, macOS 12+, WSL

Why "**wtf**"?
Because honestly, sometimes all you want to do is "write to file" — so I made it exactly that.

License
MIT — use it freely, improve it, and send it to someone who still uses nano for one-liners.

Acknowledgment
Glory to God. Code is temporary; His Word endures forever
