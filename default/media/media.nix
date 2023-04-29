{ config, pkgs, ... }:
{

  home.packages = with pkgs; [ 
    spotify 
    vlc
    feh
    pavucontrol
    qbittorrent
    playerctl
  ];
  
  # Media controls daemon
  services.playerctld = {
    enable = true;
    package = pkgs.playerctl;
  };

}
