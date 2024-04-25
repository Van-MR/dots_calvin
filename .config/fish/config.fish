set fish_greeting ""
set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always


# set Fish Env
eval "$(fnm env --use-on-cd)"

# starting screen
neofetch | lolcat


# ranger 
alias rg ranger

# Tmux
alias t tmux
alias tl "tmux list-sessions"
alias tk "tmux kill-server"
alias ta "tmux attach-session -t"
alias ide="tmux split-window -v -p 30 &&  tmux split-window -h -p 50"
# aliases
alias ls "exa -al --color=always --group-directories-first"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"

# Git
alias g git
alias gs "git status"
alias gl "git log"
alias gc "git commit -m"
alias ga "git add ."
alias grl "git reflog"
alias gd "git diff"
alias gf "git fetch"
alias grv "git remote -v"
alias grb "git rebase"
alias gba "gir branch -a"
alias gbl "git branch -L"
alias gpl "git pull"
alias gco "git checkout -b"
alias gm "git merge"

#LazyGit
alias lg lazygit

# yay
alias y "yay -S" # install a package
alias yse "yay -Ss" # list the matched packages and allow you select packages to install
alias ysi "yay -Si" # print package information
alias yr "yay -R" # remove a package
alias ysc "yay -Sc" # Clean package cache
alias ysu "yay -Syu" # used to update your Arch Linux system , it also equivalent to the "pacman -Syu" comment

alias cl clear
alias v nvim
alias vi nvim
alias vim nvim
alias so source

alias eN "nvim ~/.config/nvim/lua/config/lazy.lua"
alias eF "nvim ~/.config/fish/config.fish"
alias eT "nvim ~/.tmux.conf"

# Dirs
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."

command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# widnow transparent
if [ -n "$WINDOWID" ]
    set TRANSPARENCY_HEX 0xcccccccc
    xprop -id "$WINDOWID" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$TRANSPARENCY_HEX"
end

zoxide init fish | source
