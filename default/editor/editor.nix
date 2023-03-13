{ config, pkgs, ... }:
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
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
      # Enable Dracula theme
      {
        plugin = dracula-vim;
        config = ''
          colorscheme dracula
          set termguicolors
        '';
      }
    ];
  };
}
