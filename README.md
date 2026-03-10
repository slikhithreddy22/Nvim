# 🦾 Neovim Config

A minimal, fast Neovim setup with file explorer, LazyGit, GitHub Copilot, LSP autocompletion, and a clean Gruvbox theme.

---

## 📦 Requirements

| Requirement | Why |
|-------------|-----|
| Neovim >= 0.10 | Core |
| Git | Plugin manager & LazyGit |
| Node.js >= 18 | GitHub Copilot |
| [Nerd Font](https://www.nerdfonts.com/) | Icons (recommended: JetBrainsMono Nerd Font) |
| ripgrep | Telescope live grep (`brew install ripgrep` / `apt install ripgrep`) |

---

## 🚀 Installation

```bash
# 1. Back up existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# 2. Clone this repo
git clone https://github.com/slikhithreddy22/Nvim.git ~/.config/nvim

# 3. Open Neovim — plugins install automatically
nvim
```

On first launch, [lazy.nvim](https://github.com/folke/lazy.nvim) will install all plugins automatically. Wait for it to finish, then restart nvim.

---

## 📁 File Structure

```
~/.config/nvim/
├── init.lua          # Core settings & keymaps
└── lua/
    └── plugins.lua   # All plugins (managed by lazy.nvim)
```

---

## 🔐 GitHub Copilot Setup

After installing, authenticate Copilot:

```
:Copilot auth
```

Follow the browser prompt to log in with your GitHub account.  
Requires an active [GitHub Copilot](https://github.com/features/copilot) subscription.

---

## 🌐 Adding LSP for Any Language

This config uses **Mason** — a GUI installer for language servers.  
You never need to touch any config file to add a new language.

```
:Mason
```

1. Press `/` to search (e.g. `python`, `rust`, `go`)
2. Press `i` on a server to install it
3. Restart nvim — it's automatically enabled

That's it. No config changes needed.

### Common language servers to search in `:Mason`

| Language | Server name to search |
|----------|-----------------------|
| Python | `pyright` |
| JavaScript / TypeScript | `ts_ls` |
| Lua | `lua_ls` |
| Bash | `bashls` |
| Go | `gopls` |
| Rust | `rust_analyzer` |
| C / C++ | `clangd` |
| Java | `jdtls` |
| HTML | `html` |
| CSS | `cssls` |
| JSON | `jsonls` |

---

## ⌨️ Keybindings

> **Leader key = `Space`**  
> Press `Space` and wait — a popup shows all available keybinds automatically.

---

### 📂 Files & Explorer

| Key | Action |
|-----|--------|
| `Space e` | Toggle file explorer |
| `Space ff` | Find files (fuzzy search) |
| `Space fg` | Live grep (search text in project) |
| `Space fb` | Browse open buffers |
| `Enter` (in tree) | Open file |
| `a` (in tree) | Create new file / folder |
| `d` (in tree) | Delete file |
| `r` (in tree) | Rename file |

---

### 🗂️ Buffers & Windows

| Key | Action |
|-----|--------|
| `Shift+L` | Next buffer |
| `Shift+H` | Previous buffer |
| `Space x` | Close current buffer |
| `Ctrl+h` | Move to left window |
| `Ctrl+l` | Move to right window |
| `Ctrl+j` | Move to window below |
| `Ctrl+k` | Move to window above |
| `:vs` | Vertical split |
| `:sp` | Horizontal split |

---

### 💾 Save & Quit

| Key | Action |
|-----|--------|
| `Ctrl+S` | Save (works in Normal & Insert mode) |
| `Space w` | Save file |
| `Space q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Force quit without saving |
| `:wa` | Save all open buffers |

---

### 🔍 Selection

| Key | Action |
|-----|--------|
| `Ctrl+A` | Select all (works in Normal & Insert mode) |
| `v` | Start visual selection |
| `V` | Select entire line |
| `Ctrl+v` | Block / column select |

---

### 🌿 Git

| Key | Action |
|-----|--------|
| `Space g` | Open LazyGit |
| `]c` | Jump to next git change (hunk) |
| `[c` | Jump to previous git change (hunk) |

**Inside LazyGit:**

| Key | Action |
|-----|--------|
| `Space` | Stage file / hunk |
| `c` | Commit |
| `P` | Push |
| `p` | Pull |
| `b` | Branches |
| `q` | Close LazyGit |

---

### 🤖 GitHub Copilot

| Key | Action |
|-----|--------|
| `Tab` | Accept suggestion |
| `Ctrl+Right` | Accept next word only |
| `Ctrl+l` | Accept entire line |
| `Alt+]` | Next suggestion |
| `Alt+[` | Previous suggestion |
| `Ctrl+]` | Dismiss suggestion |
| `Space cp` | Toggle Copilot on / off |

> Copilot status is shown in the statusline: `󰚩 on` / `󰚩 off`

---

### 🧠 LSP & Autocompletion

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Trigger completion manually |
| `Ctrl+j` | Select next suggestion |
| `Ctrl+k` | Select previous suggestion |
| `Enter` | Accept selected suggestion |
| `Ctrl+d` | Scroll docs down |
| `Ctrl+u` | Scroll docs up |
| `gd` | Go to definition |
| `K` | Show hover documentation |
| `gr` | Show references |
| `:Mason` | Install / manage LSP servers |

---

### ✏️ Editing

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc` (visual) | Toggle block comment |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `ciw` | Change inner word |
| `yiw` | Copy (yank) inner word |
| `diw` | Delete inner word |
| `=` (visual) | Auto-indent selection |
| `>` / `<` | Indent / dedent |

---

### 🧭 Navigation

| Key | Action |
|-----|--------|
| `gg` / `G` | Jump to top / bottom of file |
| `Ctrl+d` | Half page down |
| `Ctrl+u` | Half page up |
| `%` | Jump to matching bracket |
| `*` | Search word under cursor |
| `/` | Search forward |
| `n` / `N` | Next / previous search result |
| `Esc` | Clear search highlight |
| `:{n}` | Jump to line number (e.g. `:42`) |

---

### 🔡 Modes

| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `o` | New line below & insert |
| `O` | New line above & insert |
| `v` | Visual mode |
| `V` | Visual line mode |
| `Ctrl+v` | Visual block mode |
| `Esc` | Return to Normal mode |

---

### 🔌 Plugin Management

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Install & update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy update` | Update all plugins |
| `:checkhealth` | Diagnose Neovim issues |

---

## 🧩 Plugins Used

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Colorscheme |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Git UI |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP support |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP server installer |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | GitHub Copilot |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git diff in gutter |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybind popup |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Easy commenting |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto close brackets |

---

## 🎨 Changing the Theme

Replace the gruvbox block in `plugins.lua` with any theme. Popular options:

| Theme | Plugin |
|-------|--------|
| Tokyo Night | `folke/tokyonight.nvim` |
| Catppuccin | `catppuccin/nvim` |
| Kanagawa | `rebelot/kanagawa.nvim` |
| Nord | `shaunsingh/nord.nvim` |
| Nightfox | `EdenEast/nightfox.nvim` |

---

## 🐛 Troubleshooting

**`(global) vim: unknown` error on startup**  
A line in `init.lua` is cut off or has a stray character. Check that every `vim.opt.*` line is complete with no missing quotes or values.

**Copilot not working?**
```
:Copilot auth
```
Make sure Node.js >= 18 is installed: `node --version`

**LSP not working after `:Mason` install?**
```
:checkhealth lsp
```
Restart nvim after installing a server via Mason.

**Icons not showing?**  
Install a Nerd Font and set it as your terminal font. Download from [nerdfonts.com](https://www.nerdfonts.com/).

**Swap file warning (E325)?**  
Add `vim.opt.swapfile = false` to `init.lua`, then run:
```bash
rm -rf ~/.local/state/nvim/swap/
```
