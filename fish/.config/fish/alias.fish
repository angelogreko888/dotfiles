#aliases
alias spt="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias wj='curl wttr.in/jerusalem'
alias wp='curl wttr.in/paphos'
#alias xx='_x() { curl https://cht.sh/$1 ;}; _x'

alias ui="sudo apt purge -y && sudo apt autoremove -y"
alias i="sudo apt install "
alias ar="sudo apt autoremove -y"
alias upu='sudo apt update'
alias upl='sudo apt list --upgradable'
alias upg='sudo apt full-upgrade -y'
alias upf='flatpak update -y'
#alias up="sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y && flatpak update -y"
alias u="sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y"
alias ifb='sudo apt --fix-broken install'
alias ss='sudo apt search'

alias c='clear'
alias r='ranger'
alias ff='fastfetch'

alias n="nano"
alias s="sudo"
alias sn="sudo nano"

alias rr="rm -rf"
alias srr="sudo rm -rf"

alias h="history"

alias we="whereis"
alias w="which"

alias cp="cp -i"
alias mv='mv -i'

alias l='exa -a --color always --long --git --no-filesize --icons  --no-time --no-user'
alias ll='exa -lha'
alias lk='lsblk'

alias bb="source ~/.bashrc"
alias n.="nano ~/.bashrc"
alias nb="nano ~/.bash_aliases"
alias nsl='sudo nano /etc/apt/sources.list'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cc='cd ~/.config/'
alias cdd='cd ~/Downloads/'
alias cdc='cd /mnt/data/'
alias cg='cd ~/git/'
alias cdf='cd ~/dotfiles/'

# yt-dlp
alias yt="yt-dlp -x --audio-format mp3 -o='~/Music/%(title)s.%(ext)s'"
alias ytm="yt-dlp -f mp4 -o='~/Videos/%(title)s.%(ext)s'"

alias lo='sudo updatedb; locate'
alias lu='sudo updatedb'

alias md='mkdir -pv'

alias ctl="sudo systemctl"
alias xopen='xdg-open'
alias spo='sudo systemctl poweroff'
alias srb='sudo reboot'
alias si='sudo update-initramfs -u'

alias gc='git clone'
alias gps='git push -u origin main'
alias g='~/bin/gstatus.sh'
#alias g='cd ~/dotfiles && git status && cd -'
alias gss='git commit -m "save"'
alias ga='git add *'
alias gpp='git pull'
alias gg='cd ~/dotfiles && git add * && git commit -m "save" && git push -u origin main && cd -'
alias gp='cd ~/dotfiles && git pull && cd -'
alias ggg='~/bin/gpush.sh'

alias ap='apropos'
alias b='btop'
alias t='htop'
alias nu='ncdu'


alias ts='sudo -sE timeshift-gtk'
alias tsc='sudo timeshift --create'
alias tsr='sudo timeshift --restore'
alias tsl='sudo timeshift --list'
alias tss='~/bin/tshift.sh'

alias uf='sudo -sE /sbin/gufw-pkexec'

alias gu='sudo update-grub'

alias ch='chmod +x'
alias co='sudo chown vago:'
alias dk='sudo dpkg -i'
alias dkil='dpkg --get-selections | grep -v deinstall'

alias gd='sudo -sE gnome-disks'
alias ggp='sudo -sE gparted'
alias gw='sudo -sE usbimager'

alias ccc='du -sh ~/.cache/'
alias ccd='rm -rf ~/.cache/*'



alias cf='nano  ~/.config/fish/config.fish'
alias cpi='~/bin/cpinst.sh'
alias bh='~/bin/bh'
alias ngr='sudo nano /etc/default/grub'
alias ftr='systemctl daemon-reload'
alias ft='sudo nano /etc/fstab'
alias ba='sudo nano  /boot/loader/entries/arch.conf'
alias fh='nano  ~/.local/share/fish/fish_history'
alias af='nano ~/.config/fish/alias.fish'

alias mf=' sudo -sE mintstick -m format'
alias mi=' sudo -sE mintstick -m iso'

alias fc="sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'"
