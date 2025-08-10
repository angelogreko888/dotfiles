{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {

  "height"= 21;
  "position"= "top";
  "mod"= "dock";
  "layer"= "bottom";
  "margin-left"= 10;
  "margin-right"= 10;
  "margin-top"= 0;
  "margin-bottom"= 0;
  "exclusive"= true;
  "passthrough"= false ;
  "gtk-layer-shell"= true;
  "reload_style_on_change"= true;  
  "fixed-center"= true;

  "modules-left"= [
	"custom/nix"
	"hyprland/workspaces"
	"wlr/taskbar"
	"memory"
	"cpu"
    ];

  "modules-center"= [
	"hyprland/language"
	 "clock"
	"idle_inhibitor"
];

  "modules-right"= [
	"pulseaudio"
	"custom/swaync"
	"pulseaudio#microphone"
	"backlight"
	"network"
        "tray"
	"power-profiles-daemon"
	"battery"
        "custom/power"
    ];




  "custom/nix"= {
        "format"= "";
        "on-click"= "fuzzel";
        "tooltip"= false;
    };

  "hyprland/workspaces"= {
        "on-click"= "activate";
        "format"= "{name}";
    };

   
   "idle_inhibitor"= {
         "format"= "{icon}";
         "format-icons"= {
                "activated"= "";
                "deactivated"= "";
	       };
    };

   "tray"= {
        "icon-size"= "21";
        "spacing"= "10";
    };

   "custom/clock"= {
	 "format"= "{:%I:%M}";
# "exec"= "date +\"%-I:%M %P\"";
#         "interval"= "0.1"; 
	 "tooltip"= false;  
	};

   "clock"= {
         "format"= "{:%I:%M %p  %a %b %d}";
         "tooltip-format"= "<tt>{calendar}</tt>";
   "calendar"= {
         "mode"= "month";
         "mode-mon-col"= "3";
         "on-scroll"= "1";
         "on-click-right"= "mode";
         "format"= {
              "months"= 
              "<span color='#ffead3'><b>{}</b></span>";
              "weekdays"= 
              "<span color='#ffcc66'><b>{}</b></span>";
              "today"= 
              "<span color='#ff6699'><b>{}</b></span>";
          }; 
      };
      "actions"= {
             "on-click-right"= "mode";
             "on-click-forward"= "tz_up";
             "on-click-backward"= "tz_down";
             "on-scroll-up"= "shift_up";
             "on-scroll-down"= "shift_down";
          };
    };

   "cpu"= {
        "format"= "{usage}%  ";
        "tooltip"= true;
        "interval"= "1";
    };

   "memory"= {
        "format"= "{used:0.1f} ";
        "interval"= "1";
	"tooltip"= false;
	"on-click-right"= "foot btop";
	};

   "backlight"= {
    	"interval"= "2";
        "align"= "0";
        "rotate"= "0";
        "format"= "{icon}";
        "format-icons"= ["" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "󰃠"];
        "tooltip-format"= "backlight {percent}%";
        "icon-size"= "10";
        "on-click"= "";
        "on-click-middle"= "";
        "on-click-right"= "";
        "on-update"= "";
        "on-scroll-up"= "$HOME/dotnix/home/modules/waybar/scripts/Brightness.sh --inc";
        "on-scroll-down"= "$HOME/dotnix/home/modules/waybar/scripts/Brightness.sh --dec";
        "smooth-scrolling-threshold"= "1";
    };

    "battery"= {
	    "states"= {
	         "warning"= "30";
	         "critical"= "15";
	    };
    	"format"= "<span size='13000' foreground='#a6e3a1'>{icon} </span> {capacity}%";
    	"format-warning"= "<span size='13000' foreground='#B1E3AD'>{icon} </span> {capacity}%";
    	"format-critical"= "<span size='13000' foreground='#E38C8F'>{icon} </span> {capacity}%";
    	"format-charging"= "<span size='13000' foreground='#B1E3AD'> </span>{capacity}%";
    	"format-plugged"= "<span size='13000' foreground='#B1E3AD'> </span>{capacity}%";
    	"format-alt"= "<span size='13000' foreground='#B1E3AD'>{icon} </span> {time}";
    	"format-full"= "<span size='13000' foreground='#B1E3AD'> </span>{capacity}%";
    	"format-icons"= [""  ""  ""  ""  ""];
    	"tooltip-format"= "{time}";
    	"on-click-right"= "$HOME/dotnix/home/modules/waybar/relaunch.sh &";
	  };


    "power-profiles-daemon"= {
         "format"= "{icon}";
         "tooltip-format"= "Power profile= {profile}\nDriver= {driver}";
         "tooltip"= true;
         "format-icons"= {
         "default"= "";
         "performance"= "";
         "balanced"= "";
         "power-saver"= "";
      };
    };


    "network"= {
         "format"= "{ifname}";
         "format-wifi"= "{icon}";
         "format-ethernet"= "󰈀";
         "format-disconnected"= "󰌙";
         "tooltip-format"= "{ipaddr}  {bandwidthUpBits}  {bandwidthDownBits}";
         "format-linked"= "󰈁 {ifname} (No IP)";
         "tooltip-format-wifi"= "{essid} {icon} {signalStrength}%";
         "tooltip-format-ethernet"= "{ipaddr}  {bandwidthUpBits}  {bandwidthDownBits}";
         "tooltip-format-disconnected"= "󰌙 Disconnected";
         "icon-size"= "21";
         "max-length"= "30";
         "interval"= "1";
         "format-icons"= [
            "󰤯"  "󰤟"  "󰤢"  "󰤥"  "󰤨"
        ];
    "on-click-right"= "foot nmtui";
};

    "pulseaudio"= {
         "format"= "{volume} {icon}";
         "format-bluetooth"= "{icon} 󰂰 {volume}%";
         "format-muted"= "󰖁";
         "format-icons"= {
         "headphone"= "";
         "hands-free"= "";
         "headset"= "";
         "phone"= "";
         "portable"= "";
         "car"= "";
         "default"= [
            ""  ""  "󰕾"   ""
        ];
         "ignored-sinks"= [
		"Easy Effects Sink"
        ];
	};
        "scroll-step"= "5.0";
        "on-click"= "$HOME/dotnix/home/modules/waybar/scripts/Volume.sh --toggle";
        "on-click-right"= "pavucontrol -t 3";
        "on-scroll-up"= "$HOME/dotnix/home/modules/waybar/scripts/Volume.sh --inc";
        "on-scroll-down"= "$HOME/dotnix/home/modules/waybar/scripts/Volume.sh --dec";
        "smooth-scrolling-threshold"= "1";
	"tooltip"= false;
	};

    "pulseaudio#microphone"= {
        "format"= "{format_source}";
        "format-source"= "{volume} ";
        "format-source-muted"= "";
        "on-click"= "$HOME/dotnix/home/modules/waybar/scripts/Volume.sh --toggle-mic";
        "on-click-right"= "pavucontrol -t 4";
        "on-scroll-up"= "$HOME/dotnix/home/modules/waybar/scripts/Volume.sh --mic-inc";
        "on-scroll-down"= "$HOME/dotnix/home/modules/waybar/scripts/Volume.sh --mic-dec";
        "scroll-step"= "5";
	"tooltip"= false;
	};


    "custom/power"= {
        "format" = "⏻ ";
        "tooltip"= false;
        "menu"= "on-click";
	"menu-file" = "$HOME/dotnix/home/modules/waybar/power_menu.xml";
        "menu-actions"= {
            "shutdown"= "~/bin/poweroff.sh";	
            "reboot"= "~/bin/reboot.sh";
            "suspend"= "~/bin/suspend.sh";
	    "log out"= "~/bin/exit.sh";
        };
    };

    "hyprland/window"= {  
        "format"= "<span  weight='regular' >{class}</span>";
        "max-length"= "120";
        "icon"= false;
        "icon-size"= "17";
	};	

    "bluetooth"={
    	"format-on"= "<span color='#e57474'></span>  Turned On";
    	"format-off"= "<span color='#e57474'></span>  Turned Off";
    	"format-disabled"= [
		"<span color='#e57474'></span>  Disabled"
    		"<span color='#00ffff'></span> "
		];
        "format-connected"= "<span color='#e57474'></span> Connected";
    	"format"= [
		"<span color='#e57474'></span> Disabled"
        	"<span color='#ff0000'></span> "
		];
        "on-click"="blueman-manager &";
    };

    "hyprland/language"={
	    "format"= "{}";
        "format-en"= "🇺🇸";
	    "format-gr"= "🇬🇷";
	    "format-he"= "🇮🇱";
	};

	"custom/swaync"= {
        "tooltip"= true;
        "tooltip-format"= "Left Click= Launch Notification Center\nRight Click= Do not Disturb";
        "format"= " {icon} ";
        "format-icons"= {
            "notification"= "<span foreground='red'><sup></sup></span>";
            "none"= "";
            "dnd-notification"= "<span foreground='red'><sup></sup></span>";
            "dnd-none"= "";
            "inhibited-notification"= "<span foreground='red'><sup></sup></span>";
            "inhibited-none"= "";
            "dnd-inhibited-notification"= "<span foreground='red'><sup></sup></span>";
            "dnd-inhibited-none"= "";
        };
        "return-type"= "json";
        "exec-if"= "which swaync-client";
        "exec"= "swaync-client -swb";
        "on-click"= "sleep 0.1 && swaync-client -t -sw";
        "on-click-right"= "swaync-client -d -sw";
        "escape"= true;
	};


 "custom/notifications"= {
        "format"= "{icon}"; 
        "format-icons"= {
            "email-notification"= "<span foreground='white'><sup></sup></span>";
            "chat-notification"= "󱋊<span foreground='white'><sup></sup></span>";
            "warning-notification"= "󱨪<span foreground='yellow'><sup></sup></span>";
            "error-notification"= "󱨪<span foreground='red'><sup></sup></span>";
            "network-notification"= "󱂇<span foreground='white'><sup></sup></span>";
            "battery-notification"= "󰁺<span foreground='white'><sup></sup></span>";
            "update-notification"= "󰚰<span foreground='white'><sup></sup></span>";
            "music-notification"= "󰝚<span foreground='white'><sup></sup></span>";
            "volume-notification"= "󰕿<span foreground='white'><sup></sup></span>";
            "notification"= "<span foreground='white'><sup></sup></span>";
            "dnd"= "";
            "none"= "";
        };
        "return-type"= "json";
        "exec-if"= "which dunstctl";
        "exec"= "~/.config/dunst/notifications.py";
        "on-scroll-down"= "sleep 0.1 && dunstctl history-pop";
        "on-click"= "dunstctl set-paused toggle";
        "on-click-middle"= "dunstctl history-clear";
        "on-click-right"= "dunstctl close-all";
        "interval"= "1";
        "tooltip"= true;
        "escape"= true;
    };

	"wlr/taskbar"= {
        "format"= "{icon}";
        "icon-size"= "21";
        "all-outputs"= false;
        "tooltip-format"= "{title}";
        "on-click"= "activate";
        "on-click-middle"= "close";
        "ignore-list"= [
            "wofi"
            "rofi"
            "foot"
        ];
    };

};
};
};
}

