import getpass; import os; from pypsexec.client import Client

print(f'\nCrie um arquivo texto com o nome das máquinas na rede, que deseja visualizar o servidor DNS utilizado.')
print(f'Neste arquivo, o nome das máquinas devem estar separados por linha.\n')
print(f'Exemplo:\n PC1\n PC2\n PC3\n')
input(f'Com o arquivo criado, pressione a tecla Enter para continuar...\n')

#print(f'É necessário um usuário com privilégios administrativos na rede ou administrador local.')
username = input('Nome de usuário: ')
password = getpass.getpass('Senha: ')

fileHosts = input('\n Agora informe o caminho do arquivo texto criado: ')
while not os.path.isfile(fileHosts):
    fileHosts = input("Arquivo não encontrado! Insira corretamente o caminho completo do arquivo texto: ")

with open(fileHosts) as file:
    for host in file:
        if os.system("ping -n 1 " + host) == 0:
            c = Client(host.replace('\n', ''), username=username, password=password, encrypt=False)  
            # encrypt=False only for Windows 7
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
