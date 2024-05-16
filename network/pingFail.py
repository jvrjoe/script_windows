import subprocess, datetime, time, os

dateNow = datetime.date.today().strftime("%d-%m-%Y")
timeNow = datetime.datetime.now().time().strftime("%Hh%Mm%Ss")
date_time = f'{dateNow}T{timeNow}'

host = input('Informe o IP do host: ')
logfile = f"c:\\pingFail_{host}_{date_time}.txt"

with open(logfile, "a") as file:
    os.system('cls')
    file.write(f'MONITORAMENTO DE FALHA INICIADO - HOST: {host} DATA/HORA: {dateNow}/{timeNow}')
print(f'MONITORAMENTO DE FALHA INICIADO - HOST: {host} DATA/HORA: {dateNow}/{timeNow}\n'
        f'LOG: {logfile}\n\n'
        'CTRL+C PARA ENCERRAR O PROCESSO.\n')
 
while True:
    try:
        ping_process = subprocess.Popen(["ping", host, "-n", "1"], stdout=subprocess.PIPE) 
        # ping_process = subprocess.Popen(["ping", host, "-t"], stdout=subprocess.PIPE) #Não funciona
        output = ping_process.communicate()[0].decode('latin-1')  # Decodificar usando 'latin1'

        # Sem placa de rede, o ping retorna que a solicitação não pode encontrar o host e pára. Mesmo com o -t
        
        if "Esgotado" in output:
            with open(logfile, "a") as file:
                file.write(f'\nFALHA NA RESPOSTA = {datetime.datetime.now().time().strftime("%Hh%Mm%Ss")}')
            print((f'FALHA NA RESPOSTA = {datetime.datetime.now().time().strftime("%Hh%Mm%Ss")}'))
            time.sleep(0.1)

    except KeyboardInterrupt:
        with open(logfile, "a") as file:
            file.write(f'\nMONITORAMENTO ENCERRADO - {datetime.datetime.now().time().strftime("%Hh%Mm%Ss")}')
        print(f'\nMONITORAMENTO ENCERRADO - {datetime.datetime.now().time().strftime("%Hh%Mm%Ss")}')
        os.system('pause')
        exit()
