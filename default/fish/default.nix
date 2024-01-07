{config, pkgs, ...}:
{

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      lv = "ls -v";
      rebuild = "sudo nixos-rebuild switch -I nixos-config=/home/harsane/.config/home-manager/configuration.nix";
      hms = "home-manager switch";
    };

    functions = {
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      fshell = ''nix-shell --command fish $argv'';
      fdevelop = ''nix develop -c fish $argv'';
      posix = ''bash -c "$argv"'';
    };

    plugins = [
      {
        name = "dracula";
        src = pkgs.fetchFromGitHub {
        owner = "dracula";
        repo = "fish";
        rev = "HEAD";
        sha256 = "Hyq4EfSmWmxwCYhp3O8agr7VWFAflcUe8BUKh50fNfY=";
        };
      }
      {
        name = "nix.fish";
        src = pkgs.fetchFromGitHub {
        owner = "kidonng";
        repo = "nix.fish";
        rev = "HEAD";
        sha256 = "Hyq4EfSmWmxwCYhp3O8agr7VWFAflcUe8BUKh50fNfY=";
        };
      }
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "HEAD";
          sha256 = "+FUBM7CodtZrYKqU542fQD+ZDGrd2438trKM0tIESs0=";
        };
      }
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    # From https://draculatheme.com/starship
    settings = {
    aws.style = "bold #ffb86c";
    cmd_duration.style = "bold #f1fa8c";
    directory.style = "bold #50fa7b";
    hostname.style = "bold #ff5555";
    git_branch.style = "bold #ff79c6";
    git_status.style = "bold #ff5555";
    username = {
      format = "[$user]($style) on ";
      style_user = "bold #bd93f9";
    };
    character = {
      success_symbol = "[λ](bold #f8f8f2)";
      error_symbol = "[λ](bold #ff5555)";
    };
  };
  };
}
