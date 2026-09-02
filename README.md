# HIKIUVIM

Personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).  
Theme: [oxocarbon.nvim](https://github.com/nyoom-engineering/oxocarbon.nvim) · Leader: `Space`

---

## Requirements

- **Neovim** >= 0.9
- **Git** (for lazy.nvim bootstrap and telescope git integration)
- **A Nerd Font** (for icons in alpha, lualine, nvim-tree, telescope)
- **`ripgrep`** — required for telescope live grep (`brew install ripgrep`)
- **Node.js** — required by several LSP servers (`ts_ls`, `html`, `cssls`, etc.)
- **`trash`** — optional, for nvim-tree trash support (`brew install trash`)
- **Kitty terminal** — optional, for inline markdown images (uses the Kitty graphics protocol)
- **ImageMagick** (`magick`) — optional, image processing for `image.nvim` (`brew install imagemagick`)
- **`mmdc`** — optional, renders mermaid diagrams (`npm i -g @mermaid-js/mermaid-cli`)

---

## Installation

```bash
# Back up any existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this config
git clone https://github.com/hikiuzrx/nvim ~/.config/nvim

# Open Neovim — lazy.nvim bootstraps itself automatically
nvim
```

On first launch, lazy.nvim clones itself and installs all plugins. After that:

```vim
:Lazy sync
```

Mason auto-installs all declared language servers. You can also open the installer UI manually:

```vim
:Mason
```

---

## File Structure

```
nvim/
├── init.lua                     # Entry point — sets leader, enables colors, loads hiki module
├── colors.lua                   # Standalone colorscheme loader (also loaded via hiki)
├── lua/hiki/
│   ├── init.lua                 # Loads options, lazy, remap, colors in order
│   ├── lazy.lua                 # All plugin declarations (lazy.nvim)
│   ├── remap.lua                # Global keymaps
│   ├── options.lua              # Core editor settings (tabs, search, clipboard, etc.)
│   ├── colors.lua               # Colorscheme + transparent background
│   └── treesitter.lua           # Treesitter module (loaded via lazy build)
└── after/plugin/                # Per-plugin configuration, loaded after plugins initialize
    ├── alpha.lua                # Dashboard layout and buttons
    ├── autopairs.lua            # Auto-close brackets/quotes
    ├── cmp.lua                  # Completion engine and sources
    ├── conform.lua              # Format-on-save configuration
    ├── discord.lua              # Discord Rich Presence
    ├── fidget.lua               # LSP progress spinner
    ├── gitsigns.lua             # Git gutter signs and hunk actions
    ├── harpoon.lua              # File marks and quick switching
    ├── lsp.lua                  # Mason + LSP servers + diagnostics
    ├── lualine.lua              # Status line theme
    ├── markdown.lua             # In-buffer markdown preview (markview + image + diagram)
    ├── nvim-tree.lua            # File explorer
    ├── persistence.lua          # Session save/restore
    ├── telescope.lua            # Fuzzy finder layout and keymaps
    ├── terminal.lua             # ToggleTerm + .env loader
    ├── treesitter.lua           # Parser list and incremental selection
    ├── undotree.lua             # Undo history visualizer
    └── whichkey.lua             # Keybinding hint popup
```

---

## Editor Settings

Configured in `lua/hiki/options.lua`:

| Setting | Value | Effect |
|---------|-------|--------|
| `number` + `relativenumber` | true | Hybrid line numbers |
| `tabstop` / `shiftwidth` | 4 | 4-space indentation |
| `expandtab` | true | Spaces instead of tabs |
| `smartindent` | true | Context-aware auto-indent |
| `wrap` | false | No line wrapping |
| `ignorecase` + `smartcase` | true | Case-insensitive search unless uppercase used |
| `hlsearch` | false | Don't highlight search matches persistently |
| `incsearch` | true | Highlight as you type |
| `termguicolors` | true | Full 24-bit color |
| `scrolloff` | 8 | Keep 8 lines of context above/below cursor |
| `signcolumn` | "yes" | Always show sign column (no layout jump) |
| `updatetime` | 50 | Faster CursorHold events (ms) |
| `clipboard` | "unnamedplus" | Sync with system clipboard |
| `undofile` | true | Persistent undo across sessions |
| `swapfile` / `backup` | false | No swap or backup files |

---

## Colorscheme

`lua/hiki/colors.lua` loads **oxocarbon** with a forced transparent background:

```lua
vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
```

The status line uses the `poimandres` lualine theme, which complements the oxocarbon palette.

---

## Plugin Overview

### Package Manager

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager with lazy-loading, lockfile, and a built-in UI (`:Lazy`). Bootstraps itself from git on first launch. |

---

### Theme & UI

| Plugin | Purpose |
|--------|---------|
| [oxocarbon.nvim](https://github.com/nyoom-engineering/oxocarbon.nvim) | Dark IBM-inspired colorscheme. Loaded with `priority = 1000`. Transparent background applied after load. |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File-type icons. Requires a Nerd Font. Used by alpha, lualine, nvim-tree, and telescope. |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Startup dashboard showing the HIKIUVIM ASCII header and quick-action buttons. |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line. Uses the `poimandres` theme. |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Vertical indent guide lines. Pinned to `v2.20.8`. |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | Displays LSP server progress in the bottom-right corner. |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Shows a popup of available keybindings when you pause mid-sequence. |

---

### Navigation & Search

| Plugin | Purpose |
|--------|---------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, git files, buffers, and live grep. Preview pane uses treesitter highlighting. Ignores `node_modules` and `.git/`. |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Marks up to 4 files per project for instant switching. Faster than buffers for files you return to constantly. |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar (30 cols, left side). Shows git status, dotfiles, and supports full file management. |

---

### LSP

| Plugin | Purpose |
|--------|---------|
| [mason.nvim](https://github.com/williamboman/mason.nvim) | GUI installer for LSP servers, linters, and formatters (`:Mason`). |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between mason and nvim-lspconfig. Auto-installs servers listed in `ensure_installed`. |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Ready-to-use configs for each language server. |

**Installed servers:**

| Server | Language |
|--------|----------|
| `clangd` | C / C++ |
| `gopls` | Go |
| `pyright` | Python (auto-detects `.venv/bin/python3`) |
| `ts_ls` | TypeScript / JavaScript |
| `jdtls` | Java |
| `lua_ls` | Lua |
| `html` | HTML |
| `cssls` | CSS |
| `emmet_ls` | Emmet abbreviations |
| `dockerls` | Dockerfile |
| `yamlls` | YAML |
| `prismals` | Prisma schema |
| `sqls` | SQL |
| `zls` | Zig (with inlay hints + snippets) |

**Diagnostics:** virtual text, signs, and underlines enabled. Not updated in insert mode.

---

### Formatting

| Plugin | Purpose |
|--------|---------|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format-on-save (500 ms timeout, falls back to LSP if no formatter found). |

**Formatters by filetype:**

| Filetype | Formatter |
|----------|-----------|
| `lua` | `stylua` |
| `go` | `gofmt` |
| `python` | `black` |
| `javascript` / `typescript` | `prettier` |
| `javascriptreact` / `typescriptreact` | `prettier` |
| `json` / `css` / `html` | `prettier` |

Formatters must be installed separately (e.g. `npm i -g prettier`, `pip install black`, `brew install stylua`).

---

### Completion

| Plugin | Purpose |
|--------|---------|
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine. Aggregates sources and renders the popup. |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP source (properties, signatures, etc.). |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Words from the current buffer. |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Filesystem paths. |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine required by nvim-cmp. |

---

### Syntax

| Plugin | Purpose |
|--------|---------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | AST-based syntax highlighting and incremental selection. |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-closes brackets, quotes, and parens. |

**Installed parsers:** `lua`, `vimdoc`, `javascript`, `typescript`, `python`, `rust`, `go`, `html`, `css`, `tsx`, `markdown`, `markdown_inline`, `json`, `bash`, `vim`

---

### Markdown

Configured in `after/plugin/markdown.lua`. Three cooperating layers give a GitHub-style preview **inside** Neovim — no browser. Toggle with `<leader>mp`.

| Plugin | Purpose |
|--------|---------|
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Renders headings, tables, code blocks, and checkboxes in-buffer. Loaded eagerly (`lazy = false`). |
| [image.nvim](https://github.com/3rd/image.nvim) | Draws real images via the Kitty graphics protocol. Needs Kitty + ImageMagick (`magick`). |
| [diagram.nvim](https://github.com/3rd/diagram.nvim) | Turns ` ```mermaid ` blocks into rendered images. Needs `mmdc`. Set up after image.nvim (load order matters, hence one file). |

---

### Git

| Plugin | Purpose |
|--------|---------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git diff signs in the gutter, inline blame (always-on, 300 ms delay), and hunk-level stage/reset/diff. |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Full git interface (`:Git`, `:Gdiff`, `:Gblame`, etc.). |

---

### Terminal

| Plugin | Purpose |
|--------|---------|
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Persistent horizontal terminal (15-line height). Toggle with `<C-\>`. Supports multiple numbered terminals. |

On startup, if a `.env` file exists in the project root, its variables are loaded into Neovim's environment — available to LSP servers, terminal child processes, and everything else.

---

### Session

| Plugin | Purpose |
|--------|---------|
| [persistence.nvim](https://github.com/folke/persistence.nvim) | Saves and restores sessions (open files, splits, working directory) per project. |

---

### Extras

| Plugin | Purpose |
|--------|---------|
| [mbbill/undotree](https://github.com/mbbill/undotree) | Visual non-linear undo history tree. |
| [presence.nvim](https://github.com/andweeb/presence.nvim) | Discord Rich Presence — shows file and project in your Discord status. |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library required by telescope, harpoon, and others. |

---

## Keymaps

> `<leader>` = `Space`  
> `<M-x>` = `Alt+x`

### General

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>ex` | Open netrw file explorer |
| n | `<leader>u` | Toggle undo tree |
| n | `<C-d>` | Scroll down half page (cursor stays centered) |
| n | `<C-u>` | Scroll up half page (cursor stays centered) |
| v | `J` | Move selected lines down |
| v | `K` | Move selected lines up |

### Window Management

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>vs` | Vertical split |
| n | `<leader>sp` | Horizontal split |
| n | `<C-w>h/j/k/l` | Move between splits (native) |
| n | `<leader>>` | Increase split width |
| n | `<leader><` | Decrease split width |
| n | `<leader>+` | Increase split height |
| n | `<leader>-` | Decrease split height |

### Telescope

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>fs` | Find files |
| n | `<C-p>` | Find git-tracked files |
| n | `<leader>ps` | Grep search (prompts for input) |
| n | `<leader>fb` | List open buffers |

### Harpoon

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>a` | Add current file to harpoon list |
| n | `<C-e>` | Open harpoon quick menu |
| n | `<C-h>` | Jump to harpoon slot 1 |
| n | `<C-t>` | Jump to harpoon slot 2 |
| n | `<M-3>` | Jump to harpoon slot 3 |
| n | `<M-4>` | Jump to harpoon slot 4 |
| n | `<M-p>` | Go to previous harpoon file |
| n | `<M-n>` | Go to next harpoon file |
| n | `<leader>1–4` | Open harpoon slot N in a vertical split |
| n *(in menu)* | `v` | Open selected file in vertical split |
| n *(in menu)* | `s` | Open selected file in horizontal split |

### File Tree (nvim-tree)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>pv` | Toggle file tree |
| n | `<leader>pf` | Focus file tree |
| n | `<leader>pr` | Refresh file tree |
| n | `<leader>po` | Open file or expand folder |
| n | `<leader>pc` | Close/collapse folder |
| n | `<leader>pa` | Create file or folder |
| n | `<leader>pd` | Delete file or folder |
| n | `<leader>pR` | Rename file or folder |
| n | `<leader>py` | Copy file or folder |
| n | `<leader>px` | Cut file or folder |
| n | `<leader>pp` | Paste file or folder |
| n | `<leader>pP` | Copy absolute path to clipboard |
| n | `<leader>ph` | Toggle hidden files (dotfiles) |

### LSP *(active when a language server is attached)*

| Mode | Key | Action |
|------|-----|--------|
| n | `K` | Hover documentation |
| n | `gd` | Go to definition |
| n | `gr` | List references |
| n | `<leader>rn` | Rename symbol |
| n / x | `<leader>ca` | Code action |
| n | `<leader>d` | Open diagnostic float |
| n | `[d` | Jump to previous diagnostic |
| n | `]d` | Jump to next diagnostic |

### Completion (nvim-cmp) *(insert mode)*

| Mode | Key | Action |
|------|-----|--------|
| i | `<Tab>` | Select next completion item |
| i | `<S-Tab>` | Select previous completion item |
| i | `<CR>` | Confirm selection |
| i | `<C-Space>` | Force open completion menu |
| i | `<C-b>` | Scroll docs up |
| i | `<C-f>` | Scroll docs down |

### Git (gitsigns) *(active in git-tracked files)*

| Mode | Key | Action |
|------|-----|--------|
| n | `]c` | Jump to next hunk |
| n | `[c` | Jump to previous hunk |
| n | `<leader>hs` | Stage hunk |
| n | `<leader>hr` | Reset hunk |
| n | `<leader>hu` | Undo staged hunk |
| n | `<leader>hp` | Preview hunk |
| n | `<leader>hb` | Blame current line |
| n | `<leader>hd` | Diff this file |
| n | `<leader>hD` | Diff against previous commit |
| n | `<leader>tb` | Toggle inline blame |

### Markdown (markview)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>mp` | Toggle in-buffer markdown preview |

### Terminal (toggleterm)

| Mode | Key | Action |
|------|-----|--------|
| n | `<C-\>` | Toggle terminal |
| n | `<leader>t1`–`t4` | Open independent terminal #1–#4 horizontally (each its own shell) |
| n | `<leader>tv1`–`tv4` | Open independent terminal #1–#4 vertically |
| n | `<leader>tg` | Jump to terminal by number (prompts) |
| n / t | `<leader>tq` | Kill current terminal (ends its shell, frees the number) |
| t | `<Esc>` or `jk` | Exit terminal mode |
| t | `<C-k>` | Move focus to the window above |
| t | `<C-n>` | Next terminal |
| t | `<C-p>` | Previous terminal |
| t | `<leader>tn` | Toggle terminal by command |
| t | `<leader>tg` | Jump to terminal by number (prompts) |

### Session (persistence)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>qs` | Restore session for current directory |
| n | `<leader>ql` | Restore last session |
| n | `<leader>qd` | Don't save session on exit |

### Treesitter (incremental selection)

| Mode | Key | Action |
|------|-----|--------|
| n / x | `<C-Space>` | Start / expand selection by node |
| x | `<M-Space>` | Shrink selection by node |
| x | `<C-s>` | Expand selection to scope |

### Alpha Dashboard *(startup screen)*

| Key | Action |
|-----|--------|
| `f` | Find files |
| `p` | Search text (live grep) |
| `r` | Recent files |
| `v` | Open file explorer |
| `c` | Edit `init.lua` |
| `q` | Quit Neovim |

---

## First Launch

1. Clone the repo as shown in [Installation](#installation).
2. Open Neovim — lazy.nvim bootstraps and installs all plugins automatically.
3. Run `:Lazy sync` if anything is missing.
4. LSP servers install via mason. Track progress with `:Mason` or watch the fidget spinner.
5. Install formatters your languages need (e.g. `npm i -g prettier`, `pip install black`).

To clean up old packer data if migrating from a packer-based config:

```bash
rm -rf ~/.local/share/nvim/site/pack/packer
```
