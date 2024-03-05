import subprocess, datetime, time, os

logfile = "C:\\log_ping_fail.txt"
date_today = datetime.date.today()
time_now = datetime.datetime.now().time()
host = input('Informe o IP do host: ')


with open(logfile, "a") as file:
    os.system('cls')
    file.write(f"Iniciando o ping para {host} em {datetime.date.today()} às {datetime.datetime.now().time()}")
    print(f"Iniciando o ping para {host} em {datetime.date.today()} às {datetime.datetime.now().time()}")
    file.close()
    

while True:
    try:
        ping_process = subprocess.Popen(["ping", host, "-n", "1"], stdout=subprocess.PIPE)
        output = ping_process.communicate()[0].decode('latin-1')  # Decodificar usando 'latin1'
        
        if "Esgotado" in output:
            with open(logfile, "a") as file:
                file.write("Falha às " + str(datetime.datetime.now().time()) + "\n")
                file.close()

        time.sleep(1)

    except KeyboardInterrupt:
        with open(logfile, "a") as file:
            file.write('Processo finalizado às {}'.format(datetime.datetime.now().time()))
        print('Processo finalizado às {}'.format(datetime.datetime.now().time()))

