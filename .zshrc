# Created by newuser for 5.3.1

# Auto-install zplug $HOME/.zplug
if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "lib/completion", from:oh-my-zsh

zplug "zsh-users/zsh-history-substring-search"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load


alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
alias tmux="tmux -f ${XDG_CONFIG_DIR:-${HOME}}/tmux.conf"
