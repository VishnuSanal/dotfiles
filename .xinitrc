export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=bspwm
export DESKTOP_SESSION=bspwm

systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP

xsetroot -cursor_name left_ptr &
# xmodmap -e 'keycode 9=NoSymbol'
exec bspwm

# disable_internal_keyboard_if_external_connected

# ./eye_care_reminder & 

eval $(gnome-keyring-daemon --start --components=secrets,ssh,gpg)
export SSH_AUTH_SOCK
