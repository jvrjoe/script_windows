import subprocess, datetime, time, os

dateNow = datetime.date.today().strftime("%d-%m-%Y")
timeNow = datetime.datetime.now().time().strftime("%H:%M:%S")
date_time = datetime.datetime.now().isoformat(timespec='seconds').replace(':','.')

print(f'{dateNow}\n{timeNow}\n{date_time}')

host = input('Informe o IP do host: ')
logfile = f"C:\\ping_fail_{host}_{dateNow}_{timeNow}.txt"

with open(logfile, "a") as file:
    os.system('cls')
    file.write(f'Monitoramento iniciado para o host: "{host}" -- {dateNow} / {timeNow}')
    print(f'Monitoramento iniciado para o host: "{host}" -- {dateNow} / {timeNow}')
    file.close()
 
while True:
    try:
        ping_process = subprocess.Popen(["ping", host, "-n", "1"], stdout=subprocess.PIPE)
        output = ping_process.communicate()[0].decode('latin-1')  # Decodificar usando 'latin1'
        
        if "Esgotado" in output:
            with open(logfile, "a") as file:
                file.write("Falha às " + str(timeNow) + "\n")
                file.close()

        time.sleep(1)

    except KeyboardInterrupt:
        with open(logfile, "a") as file:
            file.write('Processo finalizado às {}'.format(timeNow))
        print('Processo finalizado às {}'.format(timeNow))
        exit()
