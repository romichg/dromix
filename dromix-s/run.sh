#!/bin/bash
user=$1
uid=$2
dpi=$3
geom=$4
socket=$5
app=$6

[ -z "$app" ] && exit 1
[ -z "$uid" ] && exit 1
[ -z "$dpi" ] && exit 1
[ -z "$geom" ] && exit 1
[ -z "$socket" ] && exit 1
[ -z "$app" ] && exit 1

res="$geom"x24

id -u $user > /dev/null

if [ $? -ne 0 ]
then
   useradd -m $user
   usermod --shell /bin/bash $user
   usermod --uid $uid $user
   groupmod --gid $uid $user
fi

export DISPLAY=:0
sudo -u $user Xvfb -dpi $dpi -screen 0 $res &
sudo -u $user matchbox-window-manager -use_titlebar no &
sudo -u $user $app &
sudo -u $user /usr/local/bin/x11vnc -unixsockonly $socket
