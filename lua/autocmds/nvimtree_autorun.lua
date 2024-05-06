vim.api.nvim_create_autocmd("VimEnter", {
        -- this file is no longer used i might keep it here in case i do something with it again
	-- boilerplate for autorun
	callback = function()
		vim.schedule(function()
			print("callback working")
			
			vim.cmd "wincmd p"
		end)
	end,
})
