-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function map(mode, combo, mapping, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- Split
map('n', '<leader>h', ':<C-u>split<CR>', { noremap = true })
map('n', '<leader>v', ':<C-u>vsplit<CR>', { noremap = true })

-- Resize splits
map('n', 'vp', ':vertical resize +2<CR>', { noremap = true })
map('n', 'vm', ':vertical resize -2<CR>', { noremap = true })
map('n', 'hp', ':resize +2<CR>', { noremap = true })
map('n', 'hm', ':resize -2<CR>', { noremap = true })

-- Split navigation
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

-- Tab navigations
map('n', '<Tab>', ':tabn<CR>', { noremap = true })
map('n', '<S-Tab>', ':tabp<CR>', { noremap = true })
map('n', '<S-t>', ':tabnew<CR>', { noremap = true })
map('n', 't0', '1gt', { noremap = true })
map('n', 't9', ':tablast<CR>', { noremap = true })

-- Vertical Navigation
map('n', '<C-d>', '<C-d>zz', { noremap = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true })

-- Cool command to swap between cpp and header files
map('n', '<F5>', ':e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>', { noremap = true })
