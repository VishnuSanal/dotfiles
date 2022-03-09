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

alias bsconf='cp ~/.config/bspwm/bspwmrc ~/.config/bspwm/backup && vim ~/.config/bspwm/bspwmrc'
alias sxconf='cp ~/.config/sxhkd/sxhkdrc ~/.config/sxhkd/backup && vim ~/.config/sxhkd/sxhkdrc'
alias polyconf='cp ~/.config/polybar/config ~/.config/polybar/backup && vim ~/.config/polybar/config'
alias terconf='cp ~/.config/terminator/config ~/.config/terminator/backup && vim ~/.config/terminator/config'
alias hidebar='cp ~/.config/bspwm/hide ~/.config/bspwm/bspwmrc && killall -q polybar && bspc quit'
alias showbar='cp ~/.config/bspwm/show ~/.config/bspwm/bspwmrc && bspc wm -r'

alias cred='echo $(cat ~/temp/temp) | xclip -selection primary'

alias gs='git status'
alias ga='git add --all'
alias gp='cred && git push'

# cd + ls
cd() {
   builtin cd $@
   ls
}
