  #!/usr/bin/env python3
 
import socket
from subprocess import Popen, PIPE
import threading
import time

#HOST='192.168.60.174'
#PORT=65432

process1 = Popen(["iperf", "-c", "iperf.eenet.ee"], stdout=PIPE)


process2 = Popen(["iperf", "-c", "192.168.60.174"], stdout=PIPE)
