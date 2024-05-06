local M = {}

function M.setup()
	local is_bootstrap = false

	local conf = {
		profile = {
			enable = true,
			threshold = 0,
		},

		display = {
			open_fn = function()
				return require("packer.util").float { border = "rounded" }
			end,
		},
	}

	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

		if fn.empty(fn.glob(install_path)) > 0 then
			fn.system {
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			}
			is_bootstrap = true
			vim.cmd [[packadd packer.nvim]]
		end

		local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })

		vim.api.nvim_create_autocmd(
			{ "BufWritePost" },
			{ pattern = vim.fn.expand "$MYVIMRC", command = "source <afile> | PackerCompile", group = packer_grp }
		)

	end

	local function plugins(use)
		use { "wbthomason/packer.nvim" }

		--use {
		--	"goolord/alpha-nvim",
		--	config = function()
		--		require("config.alpha").setup()
		--	end,
		--}

		use {
			"nvim-tree/nvim-tree.lua",
			opt = true,
			cmd = { "NvimTreeToggle", "NvimTreeClose" },

			config = function()
				require("config.nvimtree").setup()
			end,
		}
		
		use 'nvim-tree/nvim-web-devicons'

		use {
			"folke/which-key.nvim",
			event = "VimEnter",
			module = { "which-key" },
			config = function()
				require("config.whichkey").setup()
			end,
			disable = false,
		}

		use 'nvim-treesitter/nvim-treesitter'

		use {
			'nvim-telescope/telescope.nvim',
			requires = { { 'nvim-lua/plenary.nvim'} }
		}

		if is_bootstrap then
			print "neovim restart is required after installation!"

			require("packer").sync()
		end
	end

	packer_init()

	local packer = require "packer"

	pcall(require, "packer_compiled")

	packer.init(conf)

	packer.startup(plugins)

end

return M
