{ config, pkgs, ... }:

{

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      dracula-theme.theme-dracula
      ms-vscode.cmake-tools
      github.copilot
      mkhl.direnv
      github.vscode-pull-request-github
      ms-vsliveshare.vsliveshare
      bbenoist.nix
      vscodevim.vim
      xaver.clang-format
      file-icons.file-icons
    ] ++pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "TabOut";
        publisher = "albert";
        version = "0.2.2";
        sha256 = "sha256-s306AHMkUFPaG7ISIr0RscK/k6OVtniIG1CQprBx+cY";
      }
    ];

    userSettings = {
    "workbench.colorTheme" =  "Dracula";
    "workbench.iconTheme" = "file-icons";
    "editor.fontFamily" = "Fira Code";
    "editor.fontLigatures" = true;
    "editor.fontSize" = 14;
    "window.menuBarVisibility" =  "toggle";
    "editor.inlineSuggest.enabled" = true;
    "extensions.ignoreRecommendations" = true;
    "editor.formatOnSave" = true;
    "editor.lineNumbers" = "relative";
    "terminal.integrated.fontFamily" = "monospace";
    };
  };

  # Enable direnv and nix-direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userEmail = "harrys.kedjnane@epita.fr";
    userName = "Harrys Kedjnane";
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
    };
  };

  home.packages = with pkgs.gitAndTools; [ 
    git-absorb
  ];



  services.gnome-keyring = {
    enable = true;
    components = ["secrets" "ssh"];
  };
}
