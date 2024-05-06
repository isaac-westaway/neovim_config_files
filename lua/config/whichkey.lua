local M = {}

local whichkey = require "which-key"

local next = next

local conf = {
	window = {
		border = "single",
		position = "bottom",
	},
}

whichkey.setup(conf)

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
}

local function normal_keymap()
	local keymap = {
		--f = { 
		--	name = "Toggle Filetree",
		--	t = { "<cmd>NvimTreeToggle<cr>", "Toggle Filetree" },
		--},
		
		["f"] = { "<cmd>NvimTreeToggle<cr>", "Toggle Filetree" },

		z = {
			name = "System",
			p = { "<cmd>PackerProfile<cr>", "Profile"},
		},
	}
	
	whichkey.register(keymap, opts);
end

function M.setup()
	normal_keymap()
end

return M
