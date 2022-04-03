#!/usr/bin/env zsh

sudo pacman -Sy brave-browser tilix btop copyq appimagelauncher gcc python-pip
sudo pip3 install xkeysnail 
/bin/bash -c "$(wget -qO- https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh || curl -fsSL https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh)"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

export DOTS="$HOME/repos/dotfiles"
rm "$HOME/.zshrc"
rm "$HOME/.config/kinto/kinto.py"
ln -s "$DOTS/.zshrc" "$HOME/.zshrc"
ln -s "$DOTS/kinto.py" "$HOME/.config/kinto"

# tilix create shortcut with "tilix --quake" command
dconf load /com/gexperts/Tilix/ < ./tilix.dconf
gsettings set com.gexperts.Tilix.Settings quake-height-percent 100

# shell extensions: blur-my-shell, Appindicator and KS..., color picker, Extension List, Lock Keys, system-monitor-next 
# from gui
# rbenv visual-studio-code-bin junction boxes zeal flat-remix flat-remix-gnome flat-remix-gtk tela-circle-icon-theme-git beekeeper-studio