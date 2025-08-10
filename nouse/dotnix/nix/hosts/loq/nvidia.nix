{ config, pkgs, inputs, lib, ... }:
{
#imports = [
#    inputs.nixos-hardware.nixosModules.common-gpu-nvidia
#];

boot = {
#    initrd.systemd.dbus.enable = true;
    kernelParams = [ "i915.enable_guc=2" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" "nvidia-drm.fbdev=1" ];
  };

#hardware = {
# graphics = {
#      # For 32 bit applications
#      # enable32Bit = true;
#      enable = true;
#    };
#};
# services.xserver.videoDrivers = [ "nvidia" ];
#
systemd.sleep.extraConfig =
  ''
    AllowSuspend = yes
    AllowHibernation = yes
  '';

#hardware.nvidia = {
#    modesetting.enable = true;
#    videoAcceleration = false;
#    # dynamicBoost.enable = true;
#    powerManagement.enable = true;
#    powerManagement.finegrained = false;
#    open = true;
#    nvidiaSettings = true;
#    package = config.boot.kernelPackages.nvidiaPackages.beta;
#    prime = {
#      offload = {
#        enable = true;
#        enableOffloadCmd = true; 
#      };
#
#      intelBusId = "PCI:00:02:0";
#      nvidiaBusId = "PCI:01:0:0";
#    };
#  };
#
#
#
}
