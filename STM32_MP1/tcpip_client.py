import socket

Host = "192.168.1.64"
Port = 5001
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
Comm = b'M0\r\n'
Comm = b'Hello there'

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as S:
    s.connect((Host, Port))
    s.send(Comm)
    data = s.recv(1024)

print(type(Comm))
print('Received', repr(data))
print(str(data))
print(type(data))