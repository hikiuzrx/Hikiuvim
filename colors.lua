function ColorScheme(color)
	color = color or "poimandres"
	vim.cmd.colorscheme(color)

	-- background settings
	vim.api.nvim_set_hl(0, "Normal" , { bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat" , { bg = "none"})
end
ColorScheme() 
