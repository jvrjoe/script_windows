import getpass
import os
from smbprotocol.connection import Connection
from smbprotocol.exceptions import SMBException


username = (os.environ['USERDOMAIN'] + '\\' + os.environ['USERNAME'])
print (f"Usuário logado: {os.environ['USERNAME']}")
password = getpass.getpass(f'Digite sua Senha: ')
host = input(f'Nome do computador remoto: ')


try:
    # Cria uma conexão com o servidor
    conn = Connection(host, username=username, password=password)

    # Abre uma sessão com o servidor
    conn.connect()
    tree = conn.tree_connect(r'\\' + host + r'\IPC$')

    # Lista as pastas compartilhadas no servidor
    for share in tree.list_shares():
        print(f'Nome do compartilhamento: {share.name}')

    # Fecha a conexão com o servidor
    conn.disconnect()

except SMBException as e:
    print(f'Ocorreu um erro ao tentar se conectar ao servidor: {e}')
