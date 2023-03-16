{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    vscode-fhs
];

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
