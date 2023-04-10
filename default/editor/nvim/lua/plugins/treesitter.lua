return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      indent = { enable = true, disable = { "python" } },
      ensure_installed = { "c", "lua", "cpp", "rust", "vim", "nix", "bash", "make", "python"},
      auto_install = true,
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
  }
}
