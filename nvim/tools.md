# 🛠️ Neovim LSP Environment Setup (C/C++ + Python + Go + Rust)

This guide lists all external tools required for a full LSP-based development setup in Neovim.

---

# 📦 Base Requirements

Install core tools:

```bash
# Arch Linux
sudo pacman -S neovim git base-devel curl wget unzip
```

---

# ⚙️ Plugin Manager (lazy.nvim)

Auto-installed via config — no manual step needed.

---

# 🧠 Language Servers (LSP)

## 🔵 C / C++

```bash
sudo pacman -S clang
```

Verify:

```bash
clangd --version
```

Optional (for better IntelliSense):

```bash
sudo pacman -S cmake
```

---

## 🐍 Python

### Install pipx (recommended)

```bash
sudo pacman -S python-pipx
pipx ensurepath
```

### Install Pyright

```bash
pipx install pyright
```

Verify:

```bash
pyright --version
```

---

## 🐹 Go

```bash
sudo pacman -S go
go install golang.org/x/tools/gopls@latest
```

Add to PATH if needed:

```bash
export PATH=$PATH:$(go env GOPATH)/bin
```

Verify:

```bash
gopls version
```

---

## 🦀 Rust

```bash
curl https://sh.rustup.rs -sSf | sh
```

Reload shell:

```bash
source ~/.bashrc
```

Verify:

```bash
rust-analyzer --version
```

---

# 🧩 Optional Tools (Highly Recommended)

## Formatters

```bash
# Python
pipx install black

# C/C++
sudo pacman -S clang

# Go (comes with gofmt)
# Rust (comes with rustfmt)
```

---

## Linters

```bash
# Python (fast and modern)
pipx install ruff

# C/C++
sudo pacman -S cppcheck

# Go
go install golang.org/x/lint/golint@latest
```

---

# 🧠 Build Tools

```bash
sudo pacman -S cmake make
```

---

# 📁 Project-specific setup

## C/C++ (IMPORTANT)

Generate compile commands:

```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .
```

---

## Python

Use virtual environment:

```bash
python -m venv venv
source venv/bin/activate
```

---

# 🔍 Health Checks

Inside Neovim:

```vim
:LspInfo
```

---

# 🚀 Summary

| Language | LSP           | Install Method |
| -------- | ------------- | -------------- |
| C/C++    | clangd        | pacman         |
| Python   | pyright       | pipx           |
| Go       | gopls         | go install     |
| Rust     | rust-analyzer | rustup         |

---

# 🧠 Notes

* Avoid using `pip install` globally (breaks system on Arch)
* Prefer `pipx` or language-specific installers
* Always verify binaries are in PATH

---

# ✅ Done

This setup gives:

* Autocomplete
* Go to definition
* Error diagnostics
* Formatting support

Works across all major languages in Neovim.
