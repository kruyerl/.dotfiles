-- Remap :Ex for easier file exploring
vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

-- Close all windows and exit from Neovim with <leader> and q
vim.keymap.set("n", "<leader>q", ":qa!<CR>", {})
-- Fast saving with <leader> and s
vim.keymap.set("n", "<leader>s", ":w<CR>", {})
-- Move around splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", {})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {})

-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>", {})

-- Telescope
-- <leader> is a space now
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- NvimTree
vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeToggle, {}) -- open/close
vim.keymap.set("n", "<leader>nr", vim.cmd.NvimTreeRefresh, {}) -- refresh
vim.keymap.set("n", "<leader>nf", vim.cmd.NvimTreeFindFile, {}) -- search file

-- Terminal
vim.keymap.set("n", "<leader>tt", vim.cmd.NeotermToggle, {})
vim.keymap.set("n", "<leader>tx", vim.cmd.NeotermExit, {})

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {})

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n","<leader>ha", mark.add_file)
vim.keymap.set("n","<leader>hs", ui.toggle_quick_menu)
vim.keymap.set("n","<leader>hh", function() ui.nav_file(1) end)
vim.keymap.set("n","<leader>hj", function() ui.nav_file(2) end)
vim.keymap.set("n","<leader>hk", function() ui.nav_file(3) end)
vim.keymap.set("n","<leader>hl", function() ui.nav_file(4) end)

-- Fugitive
vim.keymap.set("n","<leader>gs", vim.cmd.Git)
