if [ -d ~/bin ]
then
   PATH=$PATH:~/bin
fi

#fastfetch

#aliases
alias spt="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias wj='curl wttr.in/jerusalem'
alias wp='curl wttr.in/paphos'
alias x='_x() { curl https://cht.sh/$1 ;}; _x'

alias c='clear'
alias r='ranger'
alias ff='fastfetch'

alias n="nano "
alias s="sudo "
alias sn="sudo nano "
alias v='vim '
alias sv='sudo vim '

alias rr="rm -rf "
alias srr="sudo rm -rf "

alias h="history "

alias we="whereis "
alias w="which "

alias cp="cp -i "
alias mv='mv -i'

alias l='eza -a --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias ll='exa -lha'
alias lk='lsblk'

alias bb="source ~/.bashrc"
alias n.="nano ~/.bashrc "
alias nb="nano ~/.bash_aliases"

alias v.="vim ~/.bashrc "
alias vb="vim ~/.bash_aliases"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cc='cd ~/.config/'
alias cdd='cd ~/Downloads/'
alias cdc='cd /mnt/data/'
alias cg='cd ~/git/'
alias cdf='cd ~/dotfiles/'

# yt-dlp
alias yt="yt-dlp -x --audio-format mp3 -o '~/Music/%(title)s.%(ext)s'"
alias ytm="yt-dlp -f mp4 -o '~/Videos/%(title)s.%(ext)s' " 

alias lo='sudo updatedb; locate'
alias lu='sudo updatedb'

alias md='mkdir -pv'

alias ctl="sudo systemctl "
alias open='xdg-open'
alias spo='sudo systemctl poweroff'
alias srb='sudo reboot'

alias gc='git clone'
alias gps='git push -u origin main'
alias g='cp ~/.config/FreeTube history.db playlists.db profiles.db search-history.db settings.db ~/dotfiles/freetube/.config/Freetube/ && cd ~/dotfiles && git status && cd -'
alias gss='git commit -m "save"'
alias ga='git add *'
alias gpp='git pull'
alias gg='cd ~/dotfiles && git add * && git commit -m "save" && git push -u origin main && cd -'
alias gp='cd ~/dotfiles && git pull && cd -'

alias ap='apropos'
alias b='btop'
alias t='htop'
alias nu='ncdu'
alias th='sudo -sE thunar'
alias nm='sudo -sE nemo'

alias ts='sudo -sE timeshift-gtk'
alias tc='sudo timeshift --create'
alias tr='sudo timeshift --restore'
alias tl='sudo timeshift --list'

alias gu='sudo -sE /sbin/gufw-pkexec'

alias ch='sudo chmod +x '
alias co='sudo chown vago: '
alias dk='sudo dpkg -i '
alias dkil='dpkg --get-selections | grep -v deinstall'

alias gd='sudo -sE gnome-disks'
alias ggp='sudo -sE gparted'

alias ug='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias cpk='du -sh /var/cache/pacman/pkg/'
alias cpd='sudo pacman -Scc && yay -Scc'

alias ccc='du -sh ~/.cache/'
alias ccd='rm -rf ~/.cache/*'

alias pi='sudo pacman -Syu --needed '
alias pss='sudo pacman -Ss'
alias pu='sudo pacman -Syyu'
alias pud='sudo pacman -Syu'
alias pui='sudo pacman -Rns'
alias psl='sudo nano /etc/pacman.conf'
alias pdg='sudo pacman -U'
alias pd='sudo pacman -Qdtq | sudo pacman -Rns '
#alias pd='sudo pacman -Rns $(pacman -Qqdt)'
alias tm='sudo fstrim -av'

alias pm='sudo nano /etc/pacman.d/mirrorlist'
alias pl='sudo cat /var/log/pacman.log'

alias u='sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm'

alias y='yay'
alias yi='yay -S --noconfirm'
alias ys='yay -Ss'
alias yu='yay -Syyu'
alias yd='yay -Yc'
alias yui='yay -Rns'

alias hh='nano ~/.config/hypr/hyprland.conf'
alias nwc='nano ~/.config/waybar/config'
alias nws='nano ~/.config/waybar/style.css'

alias chh='cd ~/.config/hypr/'
alias cdw='cd ~/.config/waybar/'

alias pp='hyprprop WM_CLASS'
