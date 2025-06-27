return {
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>e", "<cmd>Oil<cr>", desc = "Files" },
		},
		opts = {
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,
			watch_for_changes = true,
			view_options = {
				show_hidden = true,
				sort = {
					{ "name", "asc" },
				},
			},
		},
	},
	{
		"ibhagwan/fzf-lua",
		opts = {
			oldfiles = {
				include_current_session = true,
			},
			previewers = {
				builtin = {
					syntax_limit_b = 1024 * 100,
				},
			},
			grep = {
				rg_glob = true,
				glob_flag = "--iglob",
				glob_separator = "%s%-%-",
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"echasnovski/mini.move",
		event = "BufReadPost",
		opts = {
			mappings = {
				left = "<M-h>",
				right = "<M-l>",
				down = "<M-j>",
				up = "<M-k>",
				line_left = "<M-h>",
				line_right = "<M-l>",
				line_down = "<M-j>",
				line_up = "<M-k>",
			},
		},
		config = function(_, opts)
			require("mini.move").setup(opts)
			vim.keymap.set(
				"v",
				"<M-Left>",
				"<cmd>lua MiniMove.move_selection('left')<cr>",
				{ desc = "Move selection left" }
			)
			vim.keymap.set(
				"v",
				"<M-Right>",
				"<cmd>lua MiniMove.move_selection('right')<cr>",
				{ desc = "Move selection right" }
			)
			vim.keymap.set(
				"v",
				"<M-Down>",
				"<cmd>lua MiniMove.move_selection('down')<cr>",
				{ desc = "Move selection down" }
			)
			vim.keymap.set("v", "<M-Up>", "<cmd>lua MiniMove.move_selection('up')<cr>", { desc = "Move selection up" })
			vim.keymap.set("n", "<M-Left>", "<cmd>lua MiniMove.move_line('left')<cr>", { desc = "Move line left" })
			vim.keymap.set("n", "<M-Right>", "<cmd>lua MiniMove.move_line('right')<cr>", { desc = "Move line right" })
			vim.keymap.set("n", "<M-Down>", "<cmd>lua MiniMove.move_line('down')<cr>", { desc = "Move line down" })
			vim.keymap.set("n", "<M-Up>", "<cmd>lua MiniMove.move_line('up')<cr>", { desc = "Move line up" })

			vim.keymap.set(
				"v",
				"<M-m>",
				"<cmd>lua MiniMove.move_selection('left')<cr>",
				{ desc = "Move selection left (Colemak)" }
			)
			vim.keymap.set(
				"v",
				"<M-i>",
				"<cmd>lua MiniMove.move_selection('right')<cr>",
				{ desc = "Move selection right (Colemak)" }
			)
			vim.keymap.set(
				"v",
				"<M-n>",
				"<cmd>lua MiniMove.move_selection('down')<cr>",
				{ desc = "Move selection down (Colemak)" }
			)
			vim.keymap.set(
				"v",
				"<M-e>",
				"<cmd>lua MiniMove.move_selection('up')<cr>",
				{ desc = "Move selection up (Colemak)" }
			)
			vim.keymap.set(
				"n",
				"<M-m>",
				"<cmd>lua MiniMove.move_line('left')<cr>",
				{ desc = "Move line left (Colemak)" }
			)
			vim.keymap.set(
				"n",
				"<M-i>",
				"<cmd>lua MiniMove.move_line('right')<cr>",
				{ desc = "Move line right (Colemak)" }
			)
			vim.keymap.set(
				"n",
				"<M-n>",
				"<cmd>lua MiniMove.move_line('down')<cr>",
				{ desc = "Move line down (Colemak)" }
			)
			vim.keymap.set("n", "<M-e>", "<cmd>lua MiniMove.move_line('up')<cr>", { desc = "Move line up (Colemak)" })
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.sections.lualine_z = {}
		end,
	},
	{
		"andrewferrier/wrapping.nvim",
		event = "VeryLazy",
		opts = {
			auto_set_mode_filetype_allowlist = {
				"asciidoc",
				"gitcommit",
				"latex",
				"mail",
				"markdown",
				"rst",
				"tex",
				"text",
			},
		},
	},
	{
		"zk-org/zk-nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>zn", "<cmd>ZkNotes<cr>", desc = "List notes" },
			{ "<leader>zc", "<cmd>ZkNew<cr>", desc = "New note" },
			{ "<leader>zl", "<cmd>ZkLinks<cr>", desc = "Show links from current note" },
			{ "<leader>zb", "<cmd>ZkBacklinks<cr>", desc = "Show backlinks for current note" },
			{ "<leader>zi", "<cmd>ZkInsertLink<cr>", desc = "Insert a new link" },
		},
		config = function()
			require("zk").setup({
				picker = "snacks_picker",
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts_extend = { "spec" },
		opts = {
			spec = {
				{ "<leader>z", group = "zk", icon = { " " } },
			},
		},
	},
}
