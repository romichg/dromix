#!/bin/bash
RAND=`tr -cd '[:alnum:]' < /dev/urandom | head -c8`
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth.$RAND
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --rm   \
        --volume=$XSOCK:$XSOCK:rw \
        --volume=$XAUTH:$XAUTH:rw \
        --env="XAUTHORITY=${XAUTH}" \
        --env="DISPLAY" \
    romich-g/dromix-$1 \
    /root/run.sh --vnc=f --user=$USER --uid=$UID --app="$*"

rm $XAUTH
