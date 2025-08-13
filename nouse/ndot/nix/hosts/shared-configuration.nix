{ config, pkgs, lib, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.displayManager.ly.enable = true;

  boot.loader.timeout = 1;
  boot.loader.grub.extraEntries = "Defaults timestamp_timeout=999";

  programs.fish.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true; 
  boot.supportedFilesystems = [ "ntfs" ];

 environment.systemPackages = with pkgs; [
  home-manager
  fishPlugins.done
  fishPlugins.grc
  grc

  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
#     autoUpgrade.enable = true;
#     autoUpgrade.allowReboot = true; 
  };

  programs = {
    # Nixos Helper for cleanup and commands
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 14d --keep 12";
      flake = "/home/vago/ndot/nix";
      };
    };


#security.wrappers = {
#  firejail = {
#    source = "${pkgs.firejail}/bin/firejail";
#    owner = "root";
#    group = "wheel";
#    setuid = true;
##    setguid = true;
#  };
#};


}
