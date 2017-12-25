#!/bin/bash
. /usr/lib/dromix/dromix-include
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth.$RAND
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -



docker run --rm   \
        --volume=$XSOCK:$XSOCK:rw \
        --volume=$XAUTH:$XAUTH:rw \
        --volume=$PULSE_AUDIO:$PULSE_AUDIO_CONTAINER:rw \
        --env="XAUTHORITY=${XAUTH}" \
        --env="DISPLAY" \
        --name=$DROMIX-$RAND \
        --hostname=$DROMIX-$RAND \
	  ${DEVICES} \
          ${VOLUMES} \
          ${EXTRA} \
    romich-g/dromix-$DROMIX \
    /root/run.sh --vnc=f --user=$USER --uid=$UID --pulse=$PULSE_AUDIO_CONTAINER --app="$*"

rm $XAUTH
[ -n $INCOMING ] && rm -rf $INCOMING
[ -n $OUTGOING ] && rm -rf $OUTGOING
