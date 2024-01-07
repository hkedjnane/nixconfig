{lib, pkgs, config, ...}:
{
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
    lfs.enable = true;
  };
}
