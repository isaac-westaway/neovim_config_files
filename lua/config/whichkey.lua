local M = {}

local builtin = require "telescope.builtin"
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
	-- prefix = "<leader>",
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
              		
		["<leader>f"] = { "<cmd>NvimTreeToggle<cr>", "Toggle Filetree" },
		["<leader>p"] = { "<cmd>NvimTreeFocus<cr>", "Focus Filetree" },                
		
		["<S-W>"] = {"<cmd>q<cr>", "Close Current Window" },
		["<S-N>"] = {"<cmd>sp<cr>", "Split Window" },
		["<leader>1"] = {"<cmd>new<cr>", "New Window Vertically" },
		["<leader>2"] = {"<cmd>vnew<cr>", "New Window Horizontally" },
	
		["<A-S-Down>"] = {"<cmd>wincmd j<cr>", "Cursor Down" },
		["<A-S-Up>"] = {"<cmd>wincmd k<cr>", "Cursor Up" },
		["<A-S-Left>"] = {"<cmd>wincmd h<cr>", "Cursor Left" },
		["<A-S-Right>"] = {"<cmd>wincmd l<cr>", "Cursor Right" },

		-- ["<c-p>"] = { builtin.find_files, "Find Files" },

		z = {
			name = "System",
			p = { "<cmd>PackerProfile<cr>", "Profile"},
		},
	}
	
	whichkey.register(keymap, opts)
end

function M.setup()
	normal_keymap()
end

return M
