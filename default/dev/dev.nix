{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    vscode-fhs
  ];

  # Enable direnv and nix-direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.git = {
    enable = true;
    userEmail = "harrys.kedjnane@epita.fr";
    userName = "Harrys Kedjnane";
  };

  services.gnome-keyring = {
    enable = true;
    components = ["secrets" "ssh"];
  };
}
