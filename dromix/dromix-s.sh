#!/bin/bash
#DPI=160
GEOM=$2

RAND=`tr -cd '[:alnum:]' < /dev/urandom | head -c8`
SOCKETDIR=/tmp/$RAND
SOCKET="$SOCKETDIR"/x11vnc.sock

if [ ! -d "$SOCKETDIR" ]
then
   mkdir $SOCKETDIR
fi

if [ -z "$DPI" ] 
then
   DPI=`xdpyinfo | grep  resolution | cut -d' ' -f 7 | cut -d'x' -f 1`
fi

if [ -z "$GEOM" ] 
then
   GEOM=1920x1200
fi


docker run --rm \
        --volume=$SOCKETDIR:$SOCKETDIR \
    romich-g/dromix-$1 \
    /root/run.sh --vnc=y --user=$USER --uid=$UID --dpi=$DPI --geometry=$GEOM --socket=$SOCKET --app=$1 &

while [ ! -S "$SOCKET" ]
do
   echo "Waiting for server..."
   sleep 1
done

ssvnc -viewer "$SOCKET"
rm "$SOCKET"
rmdir "$SOCKETDIR"
