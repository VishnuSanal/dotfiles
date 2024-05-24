#!/bin/sh

while true; do

    if pgrep -x "mpd" > /dev/null 
    then
        mpc idle player
    else
        echo "Waiting for MPD to start..."
        sleep 5        
        continue
    fi

    if [ $(mpc status %state%) == "playing" ]; then

        FILE="/home/vishnu/Music/$(mpc current -f %file%)"

        echo "Current: $FILE"

        ffmpeg -i "$FILE" "/tmp/mpdAlbumArt.jpg" -y  &> /dev/null

    fi

done

# /etc/systemd/system/mpd-album-art-fetch-service.service

# [Unit]
# Description=Fetches album art from the currently playing mpd file into /tmp/mpdAlbumArt.jpg

# [Service]
# User=vishnu
# WorkingDirectory=/tmp/
# ExecStart=/home/vishnu/bin/mpd-album-art.sh
# Restart=always

# [Install]
# WantedBy=default.target

# sudo systemctl daemon-reload
#   && sudo systemctl start mpd-album-art-fetch-service.service
#   && sudo systemctl enable mpd-album-art-fetch-service.service
