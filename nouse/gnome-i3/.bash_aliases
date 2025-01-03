if [ -d ~/bin ]
then
   PATH=$PATH:~/bin
fi

#fastfetch

#aliases
alias spt="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

alias c='clear'
alias r='ranger'
alias ff='fastfetch'

alias ui="sudo apt purge -y && sudo apt autoremove -y"
alias i="sudo apt install "
alias ar="sudo apt autoremove -y"
alias upu='sudo apt update'
alias upl='sudo apt list --upgradable'
alias upg='sudo apt full-upgrade -y'
alias upf='flatpak update -y'
alias up="sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y && flatpak update -y"
alias ifb='sudo apt --fix-broken install'

alias n="nano "
alias s="sudo "
alias sn="sudo nano "

alias rr="rm -rf "
alias srr="sudo rm -rf "

alias h="history "

alias we="whereis "
alias w="which "
alias ss='sudo apt search'

alias cp="cp -i "
alias mv='mv -i'

alias l='eza -a --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias ll='exa -lha'
alias lk='lsblk'

alias bb="source ~/.bashrc"
alias n.="nano ~/.bashrc "
alias nb="nano ~/.bash_aliases"
alias nsl='sudo nano /etc/apt/sources.list'
alias ni='nano ~/.config/i3/config'
alias nib='nano ~/.config/i3blocks/config'
alias np='nano ~/.config/polybar/config.ini'
alias npi='nano ~/.config/picom/picom.conf'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cc='cd ~/.config/'
alias cdd='cd ~/Downloads/'
alias cdc='cd /mnt/data/'
alias cg='cd ~/git/'
alias cgg='cd ~/git/gnome/'
alias ci='cd ~/.config/i3/'
alias cii='cd ~/.config/i3blocks/'
alias cdf='cd ~/dotfiles/'

# yt-dlp
alias ytm="yt-dlp -x --audio-format mp3 -o '~/Music/%(title)s.%(ext)s'"
alias yt="yt-dlp -f mp4 -o '~/Videos/%(title)s.%(ext)s' " 

alias lo='sudo updatedb; locate'
alias lu='sudo updatedb'

alias md='mkdir -pv'

alias ctl="sudo systemctl "
alias open='xdg-open'
alias spo='sudo systemctl poweroff'
alias srb='sudo reboot'
alias si='sudo update-initramfs -u'

alias gc='git clone'
alias gps='git push -u origin main'
alias gs='git status'
alias gss='git commit -m "save"'
alias ga='git add *'
alias gpp='git pull'

alias ap='apropos'
alias b='btop'
alias t='htop'
alias nu='ncdu'
alias th='sudo -sE thunar'

alias ts='sudo -sE timeshift-gtk'
alias tc='sudo timeshift --create'
alias tr='sudo timeshift --restore'
alias tl='sudo timeshift --list'

alias syn='sudo -i synaptic'
alias gu='sudo -sE /sbin/gufw-pkexec'
alias st='sudo -sE stacer'

alias ch='sudo chmod +x '
alias co='sudo chown vago: '
alias dk='sudo dpkg -i '
alias dkil='dpkg --get-selections | grep -v deinstall'

alias gd='sudo -sE gnome-disks'
alias gp='sudo -sE gparted'

alias ug='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias cpk='du -sh /var/cache/pacman/pkg/'
#alias cpd='sudo pacman -Scc'
alias cpd='sudo pacman -Scc --noconfirm && yay -Scc --noconfirm'

alias ccc='du -sh ~/.cache/'
alias ccd='rm -rf ~/.cache/*'

alias pi='sudo pacman -Syu --needed --noconfirm '
alias ps='sudo pacman -Ss'
alias pus='sudo pacman -Syy'
alias pud='sudo pacman -Syu'
alias pui='sudo pacman -Rns'
alias psl='sudo nano /etc/pacman.conf'
alias pdg='sudo pacman -U'
#alias pu='sudo pacman -Syy && sudo pacman -Syu'
alias pd='sudo pacman -Qdtq | sudo pacman -Rns - ; sudo fstrim -av'
#alias pd='sudo pacman -Rns $(pacman -Qqdt)'
alias pq="sudo pacman -Qqe | grep -v "$(pacman -Qqm)""
alias pa='sudo pacman -Qqm'

alias pm='sudo nano /etc/pacman.d/mirrorlist'
alias pl='sudo cat /var/log/pacman.log'

alias u='sudo pacman -Syu --noconfirm && yay -Syu'

alias y='yay'
alias yi='yay -S --noconfirm'
alias ys='yay -Ss'
alias yu='yay -Syu'
#alias yd='yay -Yc'
alias yui='yay -Rns'

alias hh='nano ~/.config/hypr/hyprland.conf'
alias nwc='nano ~/.config/waybar/config'
alias chh='cd ~/.config/hypr/'
alias cdw='cd ~/.config/waybar/'
alias pp='hyprprop WM_CLASS'
alias ws='nano ~/.config/waybar/style.css'

