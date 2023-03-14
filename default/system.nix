{config, pkgs, ... }:

{

  imports = [
    vpn/vpn.nix
    desktop/desktop.nix
    display/display.nix
  ];

}
