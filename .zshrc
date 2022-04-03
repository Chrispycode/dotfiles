# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(rbenv init - --no-rehash)"

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="neovim -f"

# iterm
source ~/.iterm2_shell_integration.zsh

#PROMPT_COMMAND=set_sync_name

# precmd() { set_sync_name }

# set_sync_name() {
#   if [[ $PWD == *aproject* ]];
#     then export SYNC_NAME=aproject;
#   elif [[ $PWD == *bproject* ]];
#     then export SYNC_NAME=bproject;
#   else
#     export SYNC_NAME=project;
#   fi
# }

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# ENABLE_CORRECTION="true"
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--border
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(rails git iterm2 cp bundler node npm brew ruby rake rake-fast redis-cli python pip macos fzf fzf-tab docker docker-compose docker-machine ansible sublime-merge sublime vscode xcode dotenv zsh-autosuggestions zsh-syntax-highlighting)

zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}' '+m:{_-}={-_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
# disable sort when completing options of any command
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# give a preview of directory by tree when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'tree -C -L 2 $realpath'
# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH iterm word jump
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

alias cat='bat'
alias ls='ls -1'
alias rubm='open -a RubyMine'
alias vcode='open -a Visual\ Studio\ Code.app'
alias zshrc='subl -n ~/.zshrc ~/.zshenv ~/.p10k.zsh'
alias rspec="bundle exec rspec"
alias drop_the_base='rake db:drop db:create db:dump:import db:migrate db:test:prepare'
alias vpn-connect='osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "connect \"Work\"" -e "end tell"'
alias vpn-disconnect='osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "disconnect \"Work\"" -e "end tell"'
alias bys='bundle && yarn && hivemind'
alias reset_rabbit='sudo rabbitmqctl stop_app && rabbitmqctl reset && rabbitmqctl start_app'
travel() {subl $1 && subm $1}
work() {rubm $1 && subm $1}
alias dc='docker-compose'
alias dcweb='docker-compose exec web'
alias dcup='docker-compose up -d'
alias dcupweb='docker-compose up -d web'
alias dcupf='docker-compose up -d --force-recreate --remove-orphans'
alias dcupfweb='docker-compose up -d --force-recreate --remove-orphans web'
alias dcrspec='docker-compose exec web rspec'
alias dcpry='docker-compose exec web pry-remote'
alias dcc='docker-compose exec web rails c'
alias dcb='docker-compose build app'
alias dcbc='docker-compose build --no-cache app'
alias dcl='docker-compose logs -f --tail=2000'
alias dcapp='docker-compose run -rm app'
alias dcimport='docker-compose run --rm import_db'
alias dcseed='docker-compose run --rm seed_db'
alias ds='docker stats'
alias dss="docker-sync restart --app-name=${SYNC_NAME}"
