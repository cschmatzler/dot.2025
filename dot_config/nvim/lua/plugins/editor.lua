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
