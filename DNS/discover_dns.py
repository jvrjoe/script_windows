"""
Script para verificar o servidor DNS das estações com Windows7 a partir de um arquivo com o nome dos hosts.
"""

import getpass; import os; from pypsexec.client import Client

username = input('Usuário: ')
password = getpass.getpass('Senha: ')

fileHosts = r'D:\py\scripts_windows\DNS\hosts.txt'

with open(fileHosts) as file:
    for host in file:
        if os.system("ping -n 1 " + host) == 0:
            c = Client(host.replace('\n', ''), username=username, password=password, encrypt=False)  # encrypt=False only for Windows 7
            executable = "cmd"
            argument = "/c ipconfig /all | findstr Servidores"

            c.connect()
            try:
                c.create_service()
                stdout, stderr, rc = c.run_executable(executable=executable, arguments=argument)
            finally:
                c.remove_service()
                c.disconnect()

            print(stdout.decode('latin'))
        else:
            print(f'{host} DESLIGADA')
