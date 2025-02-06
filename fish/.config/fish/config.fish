if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_color_valid_path --underline

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

    echo \n (set_color yellow)∋∈  ∋∈  ∋∈    (set_color green) (prompt_pwd --full-length-dirs 8)  (set_color red) $stat ' '
end


#aliases
abbr spt "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
abbr wj 'curl wttr.in/jerusalem'
abbr wp 'curl wttr.in/paphos'
abbr x '_x() { curl https://cht.sh/$1 ;}; _x'

abbr c 'clear'
abbr r 'ranger'
abbr ff 'fastfetch'

abbr n "nano "
abbr s "sudo "
abbr sn "sudo nano "
abbr v 'vim '
abbr sv 'sudo vim '

abbr rr "rm -rf "
abbr srr "sudo rm -rf "

abbr h "history "

abbr we "whereis "
abbr w "which "

abbr cp "cp -i "
abbr mv 'mv -i'

abbr l 'eza -a --color always --long --git --no-filesize --icons always --no-time --no-user --no-permissions'
abbr ll 'exa -lha'
abbr lk 'lsblk'

abbr bb "source ~/.bashrc"
abbr n. "nano ~/.bashrc "
abbr nb "nano ~/.bash_aliases"

abbr v. "vim ~/.bashrc "
abbr vb "vim ~/.bash_aliases"

abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr cc 'cd ~/.config/'
abbr cdd 'cd ~/Downloads/'
abbr cdc 'cd /mnt/data/'
abbr cg 'cd ~/git/'
abbr cdf 'cd ~/dotfiles/'

# yt-dlp
abbr yt "yt-dlp -x --audio-format mp3 -o '~/Music/%(title)s.%(ext)s'"
abbr ytm "yt-dlp -f mp4 -o '~/Videos/%(title)s.%(ext)s' "

abbr lo 'sudo updatedb; locate'
abbr lu 'sudo updatedb'

abbr md 'mkdir -pv'

abbr ctl "sudo systemctl "
abbr open 'xdg-open'
abbr spo 'sudo systemctl poweroff'
abbr srb 'sudo reboot'

abbr gc 'git clone'
abbr gps 'git push -u origin main'
abbr g 'cd ~/dotfiles && git status && cd -'
abbr gss 'git commit -m "save"'
abbr ga 'git add *'
abbr gpp 'git pull'
abbr gg 'cd ~/dotfiles && git add * && git commit -m "save" && git push -u origin main && cd -'
abbr gp 'cd ~/dotfiles && git pull && cd -'

abbr ap 'apropos'
abbr b 'btop'
abbr t 'htop'
abbr nu 'ncdu'
abbr th 'sudo -sE thunar'
abbr nm 'sudo -sE nemo'

abbr ts 'sudo -sE timeshift-gtk'
abbr tc 'sudo timeshift --create'
abbr tr 'sudo timeshift --restore'
abbr tl 'sudo timeshift --list'

abbr gu 'sudo -sE /sbin/gufw-pkexec'

abbr ch 'sudo chmod +x '
abbr co 'sudo chown vago: '
abbr dk 'sudo dpkg -i '
abbr dkil 'dpkg --get-selections | grep -v deinstall'

abbr gd 'sudo -sE gnome-disks'
abbr ggp 'sudo -sE gparted'

abbr ug 'sudo grub-mkconfig -o /boot/grub/grub.cfg'

abbr cpk 'du -sh /var/cache/pacman/pkg/'
abbr cpd 'sudo pacman -Scc && yay -Scc'

abbr ccc 'du -sh ~/.cache/'
abbr ccd 'rm -rf ~/.cache/*'

abbr pi 'sudo pacman -Syu --needed '
abbr pss 'sudo pacman -Ss'
abbr pu 'sudo pacman -Syyu'
abbr pud 'sudo pacman -Syu'
abbr pui 'sudo pacman -Rns'
abbr psl 'sudo nano /etc/pacman.conf'
abbr pdg 'sudo pacman -U'
abbr pd 'sudo pacman -Qdtq | sudo pacman -Rns '
#abbr pd 'sudo pacman -Rns $(pacman -Qqdt)'
abbr tm 'sudo fstrim -av'

abbr pm 'sudo nano /etc/pacman.d/mirrorlist'
abbr pl 'sudo cat /var/log/pacman.log'

abbr u 'sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm'

abbr y 'yay'
abbr yi 'yay -S --noconfirm'
abbr ys 'yay -Ss'
abbr yu 'yay -Syyu'
abbr yd 'yay -Yc'
abbr yui 'yay -Rns'

abbr hh 'nano ~/.config/hypr/hyprland.conf'
abbr nwc 'nano ~/.config/waybar/config'
abbr nws 'nano ~/.config/waybar/style.css'

abbr chh 'cd ~/.config/hypr/'
abbr cdw 'cd ~/.config/waybar/'

abbr pp 'hyprprop WM_CLASS'
