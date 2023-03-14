{config, pkgs, ...}:
{

  home.packages = with pkgs; [
    dmenu
    i3lock
  ];

  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
       bars = [];
      };
      extraConfig = builtins.readFile ./i3_config;
    };
  };

}
