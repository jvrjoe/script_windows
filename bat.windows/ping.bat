@echo off
set "logfile=c:\log_base.txt"

echo: >> "%logfile%"
echo Iniciando o ping em %date% %time% >> "%logfile%"
echo: >> "%logfile%"

:loop
rem for /f "tokens=*" %%i in ('ping 90.0.0.10 -n 1 ^| find "Resposta"') do (
rem     echo %%i >> "%logfile%" %time%
rem )

for /f "tokens=*" %%i in ('ping 90.0.0.10 -n 1 ^| find "Esgotado"') do (
    echo %%i >> "%logfile%" %time%
)

rem timeout /nobreak /t 1 > nul
goto loop


