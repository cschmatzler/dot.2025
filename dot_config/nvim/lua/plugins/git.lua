return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"folke/snacks.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
		},
		opts = {
			kind = "replace",
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
}
