from ipaddress import IPv4Address
from ping3 import ping

inicial = IPv4Address(input("Digite o IP inicial: "))
final = IPv4Address(input("Digite o IP final: "))

ips = [str(IPv4Address(ip)) for ip in range(int(inicial), int(final))]

try:
    for ip in ips:
        t = ping(ip, timeout=5)
        status = 'OFFLINE' if t is None else 'ONLINE'
        print(f'IP: {ip} [{status}]')
except PermissionError:
    print('Usuario nao possui privilegios de Administrador!')