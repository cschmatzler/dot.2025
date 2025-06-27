return {
	{
		"rose-pine/neovim",
		name = " rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "dawn",
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine",
		},
	},
	{ "akinsho/bufferline.nvim", enabled = false },
	{ "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },
}
