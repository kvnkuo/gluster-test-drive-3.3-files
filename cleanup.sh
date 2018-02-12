#!/bin/bash

echo y | sudo gluster volume stop repvol force
echo y | sudo gluster volume stop distvol force

echo y | sudo gluster volume delete repvol 
echo y | sudo gluster volume delete distvol 

sudo gluster peer detach rhgs4
sudo gluster peer detach rhgs5
sudo gluster peer detach rhgs6

# prerequisite: pw for root on rhgs4 has to be Redhat18
sudo ssh-keygen -t rsa -f /root/.ssh/id.rsa -q -P ""
sudo sshpass -p Redhat18 ssh-copy-id root@rhgs4

