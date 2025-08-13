{user, ...}:
{
home.file = {
"${user.home}/.config/gtk-3.0/bookmarks".source = ./.config/gtk-3.0/bookmarks;
"${user.home}/.config/gtk-3.0/settings.ini".source = ./.config/gtk-3.0/settings.ini;
"${user.home}/.gtkrc-2.0".source = ./home/.gtkrc-2.0;
};


}
