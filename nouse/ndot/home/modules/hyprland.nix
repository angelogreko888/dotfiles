{ pkgs, ... }:
let
   extraConfig = pkgs.writeShellScriptBin "hyprland-extra-config" ''
    if ! [ -f $HOME/.config/hypr/extra.conf ]; then
      touch $HOME/.config/hypr/extra.conf
      hyprctl reload
    fi
  '';
   launcher = pkgs.writeShellScriptBin "hyprland-launcher" ''
    . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    dbus-run-session ${pkgs.hyprland}/bin/Hyprland &> /dev/null
  '';
    startPortals = pkgs.writeShellScriptBin "start-portals" ''
    systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    dbus-update-activation-environment
    dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    systemctl --user start xdg-desktop-portal
    systemctl --user start xdg-desktop-portal-hyprland
  '';
in
  {
  imports = [ ./hyprland ];

  home.packages = [ launcher startPortals ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
 };
}
