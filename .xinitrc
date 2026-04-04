xsetroot -cursor_name left_ptr &
# xmodmap -e 'keycode 9=NoSymbol'
exec bspwm

# disable_internal_keyboard_if_external_connected

# ./eye_care_reminder & 

eval $(gnome-keyring-daemon --start --components=secrets,ssh,gpg)
export SSH_AUTH_SOCK

