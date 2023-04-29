{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    wget
    ncdu
    ranger
    tree
    neofetch
    htop
    unzip
    bitwarden
  ];

}
