#!/bin/sh
sudo ip link set wlp4s0 up
sudo ip addr flush wlp4s0
sudo iw dev wlp4s0 ocb leave
sudo iw reg set PT
sudo ip link set wlp4s0 down
sudo iw phy phy0 set antenna 3 3
sudo iw dev wlp4s0 set type ocb
sudo ip link set wlp4s0 up
sudo iw dev wlp4s0 set bitrates legacy-5 12 sgi-5
sudo iw dev wlp4s0 ocb join 5860 10MHZ
sudo iw dev wlp4s0 set txpower fixed 1000
sudo iw dev wlp4s0 set txpower fixed 1100
sudo iw dev wlp4s0 set txpower fixed 2700
