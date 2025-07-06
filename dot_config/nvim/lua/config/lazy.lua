local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ "LazyVim/LazyVim", version = false },
		{ import = "lazyvim.plugins.extras.coding.mini-surround" },
		{ import = "lazyvim.plugins.extras.coding.yanky" },
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.editor.aerial" },
		{ import = "lazyvim.plugins.extras.editor.dial" },
		{ import = "lazyvim.plugins.extras.editor.harpoon2" },
		{ import = "lazyvim.plugins.extras.editor.mini-diff" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
		{ import = "lazyvim.plugins.extras.lang.docker" },
		{ import = "lazyvim.plugins.extras.lang.elixir" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.nushell" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.yaml" },
		{ import = "lazyvim.plugins.extras.test.core" },
		{ import = "lazyvim.plugins.extras.ui.treesitter-context" },
		{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
		{ import = "lazyvim.plugins.extras.util.octo" },
		{ import = "plugins" },
	},
	defaults = {
		lazy = true,
		version = false,
	},
	install = {},
	checker = { enabled = true, notify = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
