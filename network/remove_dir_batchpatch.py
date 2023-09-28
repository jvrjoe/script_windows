import getpass
import os
from pypsexec.client import Client
import smbprotocol

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
            