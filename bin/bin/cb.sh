#!/usr/bin/env bash
handle_error() {
      echo "An error occurred on line $1"
      exit 1
  }

  trap 'handle_error $LINENO' ERR


a=$(hostnamectl | rg Model | awk '{print $3}')

if [ $a == LOQ ];then
cp=q
elif [ $a == Lenovo ];then
cp=l
fi

case $cp in
        q)  ;;
        l)  ;;
        d)  ;;
        *) echo "enter a laptop name" && exit 0 ;;
esac

pacman -Qqe | grep -v "$(pacman -Qqm)" > $HOME/dotfiles/misc/$cp.paclst
pacman -Qqm > $HOME/dotfiles/misc/$cp.aurlst

bh=~/.bash_history
fh=~/.local/share/fish/fish_history
lst=(
~/.bash_history
~/.local/share/fish/fish_history
)
for ht in "${lst[@]}";do
	if [ $ht == $bh ]; then
	h=.bash_history
	elif [ $ht == $fh ]; then
	h=fish_history
	fi

	cat $ht >> ~/dotfiles/nouse/rootmisc/$h
	sed -i '/git remote set-url origin /d' ~/dotfiles/nouse/rootmisc/$h
	awk -i inplace '!seen[$0]++' ~/dotfiles/nouse/rootmisc/$h
	sed -i '/when:/d'  ~/dotfiles/nouse/rootmisc/$h
done
