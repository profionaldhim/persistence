#!/bin/bash
echo ""
echo "start configurition >>"
echo "" 
end=7gb
read start _ < <(du -bcm kali-linux-2019.4-amd64.iso | tail  -1);echo $start
parted /dev/sdb mkpart primary $start $end
mkfs.ext3 -L persistence /dev/sdb3
e2label /dev/sdb3 persistence
mkdir -p /mnt/my_usb
mount /dev/sdb3 /mnt/my_usb
echo "/ union" >  /mnt/my_usb/persistence.conf
umount /dev/sdb3

echo " finish configurition>> "



