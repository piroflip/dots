#!/bin/env sh

export EDITOR="nvim"
export VISUAL="nvim"

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_RUNTIME_DIR="${HOME}/.local/run"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"

PANEL_FIFO=${HOME}/.config/bspwm/panel-fifo
PANEL_HEIGHT=12
PANEL_FONT='-*-xos4-terminesspowerline-medium-*-normal-*-12-*-*-*-*-*-iso10646-*'
PANEL_WM_NAME=bspwm_panel
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME
