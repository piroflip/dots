#!/bin/env sh

export TZ=:/etc/localtime

export EDITOR="nvim"
export VISUAL="nvim"

export LOCAL_BIN="${HOME}/.local/bin"

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_RUNTIME_DIR="${HOME}/.local/run"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"

export LESS_TERMCAP_usz=$'\C-[[0m'

# Update PATH
path_prepend() {
  case ":$PATH:" in
    *":$1:"*) return ;; # already added
    *) PATH="$1:$PATH";;
  esac
}

[ -d "$LOCAL_BIN" ] && {
  for dir in "$LOCAL_BIN"/* "$LOCAL_BIN"; do
    [ -d "$dir" ] && path_prepend "$dir"
  done
}

unset dir
unset -f path_prepend


export MP_FULLNAME="Alexander Kotov"
