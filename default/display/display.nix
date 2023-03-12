{config, pkgs, ... }:
{

  services.xserver.displayManager.lightdm = {
    enable = true;
    greeter.enable = true;
  };

}
