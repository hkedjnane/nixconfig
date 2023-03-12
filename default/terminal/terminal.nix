{config, pkgs, ...}:
{

  home.sessionVariables = {
    TERM = "kitty";
    TERMINAL = "kitty";
  };

  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.iosevka;
      name = "Ioseva Term";
      size = 15;
    };
    theme = "Dracula";

    settings = {
      confirm_os_window_close = 0;
    };

  };

}
