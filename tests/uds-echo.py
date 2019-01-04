#!/usr/bin/python
import socket,os
sp = '/tmp/echo-test'
s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
try:
    os.remove(sp)
except OSError:
    pass
s.bind(sp)
s.listen(1)
conn, addr = s.accept()
while 1:
    data = conn.recv(1024)
    if not data: break
    print(data)
    conn.send(data)
conn.close()
