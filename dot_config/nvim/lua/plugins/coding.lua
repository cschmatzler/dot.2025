return {
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "onsails/lspkind-nvim",
      "supermaven-inc/supermaven-nvim",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local suggestion = require("supermaven-nvim.completion_preview")

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if suggestion.has_suggestion() then
            suggestion.on_accept_suggestion()
          else
            fallback()
          end
        end),
      })

      opts.experimental = {
        ghost_text = false,
      }
    end,
  },
}
