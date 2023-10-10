echo off
chcp 65001
cls
echo Reinicie o serviço "RM.Host.Service" remotamente.
echo.
set /p HOST="Nome da máquina destino: "
echo.
START /B /WAIT psexec.exe \\%HOST% cmd /c net stop RM.Host.Service
START /B /WAIT psexec.exe \\%HOST% cmd /c net start RM.Host.Service
PAUSE