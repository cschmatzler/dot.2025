return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", desc = "Files" },
    },
    opts = {
      skip_confirm_for_simple_edits = true,
      experimental_watch_for_changes = true,
      view_options = {
        show_hidden = true,
        sort = {
          { "name", "asc" },
        },
      },
    },
  },
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>cu",
        vim.cmd.UndotreeToggle,
        desc = "Undotree",
      },
    },
  },
  {
    "mhanberg/output-panel.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.move",
    event = "BufReadPost",
    opts = {
      mappings = {
        left = "<M-Left>",
        right = "<M-Right>",
        down = "<M-Down>",
        up = "<M-Up>",
        line_left = "<M-Left>",
        line_right = "<M-Right>",
        line_down = "<M-Down>",
        line_up = "<M-Up>",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  },
  {
    "zk-org/zk-nvim",
    event = "VeryLazy",
    config = function()
      require("zk").setup({
        picker = "telescope",
      })
    end,
  },
}
