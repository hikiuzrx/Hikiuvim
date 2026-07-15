# HIKIUVIM Keymaps

> `<leader>` is typically `\` or `,` — check your `init.lua` if unsure.

---

## General (`lua/hiki/remap.lua`)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>ex` | Open netrw (`:Ex`) |
| n | `<leader>vs` | Vertical split |
| n | `<leader>sp` | Horizontal split |
| n | `<leader>>` | Increase split width |
| n | `<leader><` | Decrease split width |
| n | `<leader>+` | Increase split height |
| n | `<leader>-` | Decrease split height |
| n | `<C-d>` | Scroll down half page (centered) |
| n | `<C-u>` | Scroll up half page (centered) |
| v | `J` | Move selection down |
| v | `K` | Move selection up |

---

## Telescope (`after/plugin/telescope.lua`)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>fs` | Find files |
| n | `<C-p>` | Git files |
| n | `<leader>ps` | Grep string (prompt) |
| n | `<leader>fb` | List open buffers |

---

## Harpoon (`after/plugin/harpoon.lua`)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>a` | Add file to harpoon |
| n | `<C-e>` | Toggle harpoon quick menu |
| n | `<C-h>` | Navigate to slot 1 |
| n | `<C-t>` | Navigate to slot 2 |
| n | `<M-3>` | Navigate to slot 3 |
| n | `<M-4>` | Navigate to slot 4 |
| n | `<M-p>` | Navigate to previous file |
| n | `<M-n>` | Navigate to next file |
| n | `<leader>1` | Open slot 1 in vsplit |
| n | `<leader>2` | Open slot 2 in vsplit |
| n | `<leader>3` | Open slot 3 in vsplit |
| n | `<leader>4` | Open slot 4 in vsplit |

**Inside the harpoon menu (filetype=harpoon):**

| Mode | Key | Action |
|------|-----|--------|
| n | `v` | Open file under cursor in vsplit |
| n | `s` | Open file under cursor in hsplit |

---

## LSP (`after/plugin/lsp.lua`)

> These keymaps are buffer-local and only active when an LSP server is attached.

| Mode | Key | Action |
|------|-----|--------|
| n | `K` | Hover documentation |
| n | `gd` | Go to definition |
| n | `gr` | Go to references |
| n | `<leader>rn` | Rename symbol |
| n / x | `<leader>ca` | Code action |
| n | `<leader>d` | Open diagnostics float |
| n | `[d` | Go to previous diagnostic |
| n | `]d` | Go to next diagnostic |

---

## Completion / nvim-cmp (`after/plugin/cmp.lua`)

> Active in insert mode inside the completion menu.

| Mode | Key | Action |
|------|-----|--------|
| i | `<C-b>` | Scroll docs up |
| i | `<C-f>` | Scroll docs down |
| i | `<C-Space>` | Force open completion menu |
| i | `<CR>` | Confirm selection |
| i | `<Tab>` | Select next item |
| i | `<S-Tab>` | Select previous item |

---

## Gitsigns (`after/plugin/gitsigns.lua`)

> Buffer-local keymaps, active in git-tracked files.

| Mode | Key | Action |
|------|-----|--------|
| n | `]c` | Next hunk |
| n | `[c` | Previous hunk |
| n | `<leader>hs` | Stage hunk |
| n | `<leader>hr` | Reset hunk |
| n | `<leader>hu` | Undo stage hunk |
| n | `<leader>hp` | Preview hunk |
| n | `<leader>hb` | Blame current line |
| n | `<leader>hd` | Diff this file |
| n | `<leader>hD` | Diff against previous commit |
| n | `<leader>tb` | Toggle inline blame |

---

## Nvim-Tree (`after/plugin/nvim-tree.lua`)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>pv` | Toggle file tree |
| n | `<leader>pr` | Refresh file tree |
| n | `<leader>pf` | Focus file tree |
| n | `<leader>po` | Open file / folder |
| n | `<leader>pc` | Close parent folder |
| n | `<leader>pa` | Create file / folder |
| n | `<leader>pd` | Delete file / folder |
| n | `<leader>prn` | Rename file / folder |
| n | `<leader>py` | Copy file / folder |
| n | `<leader>px` | Cut file / folder |
| n | `<leader>pp` | Paste file / folder |
| n | `<leader>ps` | Copy absolute path |
| n | `<leader>ph` | Toggle hidden files |

---

## ToggleTerm (`after/plugin/terminal.lua`)

| Mode | Key | Action |
|------|-----|--------|
| n | `<C-\>` | Toggle terminal |
| n | `<leader>tg` | Go to terminal by number (prompt) |
| t | `<Esc>` | Exit terminal mode |
| t | `jk` | Exit terminal mode |
| t | `<C-k>` | Go back to editor (up split) |
| t | `<C-n>` | Next terminal |
| t | `<C-p>` | Previous terminal |
| t | `<leader>tn` | Toggle next terminal (command) |
| t | `<leader>tg` | Go to terminal by number (prompt) |

---

## Undotree (`after/plugin/undotree.lua`)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>u` | Toggle Undotree |

---

## Persistence (`after/plugin/persistence.lua`)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>qs` | Restore session for current directory |
| n | `<leader>ql` | Restore last session |
| n | `<leader>qd` | Don't save session on exit |
