#!/usr/bin/env zsh

sudo pacman -Sy brave-browser tilix btop copyq appimagelauncher gcc python-pip docker docker-compose
sudo systemctl start docker.service && sudo systemctl enable docker.service
sudo systemctl start containerd.service && sudo systemctl enable containerd.service
sudo pip3 install xkeysnail 
/bin/bash -c "$(wget -qO- https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh || curl -fsSL https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh)"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

export DOTS="$HOME/repos/dotfiles"
rm "$HOME/.zshrc"
rm "$HOME/.config/kinto/kinto.py"
ln -s "$DOTS/.p10k.zsh" "$HOME/.p10k.zsh"
ln -s "$DOTS/.zshrc" "$HOME/.zshrc"
ln -s "$DOTS/kinto.py" "$HOME/.config/kinto"
ln -s "$DOTS/docker-compose.yml" "$HOME/docker-compose.yml"

# tilix create shortcut with "tilix --quake" command
dconf load /com/gexperts/Tilix/ < ./tilix.dconf
gsettings set com.gexperts.Tilix.Settings quake-height-percent 100

# shell extensions: blur-my-shell, Appindicator and KS..., color picker, Extension List, Lock Keys, system-monitor-next 
# from gui
# rbenv visual-studio-code-bin junction boxes zeal flat-remix flat-remix-gnome flat-remix-gtk tela-circle-icon-theme-git beekeeper-studio

sudo groupadd docker 
sudo usermod -aG docker $USER 
newgrp docker