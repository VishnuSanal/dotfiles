#
# ~/.bashrc
#

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# \033[1;36m󰊠 \033[1;32m󰊠

# PS1='\033[1;34m󰊠 \033[1;31m󰊠\033[0m \W \033[1;33m󰮯\033[0m'
# PS1='\W \033[1;31m󰊠 \033[1;33m󰮯 \033[0m'
# PS1='\W \033[1;31m󰮯 \033[0m'

PS1='\W $ '

# echo -e "\033[1;33m󰮯  \033[1;32m󰊠  \033[1;34m󰊠  \033[1;31m󰊠  \033[1;36m󰊠\n"
echo -e "You're Awesome :)\n"

alias c='clear'
alias clear='clear && echo -e "You'\''re Awesome :)\n"'

alias shut='shutdown now'
alias sx='startx'
alias vol='pamixer --get-volume'

alias bsconf='vim ~/.config/bspwm/bspwmrc'
alias sxconf='vim ~/.config/sxhkd/sxhkdrc'

alias cred='echo $(cat ~/Miscellaneous/key) | xclip -selection primary'

alias gl='git log'
alias gd='git diff'
alias gds='git diff --staged'
alias gs='git status'
alias ga='git add --all'
alias gc='git commit -m' $@
alias gp='cred && git push'
alias gr='git restore'
alias grs='git restore --staged'
alias gpr='git pull --rebase'

# cd + ls
cd() {
   builtin cd $@
   ls
}

alias update='backlight -i && sudo pacman -Syu && yay -a -Syu'

alias wifil='nmcli device wifi list'
alias wific='nmcli device wifi connect $@'
alias wifica='nmcli --ask device wifi connect $@'

alias pingdns='ping -c 4 1.1.1.1'
alias pingext='ping -c 4 archlinux.org'

alias hs='history | grep $@'

alias adb='/home/vishnu/Android/Sdk/platform-tools/adb'

alias battery='cat /sys/class/power_supply/BAT0/capacity'

. "$HOME/.cargo/env"
