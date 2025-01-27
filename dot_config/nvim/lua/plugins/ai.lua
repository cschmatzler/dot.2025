return {
	{
		"supermaven-inc/supermaven-nvim",
		event = "VeryLazy",
		opts = {
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-]>",
				accept_word = "<C-j>",
			},
		},
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
		opts = {
			hints = { enabled = false },
			file_selector = {
				provider = "fzf",
				provider_opts = {},
			},
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "avante.nvim", "saghen/blink.compat" },
		opts = {
			sources = {
				compat = {
					"avante_commands",
					"avante_mentions",
				},
				default = {
					"avante_commands",
					"avante_mentions",
				},
				providers = {
					avante_commands = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 90,
						opts = {},
					},
					avante_files = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 100,
						opts = {},
					},
				},
			},
		},
		optional = true,
	},
}
