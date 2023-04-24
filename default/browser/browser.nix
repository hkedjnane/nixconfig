{ config, pkgs, ... }:
let
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz"){ inherit pkgs; };
in
{
  programs.firefox = {
    enable = true;
    profiles.harsane = {
      id = 0;
      isDefault = true;
      name= "harsane";
      #extraConfig = ''
      #  user_pref("extensions.activeThemeID",;
      #'';
      settings = {
        "extensions.activeThemeID" = "{b743f56d-1cc1-4048-8ba6-f9c2ab7aa54d}";
      };
    };
    extensions = with nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
      darkreader
      dracula-dark-colorscheme
      videospeed
      reddit-enhancement-suite
      tampermonkey
      image-search-options
      view-image
    ];
  };
}
