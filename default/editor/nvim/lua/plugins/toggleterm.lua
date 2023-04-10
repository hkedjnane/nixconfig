return{
  {
    'akinsho/toggleterm.nvim', 
    lazy = true,
    cmd = "ToggleTerm",
    opts = {
      size = 10,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = { border = "Normal", background = "Normal" },
      },
    },
    keys = {
      {'<leader>tf', '<cmd>ToggleTerm direction=float<cr>', mode = 'n', desc = 'Open floating terminal'},
      {'<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', mode = 'n', desc = 'Open horizontal terminal'},
    },
    config = function()
      require("toggleterm").setup(opts)
    end,
  }
}
