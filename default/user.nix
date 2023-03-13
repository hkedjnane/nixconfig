{config, pkgs, ... }:

{
  imports = [
    browser/browser.nix
    communication/communication.nix
    dev/dev.nix
    editor/editor.nix
    misc/misc.nix
    terminal/terminal.nix
    media/media.nix
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

}
