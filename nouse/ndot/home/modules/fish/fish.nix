{ pkgs, user, ... }:
{
  home.packages = with pkgs; [ eza ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
#      set fish_greeting

#if test (tty) = /dev/tty1;
#        while test -f ~/.tty1-gui-only;
#          hyprland-launcher;
#        end;
#      end;

set fish_color_valid_path

set -g fish_greeting

set -l last_status $status

if test $last_status -ne 0
    set stat (set_color red)"[$last_status]"(set_color normal)
end

function fish_prompt
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
end

echo \n   (set_color -o brblue)   ∋∈ (set_color -o brwhite) ∋∈ (set_color -o brblue) ∋∈ (set_color -o brwhite) ∋∈ (set_color -o brblue) ∋∈ (set_color -o brblue)    (set_color -oi yellow) (prompt_pwd --full-length-dirs 8)  (set_color -o brblue) $stat '  ' 
end


export ANDROID_HOME=/opt/android-sdk/


  #aliases
alias spt "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias wj "curl wttr.in/jerusalem"
alias wp "curl wttr.in/paphos"
#alias xx "_x() { curl https://cht.sh/$1 ;}; _x"

alias c "clear"
alias r "ranger"
alias ff "fastfetch"

alias n "nano"
alias s "sudo"
alias sn "sudo nano"
alias v "vim"
alias sv "sudo vim"

alias rr "rm -rf"
alias srr "sudo rm -rf"

alias h "history"
alias hg "history | grep "

alias we "whereis"
alias w "which"

alias cp "cp -i"
alias mv "mv -i"

alias l "eza -a --color always --long --git --no-filesize --icons always --no-time --no-user"
alias ll "exa -lha"
alias lk "lsblk"

alias bb "source ~/.bashrc"
alias nb "nano ~/.bashrc"
alias nba "nano ~/.bash_aliases"

alias vb "vim ~/.bashrc"
alias vba "vim ~/.bash_aliases"

alias ".." "cd .."
alias "..." "cd ../.."
alias "...." "cd ../../.."
alias cc "cd ~/.config/"
alias cg "cd ~/git/"

# yt-dlp
alias yt "yt-dlp -x --audio-format mp3 -o='~/Music/%(title)s.%(ext)s'"
alias ytm "yt-dlp -f mp4 -o='~/Videos/%(title)s.%(ext)s'"

alias lo "find ~ -name "'$1'""

alias md "mkdir -pv"

alias ctl "sudo systemctl"
alias xopen "xdg-open"
alias spo "sudo systemctl poweroff"
alias srb "sudo reboot"

alias gc "git clone"
alias gps "git push -u origin main"
alias g "~/bin/gstatus.sh"
#alias g "cd ~/ndot && git status && cd -"
alias gss "git commit -m "save""
alias ga "git add *"
alias gpp "git pull"
alias gg "cd ~/ndot && git add * && git commit -m "commit" && git push -u origin main && cd -"
alias gp "cd ~/ndot && git pull && cd -"
alias ggg "~/bin/gpush.sh"

alias ap "apropos"
alias b "btop"
alias t "htop"
alias nur "ncdu / --exclude /mnt --exclude /vt"
alias nu "ncdu ."
alias th "sudo -sE thunar"
alias nm "sudo -sE nemo"

alias ts "sudo -sE timeshift-gtk"
alias tsc "sudo timeshift --create"
alias tsr "sudo timeshift --restore"
alias tsl "sudo timeshift --list"
alias tss "~/bin/tshift.sh"

alias gu "sudo -sE /sbin/gufw-pkexec"

alias ch "chmod +x"
alias co "sudo chown vago:"
alias dk "sudo dpkg -i"
alias dkil "dpkg --get-selections | grep -v deinstall"

alias gd "sudo -sE gnome-disks"
alias ggp "sudo -sE gparted"
alias gw "sudo -sE usbimager"

alias ug "sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias ccc "du -sh ~/.cache/"
alias cdd "cd ~/Downloads"

alias tm "sudo fstrim -av"

alias pp "hyprprop WM_CLASS"

alias cf "nano  ~/ndot/home/modules/fish/fish.nix"
alias cpi "~/bin/cpinst.sh"
alias bh "~/bin/bh"
alias ngr "sudo nano /etc/default/grub"
alias ftr "systemctl daemon-reload"
alias ft "sudo nano /etc/fstab"
alias ba "sudo nano  /boot/loader/entries/2025-04-16_12-24-46_linux.conf"
alias fh "nano  ~/.local/share/fish/fish_history"
alias af "nano ~/.config/fish/alias.fish"

alias mf " sudo -sE mintstick -m format"
alias mi " sudo -sE mintstick -m iso"

alias lp "sudo -sE tlpui"

#alias fc "sudo sh -c "echo 3 >/proc/sys/vm/drop_caches""
alias se "~/bin/sleep.sh"
alias ee "pgrep sleep"
alias d "dysk"
alias f "fish"

alias cdc "cd /mnt/data"
alias cdv "cd /mnt/vt"

alias cdn "cd ~/ndot/nix/"
alias cdh "cd ~/ndot/home/"
alias chm "cd ~/ndot/home/modules/"
alias cen "cd /etc/nixos/"
alias chh "cd ~/ndot/home/modules/hyprland"
alias cdw "cd ~/ndot/home/modules/waybar/"
alias cnm "cd ~/ndot/nix/modules"
alias cnh "cd ~/ndot/nix/hosts"
alias cdt "cd ~/ndot/"
alias cbb "cd ~/ndot/home/modules/bin/"

alias hs "home-manager switch --flake ~/ndot/home/#vago"
alias sw "~/bin/switch.sh"


'';

};
}
