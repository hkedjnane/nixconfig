{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    ncdu
    ranger
    tree
    neofetch
    htop
  ];

}
