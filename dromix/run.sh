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
    --defconfig=*)
    defconfig="${i#*=}"
    shift # past argument=value
    ;;
    --pulse=*)
    pulse="${i#*=}"
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
[ -z "$defconfig" ] && exit 1


id -u $user > /dev/null 2>&1

if [ $? -ne 0 ]
then
   useradd -m $user > /dev/null 2>&1
   usermod --shell /bin/bash $user > /dev/null 2>&1
   usermod --uid $uid $user > /dev/null 2>&1
   usermod -G audio,video -a $user > /dev/null 2>&1
   groupmod --gid $uid $user > /dev/null 2>&1
   if [ -d /root/config ] && [ $defconfig != "N" ]
   then
      cp -R /root/config/. /home/$user/
      chown -R $user.$user /home/$user
   fi
   chown -R $user.$user /home/$user
fi

if [ "$vnc" != "y" ]
then
   echo "Starting in X mode"
   sudo -u $user PULSE_SERVER=$pulse $app
else
   echo "Staritng in VNC mode"
   [ -z "$dpi" ] && exit 1
   [ -z "$geom" ] && exit 1
   [ -z "$socket" ] && exit 1

   res="$geom"x24

   Xvfb -dpi $dpi -screen 0 $res &
   sleep 2
   sudo -u $user DISPLAY=:0 PULSE_SERVER=$pulse matchbox-window-manager -use_titlebar no &
   sudo -u $user DISPLAY=:0 PULSE_SERVER=$pulse $app & 
   sudo -u $user DISPLAY=:0 PULSE_SERVER=$pulse /usr/local/bin/x11vnc -nopw -noxdamage -ncache_cr -unixsockonly $socket

   #removing the X lock in case container runs again 
   rm -f /tmp/.X0-lock
fi
