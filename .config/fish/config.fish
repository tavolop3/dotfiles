if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

# PATH adicional
set -gx PATH $PATH $HOME/scripts

set -gx WINAPPS_SRC_DIR "/usr/local/bin/winapps-src"

# Aliases
alias v='nvim'
alias vconf='nvim ~/.config/nvim/lua/plugins/init.lua'
alias iconf='nvim ~/.config/i3/config'
alias zconf='nvim ~/.config/fish/config.fish'
alias tconf='nvim ~/.tmux.conf'
alias hconf='nvim ~/.config/hypr/hyprland.conf'
alias ls='ls --hyperlink=auto --color=auto'

# Git aliases
alias ga='git add'
alias gcm='git commit -m'
alias gst='git status'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'

function fish_prompt
    set_color cyan
    echo -n (pwd | sed "s|$HOME|~|")
    echo -n ' '
    set_color normal
end

# Right prompt: mostrar hora
function fish_right_prompt
    date "+%H:%M"
end

# Batman en reemplazo de man para highlightear
batman --export-env | source

# Add this to the end of your config file
# reemplaza el cd con zoxide
zoxide init fish --cmd cd | source
