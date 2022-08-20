#!/usr/bin/python

# THIS FILE IS MANAGED BY PUPPET - DO NOT MANUALLY EDIT

import sys
import socket
import time

if len(sys.argv) < 3:
    print("Syntax Error: " + sys.argv[0] + " [hostname:port] [timeout]")
    sys.exit(1)


target = sys.argv[1].split(":")
host = target[0]
port = int(target[1])
timeout = int(sys.argv[2])

#host = sys.argv[1]
#port = int(sys.argv[2])
# type => ["tcp" or "udp"]
#type = sys.argv[3].lower()
type = 'tcp'


while 1 :
  if type == "udp":
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  else:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  s.settimeout(timeout)
  try:
    if type == "udp":
      s.sendto("--TEST LINE--", (host, port))
      recv, svr = s.recvfrom(255)
      s.shutdown(2)
      print("Success connecting to " + host + " on UDP port: " + str(port))
      sys.exit(0)
    else:
      s.connect((host, port))
      s.shutdown(2)
      #print("Success connecting to " + host + " on TCP port: " + str(port))
      print("{host}".format(host=host))
      sys.exit(0)
  except Exception, e:
    try:
      errno, errtxt = e
    except ValueError:
      #print("Cannot connect to " + host + " on port: " + str(port))
      sys.exit(1)
    else:
      if errno == 107:
        #print("Success connecting to " + host + " on UDP port: " + str(port))
        sys.exit(0)
      else:
        #print("Cannot connect to " + host + " on port: " + str(port))
        #print e
        sys.exit(1)

  s.close
  time.sleep(1)
