local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilites = config.capabilities

local lspconfig = require("lspconfig")

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0)}
  }
  vim.lsp.buf.execute_command(params)
end

-- dynamic_debug.lua
local function debug_dynamic()
    -- Prompt the user to enter the UUID
    local uuid = vim.fn.input('Enter UUID: ')

    -- Construct the WebSocket URL with the entered UUID
    local ws_url = 'ws://localhost:9229/' .. uuid

    -- Attach to the debug session with the dynamic WebSocket URL
    require('dap').run({
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        cwd = "${workspaceFolder}",
        url = ws_url
    })
end


lspconfig.tsserver.setup{
  on_attach = on_attach,
  capabilites = capabilites,
  init_options = {
    preferences = {
      disableSuggestions = false
    }
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    },
    DebugDynamic = {
      debug_dynamic,
      description = 'dynamic debug'
    }
  }
}
