# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init - zsh)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

source ~/repos/dotfiles/fzf_setup.zsh

plugins=(git cp bundler node npm brew ruby rails rbenv rake rake-fast redis-cli python pip fzf fzf-tab docker docker-compose docker-machine ansible sublime-merge sublime vscode xcode dotenv zsh-autosuggestions zsh-syntax-highlighting)

source ~/repos/dotfiles/styles.zsh
source $ZSH/oh-my-zsh.sh
export DOTS="$HOME/repos/dotfiles"
#autoload -U compinit && compinit

#source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/repos/dotfiles/aliases.zsh