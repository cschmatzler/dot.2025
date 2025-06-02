return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "BufReadPost",
		opts = {
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 50,
				trigger_on_accept = true,
				keymap = {
					accept = "<Tab>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
		},
	},
}
