# Neovim Keymaps

> Leader = `Space`

## General

| Key | Action |
|-----|--------|
| `<leader>y` | Copy to system clipboard |
| `<leader>Y` | Copy line to system clipboard |
| `<leader>x` | Make file executable |
| `<leader>lw` | Toggle line wrap |
| `<leader>?` | Show this keymap cheatsheet |

## Navigation

| Key | Action |
|-----|--------|
| `<C-d>` | Scroll down (centered) |
| `<C-u>` | Scroll up (centered) |
| `H` | Jump to line start (non-blank) |
| `L` | Jump to line end |

## Windows

| Key | Action |
|-----|--------|
| `<leader>v` | Split vertically |
| `<leader>h` | Split horizontally |
| `<leader>se` | Equalize split sizes |
| `<leader>xs` | Close current split |
| `<C-h/j/k/l>` | Navigate between splits |
| `<Up/Down>` | Resize split height |
| `<Left/Right>` | Resize split width |

## Buffers & Tabs

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>to` | New tab |
| `<leader>tx` | Close tab |
| `<leader>tn` | Next tab |
| `<leader>tp` | Previous tab |
| `<leader><leader>` | Find open buffers |

## File Explorer

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle Neo-tree |
| `<leader>gf` | Git status (floating) |
| `<leader>yf` | Open Yazi at current file |
| `<leader>cf` | Open Yazi at cwd |
| `<leader>ct` | Resume last Yazi session |

## Telescope (Search)

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep current word |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search Telescope builtins |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>/` | Fuzzy search current buffer |
| `<leader>s/` | Live grep in open files |

## LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>th` | Toggle inlay hints |

## Diagnostics

| Key | Action |
|-----|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>d` | Open diagnostic float |
| `<leader>q` | Diagnostics to loclist |

## Visual Mode

| Key | Action |
|-----|--------|
| `<` | Indent left (stay in visual) |
| `>` | Indent right (stay in visual) |
| `p` | Paste without losing yank register |
| `<C-j/k>` | Move selection in Telescope |
