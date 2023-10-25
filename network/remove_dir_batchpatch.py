import getpass
import os
from pypsexec.client import Client

username = (os.environ['USERDOMAIN'] + '\\' + os.environ['USERNAME'])
password = getpass.getpass('Senha: ')

executable = "cmd"
argument = 'rmdir /s /q "c:\program files\batchpatch"'

fileHosts = input('\n Caminho do arquivo texto dos hosts: ')

with open(fileHosts) as file:
    for host in file:
        c = Client(host, username=username, password=password) #encrypt=False)
        c.connect()
        try:
            c.create_service()
            stdout, stderr, rc = c.run_executable(executable=executable, arguments=argument)
        finally:
            c.remove_service()
            c.disconnect()

"""import os

dirBatchPatch = 'c$\Program Files\BatchPatch'
servers = [
    'PROTEST-PC',
    'APLICATIVOS',
    'PROTEST-PC1',
    'MEGA',
    'BARRA-1',
    'BARR',
    'COPACABANA',
    'TIJUC',
    'NITERO',
    'COPA-SQL',
    'COPINHA',
    'ESOSERVER',
    'PROTEST-SQL',
]

for i in servers:
    os.system(f'rmdir /s /q "\\\{i}\{dirBatchPatch}" >NUL 2>&1')"""
            