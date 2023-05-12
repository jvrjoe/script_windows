import itertools

# função geradora que retorna uma senha de cada vez
def generate_passwords():
    for combination in itertools.product(range(10), repeat=8):
        yield ''.join(map(str, combination))

# salvar as senhas em um arquivo
with open(r'c:\temp\wordlist.txt', 'w') as f:
    for password in generate_passwords():
        f.write(password + '\n')
