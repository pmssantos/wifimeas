  #!/usr/bin/env python3
 
import socket
from subprocess import Popen, PIPE
import time
import threading


if __name__ == "__main__":

	x = threading.Thread(target=iperf_faraway)
	x.start()

	f1= open("iperf_ee.log","w+")
	process1 = Popen(["iperf3", "-c", "bouygues.iperf.fr", "-i", "1", "-p", "5203"], stdout=PIPE)
	for row in iter(process1.stdout.readline, b''):
		print(row.rstrip())
		f1.write(row.rstrip())
	f1.close() 
	

