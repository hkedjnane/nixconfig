{config, pkgs, ...}:
{
  environment.pathsToLink = [ "/libexec" ];

  services.xserver.displayManager = {
    defaultSession = "none+i3";
  };

  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    configFile = ./i3_config;
    extraPackages =  with pkgs; [
      dmenu
      i3status
      i3lock
    ];
  };
}
