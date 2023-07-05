#!/bin/bash
#DPI=160
GEOM=$2
P_SOCKETDIR="/var/run/rat_terminal.sock"
TEMRTRASH="/media/n9/SHARED/temptrash"
SCREENSHOTS="/media/n9/SHARED/screenshots"

if [ -f $P_SOCKETDIR ]
then
   SOCKETDIR=`cat "$P_SOCKETDIR"`
else
   RAND=`tr -cd '[:alnum:]' < /dev/urandom | head -c8`
   SOCKETDIR=/tmp/$RAND
fi

SOCKET="$SOCKETDIR"/x11vnc.sock


if [ ! -d "$SOCKETDIR" ]
then
   mkdir $SOCKETDIR
fi


if [ ! -f ./$P_SOCKETDIR ]
then 

   echo $SOCKETDIR > ./$P_SOCKETDIR
   if [ -z "$DPI" ] 
   then
      DPI=`xdpyinfo | grep  resolution | cut -d' ' -f 7 | cut -d'x' -f 1`
   fi

   if [ -z "$GEOM" ] 
   then
      GEOM=2550x1380
   fi


   docker run --name rat_terminal  \
           --volume=$SOCKETDIR:$SOCKETDIR \
           --volume=$SCREENSHOTS:$SCREENSHOTS \
           --volume=$TEMPTRASH:$TEMPTRASH \
           romich-g/dromix-rat_terminal \
           root/run.sh --vnc=y --user=$USER --uid=$UID --dpi=$DPI --geometry=$GEOM --socket=$SOCKET --app=rat_terminal i&

else

   docker start -a rat_terminal  &

fi

while [ ! -S "$SOCKET" ]
do
   echo "Waiting for server..."
   sleep 1
done

ssvnc -viewer "$SOCKET"
rm "$SOCKET"
rmdir "$SOCKETDIR"
