@echo off
set "logfile=c:\log_base.txt"

echo Iniciando o ping em %date% %time% > %logfile%
echo: >> "%logfile%"

goto loop

:loop

ping 10.0.0.1 -t | echo ping %time% >> %logfile%

call loop