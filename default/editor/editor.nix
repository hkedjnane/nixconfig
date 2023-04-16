{ config, pkgs, lib, ... }:

let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
in

{

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
        set signcolumn=number
        set nu rnu
        set expandtab
        set cc=80
        set ts=4 sw=4 et softtabstop=4
    '';
    plugins = with pkgs.vimPlugins; [

      # Enable NIX file support
      vim-nix
      # Enable Catppuccin theme
      {
        plugin = catppuccin-nvim;
        config = ''
          colorscheme catppuccin-frappe
          set termguicolors
        '';
      }
      (fromGitHub "HEAD" "justinmk/vim-syntax-extra")
      (fromGitHub "HEAD" "xiyaowong/virtcolumn.nvim")
      copilot-vim
    ];

    extraPackages = with pkgs; [
      nodejs-16_x
    ];
  };
}
