{config, pkgs, ... }:
{

  #No desktop used
  services.xserver.desktopManager = {
    default = "none";
    xterm.enable = false;
  };
}
