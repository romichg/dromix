#!/bin/bash
. /usr/lib/dromix/dromix-include
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
        --volume=$PULSE_AUDIO:$PULSE_AUDIO_CONTAINER \
        --name=$DROMIX-$RAND \
        --hostname=$DROMIX-$RAND \
	--net=$NETWORK \
	${DEVICES} \
	${VOLUMES} \
	${EXTRA} \
    romich-g/dromix-$DROMIX \
    /root/run.sh --vnc=y --user=$USER --uid=$UID --defconfig=$defconfig --pulse=$PULSE_AUDIO_CONTAINER/native --dpi=$DPI --geometry=$GEOM --socket=$SOCKET --app="$*" &

while [ ! -S "$SOCKET" ]
do
   echo "Waiting for server..."
   sleep 1
done

ssvnc -viewer "$SOCKET"

rm "$SOCKET"
rmdir "$SOCKETDIR"
[ -n $INCOMING ] && rm -rf $INCOMING
[ -n $OUTGOING ] && rm -rf $OUTGOING
