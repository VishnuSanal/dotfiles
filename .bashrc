#
# ~/.bashrc
#

export PATH="$HOME/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls -a --color=auto'

PS1='\W $ '

echo -e "You're Awesome :)\n"
# neofetch

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


# cd + ls
cd() {
   builtin cd $@
   ls
}

alias update='sudo pacman -Syu && yay -a -Syu'

alias wifil='nmcli device wifi list'
alias wific='nmcli device wifi connect $@'
alias wifica='nmcli --ask device wifi connect $@'

alias pingdns='ping -c 4 1.1.1.1'
alias pingext='ping -c 4 archlinux.org'

alias hs='history | grep $@'

alias adb='/home/vishnu/Android/Sdk/platform-tools/adb'

alias battery='cat /sys/class/power_supply/BAT0/capacity'

. "$HOME/.cargo/env"
