import getpass
import os
from pypsexec.client import Client

# Variáveis
executable= 'cmd'
argument= r'/c \\pt55\ocs_inventory$\invent.bat'

# print('Instalação remota OCS_Inventory')
# print('Deve ser executado com login administrativo!')

domain = os.environ['USERDOMAIN']
usr = (os.environ['userdomain'] + '\\' + getpass.getuser()) #"""'\\'+ getpass.getuser()""")
pw = getpass.getpass(f'Digite a senha do usuário: ')


print()

#opt = input('\nEscolha uma opção: \n1 - Instalação individual \n2 - Instalação em lote \n\nSua escolha: ')

#if opt == '1':
host = 'copa-dp16' #input('Informe o nome da máquina: ')
#c = Client(host, username=((domain)+'\\'+(usr)), password=pwd, encrypt=True)
c = Client(server=host, username=usr, password=pw, encrypt=True)

# if os.system("ping -n 1 " + host) == 0:
c.connect()
try:
    c.create_service()
    stdout, stderr, rc = c.run_executable(executable=executable, arguments=argument)
finally:
    c.remove_service()
    c.disconnect()
    # print(stderr.replace("\r\n", ""))


if rc < 1:
    print(stdout.decode('latin'))
else:
    print(stderr.decode('latin'))
    


"""host = input('\n Local do arquivo texto com o nome das máquinas: ')
with open(fileHosts) as file:
    for host in file:
       c = Client(host.replace('\n', ''), username=username, password=password, encrypt=True)
      executable= 'cmd.exe /c \\copinha\\netlogon\invent.bat'
    argument= ''
        c.connect()
        try:
           c.create_service()
          stdout, stderr, rc = c.run_executable(executable=executable, arguments=None)
        finally:
           c.remove_service()
            c.disconnect()"""