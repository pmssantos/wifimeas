#!/bin/sh
#sudo ip link set wlp4s0 up
#sudo ip addr flush wlp4s0
#sudo iw dev wlp4s0 ocb leave
#sudo iw reg set PT
#sudo ip link set wlp4s0 down
#sudo iw dev wlp4s0 set type managed
#sudo ip link set wlp4s0 up
#sudo iw dev wlp4s0 set txpower fixed 3dBm
#sudo iw phy phy0 set txpower fixed 3dBm
#sudo iwconfig wlp4s0 txpower 3dBm
#sudo ip link set wlp4s0 down
#sudo iw dev wlp4s0 set type ocb
#sudo iw dev wlp4s0 set txpower fixed 3dBm
#sudo iw phy phy0 set txpower fixed 3dBm
#sudo iwconfig wlp4s0 txpower 3dBm
#sudo ip link set wlp4s0 up
#sudo iw dev wlp4s0 set txpower fixed 3dBm
#sudo iw phy phy0 set txpower fixed 3dBm
#sudo iw dev wlp4s0 ocb join 5900 10MHZ
##sudo iw dev wlp4s0 set bitrates legacy-5 6
#sudo iwconfig wlp4s0 txpower 3dBm
sudo ip link set wlp4s0 up
sudo ip addr flush wlp4s0
sudo iw dev wlp4s0 ocb leave
sudo iw reg set PT
sudo ip link set wlp4s0 down
sudo iw phy phy0 set antenna 1 1
sudo iw dev wlp4s0 set type ocb
sudo ip link set wlp4s0 up
sudo iw dev wlp4s0 set bitrates legacy-5 12 sgi-5
sudo iw dev wlp4s0 ocb join 5860 10MHZ
sudo iw dev wlp4s0 set txpower fixed 1000
sudo iw dev wlp4s0 set txpower fixed 1100
sudo iw dev wlp4s0 set txpower fixed 2700
sudo iw dev wlp4s0 set txpower fixed 0dBm
sudo iw phy phy0 interface add mon0 type monitor
sudo ip link set mon0 up
