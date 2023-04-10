{ config, pkgs, lib, ... }:

{
  #Make Neovim the default editor
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  #Symlinking Neovim configuration to config directory
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./nvim;

  home.packages = with pkgs; [
    neovim-nightly	#The center piece
    nodejs		#Some plugins depend on this
  ];

}
