#!/usr/bin/env python3

import socket
from subprocess import Popen, PIPE
import threading
import time

HOST='192.168.60.174'
PORT=65432

#def thread_function(name):
#    logging.info("Thread %s: starting", name)
#    time.sleep(2)
#    logging.info("Thread %s: finishing", name)


if __name__ == "__main__":
	PORT = 65432        # The port used by the server

	# s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	# s.connect((HOST, PORT))

	process = Popen(["tcpdump", "-i", "wlan", "-l"], stdout=PIPE)

	for row in iter(process.stdout.readline, b''):
		print(row.rstrip())
		#s.sendall(row.rstrip())

	print('Bye, now and forever!')

