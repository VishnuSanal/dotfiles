#
# ~/.bashrc
#

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/flutter/bin:$PATH"
export PATH="/opt/flutter/bin/:$PATH"

export ANDROID_HOME=$HOME/Android/Sdk
export CHROME_EXECUTABLE=brave

export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

export GEM_HOME=$HOME/.local/share/gem/ruby/3.4.0/
export PATH="$GEM_HOME/bin:$PATH"

export GPG_TTY=$(tty)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# \033[1;36m󰊠 \033[1;32m󰊠

# PS1='\033[1;34m󰊠 \033[1;31m󰊠\033[0m \W \033[1;33m󰮯\033[0m'
# PS1='\W \033[1;31m󰊠 \033[1;33m󰮯 \033[0m'
# PS1='\W \033[1;31m󰮯 \033[0m'

PS1='\W $ '
# PS1='$ '

# echo -e "\033[1;33m󰮯  \033[1;32m󰊠  \033[1;34m󰊠  \033[1;31m󰊠  \033[1;36m󰊠\n"
echo -e "You're Awesome :)\n"

alias c='clear'
alias clear='clear && echo -e "You'\''re Awesome :)\n"'

alias shut='shutdown now'
alias sx='startx'
alias vol='pamixer --get-volume'

alias bsconf='vim ~/.config/bspwm/bspwmrc'
alias sxconf='vim ~/.config/sxhkd/sxhkdrc'
alias bconf='vim ~/.bashrc'

alias cred='echo $(cat ~/Miscellaneous/key) | xclip -selection primary'

alias gl='git log'
alias glo='git log --oneline'
alias gd='git diff'
alias gds='git diff --staged'
alias g='git status'
alias gs='git status'
alias gss='git status --short'
alias ga='git add --all'
alias gc='git commit -m' $@
alias gcs='git commit -s -m' $@
alias gb='git branch'
alias gp='cred && git push'
alias gr='git restore'
alias grs='git restore --staged'
alias grh1='git reset HEAD~1'
alias gpr='git pull --rebase'

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

alias pysrc='source .venv/bin/activate'
alias pysrc13='source .venv13/bin/activate'

alias erbt='export RUST_BACKTRACE=1'

# alias hs='history | grep $@'

hs() {
	# history -s $(history | cut -c 8- | grep "$@" | fzf)
	history -s $(history | cut -c 8- | grep "$@" | fzf)
}

MOBILE_IP="192.168.1.3"

adbc() {
   adb connect "$MOBILE_IP:$1"
}

adbp() {
   adb pair "$MOBILE_IP:$1"
}

adbdc() {
   adb disconnect "$MOBILE_IP:$1"
}

alias battery='cat /sys/class/power_supply/BAT0/capacity'

# alias adb='/home/vishnu/Android/Sdk/platform-tools/adb'
# alias emulator='~/Android/Sdk/emulator/emulator'

alias apksigner='~/Android/Sdk/build-tools/34.0.0/apksigner'
alias zipalign='~/Android/Sdk/build-tools/34.0.0/zipalign'

alias wificlg='wific GEC_TCR_1'
alias wifihome='wific Dwaraka'
alias wifir="wific $(nmcli | grep 'connected to' | cut -d ' ' -f 4)"

alias hsd="hugo server -D"

alias redstop='redshift -x'
alias redstart='redstop && redshift -O 3500'
alias red='redstart'

# . "$HOME/.cargo/env"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/vishnu/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.bash ] && . /home/vishnu/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.bash
