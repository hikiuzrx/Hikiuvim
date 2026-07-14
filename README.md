# HIKIUVIM

Personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).  
Theme: [Poimandres](https://github.com/olivercederborg/poimandres.nvim) · Leader: `Space`

---

## Structure

```
nvim/
├── init.lua                  # Entry point (sets options, loads hiki module)
├── lua/hiki/
│   ├── init.lua              # Loads lazy, remap, colors
│   ├── lazy.lua              # Plugin declarations (lazy.nvim)
│   ├── remap.lua             # Global keymaps
│   └── colors.lua            # Colorscheme + transparent background
└── after/plugin/             # Per-plugin configuration files
    ├── alpha.lua
    ├── autopairs.lua
    ├── cmp.lua
    ├── discord.lua
    ├── gitsigns.lua
    ├── harpoon.lua
    ├── lsp.lua
    ├── lualine.lua
    ├── nvim-tree.lua
    ├── telescope.lua
    ├── terminal.lua
    ├── treesitter.lua
    └── undotree.lua
```

---

## Plugin Overview

### Package Manager

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager. Replaces the archived packer.nvim. Supports lazy-loading, lockfiles, and a built-in UI (`:Lazy`). |

---

### Theme & UI

| Plugin | Purpose |
|--------|---------|
| [poimandres.nvim](https://github.com/olivercederborg/poimandres.nvim) | Dark colorscheme with teal/pink/blue tones. Loaded with `priority = 1000` so it applies before anything else. Transparent background is forced via `nvim_set_hl`. |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File-type icons used by alpha, lualine, nvim-tree, and telescope. Requires a Nerd Font. |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Startup dashboard. Shows the HIKIUVIM ASCII header and quick-action buttons. |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line. Configured with the `poimandres` theme to match the colorscheme. |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Draws vertical indent guide lines. Pinned to v2 (`tag = "v2.20.8"`). |

---

### Navigation & Search

| Plugin | Purpose |
|--------|---------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, git files, buffers, and live grep. |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Marks up to 4 files per project for instant switching. Faster than buffers for files you return to constantly. |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar. Shows git status, supports create/rename/delete/copy/paste. |

---

### LSP

| Plugin | Purpose |
|--------|---------|
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/linter/formatter installer with a GUI (`:Mason`). |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between mason and nvim-lspconfig. Auto-installs and configures servers declared in `ensure_installed`. |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Provides ready-to-use configs for each language server. |

**Installed servers:** `clangd` (C/C++), `gopls` (Go), `pyright` (Python), `ts_ls` (TypeScript/JS), `jdtls` (Java), `lua_ls` (Lua), `html`, `cssls`, `emmet_ls`, `dockerls`, `yamlls`, `prismals`, `sqls` (SQL), `zls` (Zig)

**Auto-detection:** If a `.venv/bin/python3` exists in the project root, pyright uses it automatically.

---

### Completion

| Plugin | Purpose |
|--------|---------|
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine. Aggregates sources and renders the popup menu. |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP source for cmp (object properties, function signatures, etc.). |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Completes words already present in the current buffer. |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Completes filesystem paths. |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine. Required by nvim-cmp for snippet expansion. |

---

### Syntax & Editing

| Plugin | Purpose |
|--------|---------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | AST-based syntax highlighting and incremental selection. More accurate than regex-based highlighting. |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-closes brackets, quotes, and parens. |

**Installed parsers:** `lua`, `vimdoc`, `javascript`, `typescript`, `python`, `rust`, `go`, `html`, `css`, `tsx`, `markdown`, `markdown_inline`, `json`, `bash`, `vim`

---

### Git

| Plugin | Purpose |
|--------|---------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Shows git diff signs in the gutter, inline blame, and hunk-level stage/reset/diff. |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Full git interface inside Neovim (`:Git`, `:Gdiff`, `:Gblame`, etc.). |

---

### Terminal

| Plugin | Purpose |
|--------|---------|
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Persistent terminals that toggle in/out of view. Supports multiple numbered terminals side-by-side. |

On startup, if a `.env` file exists in the project root, its variables are loaded into Neovim's environment so they're available to all child processes (LSP servers, terminal commands, etc.).

---

### Extras

| Plugin | Purpose |
|--------|---------|
| [presence.nvim](https://github.com/andweeb/presence.nvim) | Discord Rich Presence — shows the file and project you're editing in your Discord status. |
| [mbbill/undotree](https://github.com/mbbill/undotree) | Visual undo history tree. Neovim's undo is non-linear; this makes it navigable. |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library required by telescope, harpoon, and others. |

---

## Keymaps

> `<leader>` = `Space`  
> `<M-x>` = `Alt+x`

### General

| Key | Action |
|-----|--------|
| `<leader>ex` | Open netrw file explorer |
| `<leader>u` | Toggle undo tree |

### Window Management

| Key | Action |
|-----|--------|
| `<leader>vs` | Vertical split |
| `<leader>sp` | Horizontal split |
| `<C-w>h/j/k/l` | Move between splits (native) |
| `<leader>>` | Increase split width |
| `<leader><` | Decrease split width |
| `<leader>+` | Increase split height |
| `<leader>-` | Decrease split height |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>fs` | Find files |
| `<C-p>` | Find git-tracked files |
| `<leader>ps` | Grep search (prompts for input) |
| `<leader>fb` | List open buffers |

### Harpoon

| Key | Action |
|-----|--------|
| `<leader>a` | Add current file to harpoon list |
| `<C-e>` | Open harpoon quick menu |
| `<C-h>` | Jump to harpoon file 1 |
| `<C-t>` | Jump to harpoon file 2 |
| `<M-3>` | Jump to harpoon file 3 |
| `<M-4>` | Jump to harpoon file 4 |
| `<M-p>` | Go to previous harpoon file |
| `<M-n>` | Go to next harpoon file |
| `<leader>1–4` | Open harpoon file N in a vertical split |
| `v` *(in menu)* | Open selected file in vertical split |
| `s` *(in menu)* | Open selected file in horizontal split |

### File Tree (nvim-tree)

| Key | Action |
|-----|--------|
| `<leader>pv` | Toggle file tree |
| `<leader>pf` | Focus file tree |
| `<leader>pr` | Refresh file tree |
| `<leader>po` | Open file or expand folder |
| `<leader>pc` | Close/collapse folder |
| `<leader>pa` | Create file or folder |
| `<leader>pd` | Delete file or folder |
| `<leader>prn` | Rename file or folder |
| `<leader>py` | Copy file or folder |
| `<leader>px` | Cut file or folder |
| `<leader>pp` | Paste file or folder |
| `<leader>ps` | Copy absolute path to clipboard |
| `<leader>ph` | Toggle hidden files (dotfiles) |

### LSP *(active when a language server is attached)*

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gr` | List references |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>d` | Open diagnostic float |
| `[d` | Jump to previous diagnostic |
| `]d` | Jump to next diagnostic |

### Completion (nvim-cmp) *(insert mode)*

| Key | Action |
|-----|--------|
| `<Tab>` | Select next completion item |
| `<S-Tab>` | Select previous completion item |
| `<CR>` | Confirm selection |
| `<C-Space>` | Force open completion menu |
| `<C-b>` | Scroll docs up |
| `<C-f>` | Scroll docs down |

### Git (gitsigns)

| Key | Action |
|-----|--------|
| `]c` | Jump to next hunk |
| `[c` | Jump to previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hu` | Undo staged hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff this file |
| `<leader>hD` | Diff against previous commit |
| `<leader>tb` | Toggle inline blame |

### Terminal (toggleterm)

| Key | Mode | Action |
|-----|------|--------|
| `<C-\>` | Normal | Toggle terminal |
| `<Esc>` or `jk` | Terminal | Exit terminal mode |
| `<C-k>` | Terminal | Move focus to the window above |
| `<leader>tg` | Normal / Terminal | Jump to terminal by number |

### Treesitter (incremental selection)

| Key | Action |
|-----|--------|
| `<C-Space>` | Start / expand selection by node |
| `<M-Space>` | Shrink selection by node |
| `<C-s>` | Expand selection to scope |

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

lazy.nvim bootstraps itself on first open. After Neovim starts:

```
:Lazy sync
```

This installs all declared plugins. Mason then handles language server installation — open a file of the relevant type or run:

```
:Mason
```

To clean up the old packer data (no longer needed):

```bash
rm -rf ~/.local/share/nvim/site/pack/packer
```
