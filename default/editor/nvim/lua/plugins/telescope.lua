return {
	{
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.1',
		dependencies = { 
			'nvim-lua/plenary.nvim', 
			'nvim-telescope/telescope-fzf-native.nvim', 
		},
		cmd = 'Telescope',
		keys = {
		{'<leader>ff', '<cmd>Telescope find_files<cr>', mode = 'n', desc = 'Telescope file search'},
		{'<leader>fg', '<cmd>Telescope live_grep<cr>', mode = 'n', desc = 'Telescope live grep'},
		{'<leader>fb', '<cmd>Telescope buffers<cr>', mode = 'n', desc = 'Telescope buffer search'},
		{'<leader>fh', '<cmd>Telescope help_tags<cr>', mode = 'n', desc = 'Telescope help tags'},
		},
	},
}
