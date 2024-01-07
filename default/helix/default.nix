{ config, pkgs, lib, ... }:
{
  programs.helix = {
    enable = true;
    languages = {
    };

    settings = {
      theme = "dracula";

      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };
}
