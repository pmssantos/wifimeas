#!/usr/bin/env python3
 
import socket
from subprocess import Popen, PIPE
import threading
import time

HOST='192.168.60.174'
PORT=65432

a="13:04:29.242993 1.0 Mb/s 2412 MHz 11b -63dBm signal antenna 1 Beacon (CisterGuest) [1.0* 2.0* 5.5* 6.0 9.0 11.0* 12.0 18.0 Mbit] ESS CH: 1, PRIVACY"
b="13:04:29.261039 12.0 Mb/s 2412 MHz 11g -62dBm signal antenna 1 BA RA:28:c2:dd:ef:41:fd (oui Unknown)"

a2 = a.split()
b2 = b.split()

print(a2)
print(b2)





