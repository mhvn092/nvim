require("nvim-treesitter.install").prefer_git = true;

local options = {
  ensure_installed = { "lua","typescript","javascript","vimdoc","vim","go", },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
