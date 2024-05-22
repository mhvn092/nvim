---@type ChadrcConfig
local M = {}

M.ui = { theme = 'onedark' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
M.options = {
  termbidi = true,
}
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.opt.termbidi = true
    end,
})
return M
