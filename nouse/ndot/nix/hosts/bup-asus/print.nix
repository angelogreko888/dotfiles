{ pkgs, ... }:
{
  services = {
    avahi = {
      enable = true;
    nssmdns4 = true;
      openFirewall = true;
    };
    printing = {
      enable = true;
      drivers = [ 
	pkgs.cups 
	pkgs.cups-filters
	];
    };
  };
#  hardware.sane.enable = true;

hardware = {
    sane = {
      enable = true;
      brscan4 = {
        enable = true;
        netDevices = {
          home = { 
	model = "MFC-1910W"; 
###	ip = "192.168.1.111"; 
	};
        };
      };
    };
  };


}
