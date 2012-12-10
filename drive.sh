#!/bin/bash

LABEL="Data"
MOUNTPOINT="/data"
mkdir -p $MOUNTPOINT

FSTAB=/etc/fstab
MOUNT1="LABEL="$LABEL"	"$MOUNTPOINT"	ntfs-3g	defaults,locale=en_US.utf8 0 0"

cp /etc/fstab /etc/fstab.old

echo $MOUNT1 >> $FSTAB
mount -a

DIRECTORIES="Desktop
Documents
Downloads
Music
Pictures
Public
Templates
Videos
Virtual\ Box \VMs"

cd $HOME
for directory in $DIRECTORIES
do
 (rm $directory || rmdir $directory) 
 echo $MOUNTPOINT/$directory && ln -s $MOUNTPOINT/$directory
done
