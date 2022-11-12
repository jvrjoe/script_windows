import getpass; import os; from pypsexec.client import Client

username = input('Usuário: ')
password = getpass.getpass('Senha: ')
host = input('Nome da máquina: ')

if os.system("ping -n 1 " + host) == 0:
    c = Client(host, username=username, password=password, encrypt=False)

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
  print(host, 'DESLIGADA')
