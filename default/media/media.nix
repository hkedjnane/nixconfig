{ config, pkgs, ... }:
{

  home.packages = with pkgs; [ 
    spotify 
    vlc
    feh
    pavucontrol
    qbittorrent
  ];

}
