{config, pkgs, ... }:
{

  #No desktop used
  services.xserver.desktopManager = {
    session = [
      {
        name = "home-manager";
        start = ''
          ${pkgs.runtimeShell} $HOME/.hm-xsession &
          waitPID=$!
        '';
      }
    ];
  };
}
