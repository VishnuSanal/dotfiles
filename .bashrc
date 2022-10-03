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

alias bsdir='cd ~/.config/bspwm/'
alias sxdir='cd ~/.config/sxhkd/'

alias hidebar='cp ~/.config/bspwm/hide ~/.config/bspwm/bspwmrc && killall -q polybar && bspc quit'
alias showbar='cp ~/.config/bspwm/show ~/.config/bspwm/bspwmrc && bspc wm -r'

alias cred='echo $(cat ~/Miscellaneous/key) | xclip -selection primary'

alias gl='git log'
alias gd='git diff'
alias gds='git diff --staged'
alias gs='git status'
alias ga='git add --all'
alias gc='git commit -m' $@
alias gp='cred && git push'

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
