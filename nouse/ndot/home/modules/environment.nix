{ pkgs, ... }:
{
  home.sessionVariables = {
    SHELL = "${pkgs.fish}/bin/fish";
    TERMINAL = "foot";
    BROWSER = "librewolf";
    NIXPKGS_ALLOW_UNFREE = "1";
  };
}
