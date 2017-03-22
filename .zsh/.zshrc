# Created by newuser for 5.3.1

# Auto-install zplug $HOME/.zplug
if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

# Also prezto
zplug "sorin-ionescu/prezto", as:plugin, use:init.zsh, hook-build:"ln -s $ZPLUG_ROOT/repos/sorin-ionescu/prezto ${ZDOTDIR:-$HOME}/.zprezto"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load


alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
alias tmux="tmux -f ${XDG_CONFIG_DIR:-${HOME}}/tmux.conf"
alias vim='nvim'
alias m='make'
alias c='make clean'
alias rb='make clean;make'
