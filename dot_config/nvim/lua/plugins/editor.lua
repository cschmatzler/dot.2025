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
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "neogit" },
		},
		opts = {
			integrations = {
				diffview = true,
				fzf_lua = true,
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
		config = function()
			require("zk").setup({
				picker = "fzf_lua",
			})
		end,
	},
}
