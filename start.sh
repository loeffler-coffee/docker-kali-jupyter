#!/bin/bash
count=`ls -1 *.ovpn 2>/dev/null | wc -l`
service ssh restart
tigervncserver -localhost no -xdisplaydefaults -SecurityTypes None --I-KNOW-THIS-IS-INSECURE
/root/noVNC/utils/launch.sh --vnc localhost:5901 &

if [ $count != 0 ]
then 

for FILE in /*.ovpn; 
do 
    echo ${FILE}
    openvpn --config ${FILE} &
    break; 
done
fi 
cd home/

jupyter-notebook --ip=0.0.0.0 --allow-root &
/bin/bash

