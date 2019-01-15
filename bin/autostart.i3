#!/bin/sh

sleep 1
pulseaudio -D &
sleep 1
pactl set-sink-volume 0 '50%' &
sleep 1
i3-msg 'workspace 1:www; exec firefox'
sleep 1
i3-msg 'exec thunderbird'
sleep 1
i3-msg 'exec nemo'
sleep 1
i3-msg 'exec skypeforlinux'
sleep 1
i3-msg 'exec telegram-desktop -startintray'
sleep 1
i3-msg 'workspace 2:mail'
i3-msg 'workspace 1:www'

sleep 1
clipit &
