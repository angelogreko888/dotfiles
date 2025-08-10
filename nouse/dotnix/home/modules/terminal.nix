{ pkgs, lib, ... }:
let
  launcher = pkgs.writeShellScriptBin "terminal" ''
    if [ "$1" == "" ]
    then
      footclient
    else
      footclient -E $(which $1) ''${@:2}
    fi
  '';
in
{
#  home.packages = [ launcher ];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "${pkgs.fish}/bin/fish";
        font = "JetBrainsMono NF:size=12";
	pad = "13x0 center";
	term = "xterm-256color";
	};
	scrollback.lines = " 100000";
	cursor.style="beam";
	cursor.blink=true;
	cursor.beam-thickness=1.5;
	colors.alpha=0.88;
	key-bindings = {
	clipboard-copy="Control+c";
	clipboard-paste="Control+v";
	scrollback-up-page="Page_Up";
	scrollback-down-page="Page_Down";
	search-start="Control+f";
	};
	};
	};

}
