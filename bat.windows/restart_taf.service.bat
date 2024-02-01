@echo off
chcp 65001
title Reinicia serviços - TAF


rem Encerrada a console do AppServer TAF_WS
rem Reinicia Taf-AppServer
rem Reinicia TOTVS-TAF-DBACCESS-4016
rem Reinicia TSS-Appserver12
rem Reinicia a console AppServer TAF_WS "C:\TOTVS\TAF\bin\app\AppServer.exe -console"



cls
echo:
echo Finalizando a console AppServer TAF_WS.
taskkill /F /FI "SESSION eq 1" /IM "appserver.exe" >NUL 2>&1

echo:
echo Reiniciando o serviço Taf-AppServer.
net stop "Taf-AppServer" >NUL 2>&1
net start "Taf-AppServer" >NUL 2>&1

echo:
echo Reiniciando o serviço TOTVS-TAF-DBACCESS-4016.
net stop "TOTVS-TAF-DBACCESS-4016" >NUL 2>&1
net start "TOTVS-TAF-DBACCESS-4016" >NUL 2>&1

echo:
echo Reiniciando o serviço TSS-Appserver12.
net stop "TSS-Appserver12" >NUL 2>&1
net start "TSS-Appserver12" >NUL 2>&1

echo:
echo Reiniciando a console AppServer TAF_WS.
C:\TOTVS\TAF\bin\app\AppServer.exe -console >NUL 2>&1

echo:
echo Serviços do TAF reinciados.
pause


