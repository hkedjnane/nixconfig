{config, pkgs, ... }:

{

  # The confguration is handled by home-manager, but we have to enable it system-wide too
  programs.fish.enable = true;

  programs.kdeconnect.enable = true;

  # Sets the default shell for my user
  user.users."harsane".shell = pkgs.fish;

  # Steam is weird so it has to be installed by the system
  programs.steam.enable = true;

  # Enables mullvad
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  services.gnome.gnome-keyring.enable = true;

  boot.plymouth = {
    enable = true;
    theme = "breeze";
  };

  programs.dconf.enable = true;


  # This enables fingerprint login
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;


  imports = [
  ];

}
