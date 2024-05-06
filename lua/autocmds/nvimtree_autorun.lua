vim.api.nvim_create_autocmd("VimEnter", {

	callback = function()
		vim.schedule(function()
			print("callback working")
			
			vim.cmd "wincmd p"
		end)
	end,
})
