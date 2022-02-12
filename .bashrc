#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -a --color=auto'

PS1='\W $ '

echo -e "You're Awesome :)\n"
#neofetch

alias c='clear'
alias clear='clear && echo -e "You'\''re Awesome :)\n"'

alias shut='shutdown now'

alias bsconf='cd ~/.config/bspwm && cp bspwmrc backup && vim bspwmrc'
alias sxconf='cd ~/.config/sxhkd && cp sxhkdrc backup && vim sxhkdrc'
alias polyconf='cd ~/.config/polybar && cp config backup && vim config'
alias terconf='cd ~/.config/terminator && cp config backup && vim config'

# cd + ls
cd() {
   builtin cd $@
   ls
}
