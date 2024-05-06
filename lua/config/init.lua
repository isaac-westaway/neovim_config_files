local g = vim.g

local disabled_built_ins = {
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"logipat",
	"getscriptPlugin",
	"gzip",
	"2html_plugin",
	"matchit",
	"matchparen",
	"tar",
	"tarPlugin",
	"rrhelper",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1

end
