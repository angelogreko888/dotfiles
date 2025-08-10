{pkgs, ...}:
{

programs.hyprland = {
  enable = true;
  xwayland.enable = true;
  };

environment.sessionVariables = {
  WLR_NO_HARDWARE_CURSOR = "1";
  NIXOS_OZONE_WL ="1";
  };

hardware = {
 # graphics.enable = true;
 # nvidia.modesetting.enable = true;
  };

#services.xserver.videoDrivers = ["nvidia"];

#systemd.sleep.extraConfig = 2''
#    AllowSuspend = yes
#    AllowHibernation = yes
#  '';

#services.xserver.videoDrivers = ["nvidia"];

# hardware.nvidia = {
#    powerManagement.finegrained = true;
#    powerManagement.enable = true;
#    nvidiaPersistenced = true;
##    intelgpuBusId = "PCI:00:02:0";
# #   nvidiaBusId = "PCI:01:00:0";
#  };

environment.systemPackages = with pkgs; [ 
#    lenovo-legion
   ];

}
