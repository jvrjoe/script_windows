import subprocess, datetime, time, os

date_today = datetime.date.today().strftime("%d-%m-%Y")
time_now = datetime.datetime.now().time().strftime("%H:%M:%S")

print(datetime.datetime.now().isoformat(timespec='seconds'))

host = input('Informe o IP do host: ')
logfile = f"C:\\ping_fail_{host}_{date_today}_{time_now}.txt"

with open(logfile, "a") as file:
    os.system('cls')
    file.write(f'Monitoramento iniciado para o host: "{host}" -- {date_today} / {time_now}')
    print(f'Monitoramento iniciado para o host: "{host}" -- {date_today} / {time_now}')
    file.close()
 
while True:
    try:
        ping_process = subprocess.Popen(["ping", host, "-n", "1"], stdout=subprocess.PIPE)
        output = ping_process.communicate()[0].decode('latin-1')  # Decodificar usando 'latin1'
        
        if "Esgotado" in output:
            with open(logfile, "a") as file:
                file.write("Falha às " + str(time_now) + "\n")
                file.close()

        time.sleep(1)

    except KeyboardInterrupt:
        with open(logfile, "a") as file:
            file.write('Processo finalizado às {}'.format(time_now))
        print('Processo finalizado às {}'.format(time_now))
        exit()
