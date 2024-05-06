require 'nvim-treesitter.config'.setup {

	ensure_installed = { "c", "cpp"}

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}
