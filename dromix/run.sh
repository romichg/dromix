#!/bin/bash

# Get the args
for i in "$@"
do
case $i in
    --user=*)
    user="${i#*=}"
    shift # past argument=value
    ;;
    --uid=*)
    uid="${i#*=}"
    shift # past argument=value
    ;;
    --dpi=*)
    dpi="${i#*=}"
    shift # past argument=value
    ;;
    --geometry=*)
    geom="${i#*=}"
    shift # past argument=value
    ;;
    --socket=*)
    socket="${i#*=}"
    shift # past argument=value
    ;;
    --app=*)
    app="${i#*=}"
    shift # past argument=value
    ;;
    --vnc=*)
    vnc="${i#*=}"
    shift # past argument=value
    ;;
    *)
            # unknown option
    ;;
esac
done

[ -z "$user" ] && exit 1
[ -z "$uid" ] && exit 1
[ -z "$app" ] && exit 1
[ -z "$vnc" ] && exit 1


id -u $user > /dev/null

if [ $? -ne 0 ]
then
   useradd -m $user
   usermod --shell /bin/bash $user
   usermod --uid $uid $user
   groupmod --gid $uid $user
fi

if [ "$vnc" != "y" ]
then
   echo "Starting in X mode"
   sudo -u $user $app
else
   echo "Staritng in VNC mode"
   [ -z "$dpi" ] && exit 1
   [ -z "$geom" ] && exit 1
   [ -z "$socket" ] && exit 1

   res="$geom"x24

   export DISPLAY=:0
   sudo -u $user Xvfb -dpi $dpi -screen 0 $res &
   sudo -u $user matchbox-window-manager -use_titlebar no &
   sudo -u $user $app &
   sudo -u $user /usr/local/bin/x11vnc -unixsockonly $socket
fi
