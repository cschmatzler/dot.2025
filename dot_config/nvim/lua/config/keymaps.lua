vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

local colemak_mode = false

local function setup_qwerty()
	vim.keymap.set("n", "m", "m", { desc = "Set mark" })
	vim.keymap.set("n", "n", "n", { desc = "Next search result" })
	vim.keymap.set("n", "N", "N", { desc = "Previous search result" })
	vim.keymap.set("n", "e", "e", { desc = "End of word" })
	vim.keymap.set("n", "E", "E", { desc = "End of WORD" })
	vim.keymap.set("n", "i", "i", { desc = "Insert mode" })
	vim.keymap.set("n", "I", "I", { desc = "Insert at beginning of line" })

	vim.keymap.set("v", "m", "m", { desc = "Set mark" })
	vim.keymap.set("v", "n", "n", { desc = "Next search result" })
	vim.keymap.set("v", "N", "N", { desc = "Previous search result" })
	vim.keymap.set("v", "e", "e", { desc = "End of word" })
	vim.keymap.set("v", "E", "E", { desc = "End of WORD" })
	vim.keymap.set("v", "i", "i", { desc = "Inner text object" })
	vim.keymap.set("v", "I", "I", { desc = "Insert at beginning of line" })

	pcall(vim.keymap.del, "n", "h")
	pcall(vim.keymap.del, "n", "j")
	pcall(vim.keymap.del, "n", "k")
	pcall(vim.keymap.del, "n", "l")
	pcall(vim.keymap.del, "v", "h")
	pcall(vim.keymap.del, "v", "j")
	pcall(vim.keymap.del, "v", "k")
	pcall(vim.keymap.del, "v", "l")
	pcall(vim.keymap.del, "n", "J")
	pcall(vim.keymap.del, "n", "K")
	pcall(vim.keymap.del, "n", "L")
	pcall(vim.keymap.del, "v", "J")
	pcall(vim.keymap.del, "v", "K")
	pcall(vim.keymap.del, "v", "L")
end

local function setup_colemak()
	vim.keymap.set("n", "m", "h", { desc = "Move left" })
	vim.keymap.set("n", "n", "j", { desc = "Move down" })
	vim.keymap.set("n", "e", "k", { desc = "Move up" })
	vim.keymap.set("n", "i", "l", { desc = "Move right" })

	vim.keymap.set("v", "m", "h", { desc = "Move left" })
	vim.keymap.set("v", "n", "j", { desc = "Move down" })
	vim.keymap.set("v", "e", "k", { desc = "Move up" })
	vim.keymap.set("v", "i", "l", { desc = "Move right" })

	vim.keymap.set("n", "h", "m", { desc = "Set mark" })
	vim.keymap.set("n", "j", "n", { desc = "Next search result" })
	vim.keymap.set("n", "J", "N", { desc = "Previous search result" })
	vim.keymap.set("n", "k", "e", { desc = "End of word" })
	vim.keymap.set("n", "K", "E", { desc = "End of WORD" })
	vim.keymap.set("n", "l", "i", { desc = "Insert mode" })
	vim.keymap.set("n", "L", "I", { desc = "Insert at beginning of line" })

	vim.keymap.set("v", "h", "m", { desc = "Set mark" })
	vim.keymap.set("v", "j", "n", { desc = "Next search result" })
	vim.keymap.set("v", "J", "N", { desc = "Previous search result" })
	vim.keymap.set("v", "k", "e", { desc = "End of word" })
	vim.keymap.set("v", "K", "E", { desc = "End of WORD" })
	vim.keymap.set("v", "l", "i", { desc = "Inner text object" })
	vim.keymap.set("v", "L", "I", { desc = "Insert at beginning of line" })
end

local function toggle_layout()
	colemak_mode = not colemak_mode
	if colemak_mode then
		setup_colemak()
		vim.notify("Switched to Colemak-DH layout", vim.log.levels.INFO)
	else
		setup_qwerty()
		vim.notify("Switched to QWERTY layout", vim.log.levels.INFO)
	end
end

vim.keymap.set("n", "<leader>tk", toggle_layout, { desc = "Toggle keyboard layout (QWERTY/Colemak-DH)" })

setup_qwerty()
