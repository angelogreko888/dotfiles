{
  services.kanshi = {
  enable = true;
  systemdTarget = "hyprland-session.target";

  settings = [
  { profile.name = "undocked";
    profile.outputs = [
       {
        criteria = "eDP-1";
        status = "enable";
     }
	
    ];
  }
  
  { profile.name = "docked";
    profile.outputs = [
      {
        criteria = "eDP-1";
        status = "disable";
     }

      {
        criteria = "LG Electronics LG TV 0x01010101";
	position = "0,0";
        mode = "1920x1080@60Hz";
        scale = 1.0; 
      }


    ];
   }
  ];
};
}



