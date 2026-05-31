return {
  "stevearc/conform.nvim",

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
      },

      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    })

    -- keymap
    vim.keymap.set("n", "<leader>f", function()
      conform.format({ async = true })
    end, { desc = "Format file" })
  end,
}
