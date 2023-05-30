@echo off
chcp 65001

:menu_opt
cls
echo:
echo             MENU DE OPÇÕES             
echo =======================================
echo *   1 - Reiniciar computador remoto   *
echo *   2 - Desligar computador remoto    *
echo *   0 - Sair                          *
echo =======================================
echo:
set "opcao="
set /p opcao="Escolha uma opção: "
if "%opcao%" == "1" goto menu_reboot
if "%opcao%" == "2" goto menu_shutdown
if "%opcao%" == "0" ( goto close) else ( echo Opção inválida)
if "%opcao%" == " " goto menu_opt
pause
call :menu_opt

:close
exit

:menu_reboot
cls
echo:
echo               REINICIAR             
echo =======================================
echo *   1 - Reiniciar imediatamente       *
echo *   2 - Definir tempo para reiniciar  *
echo *   3 - Voltar ao menu principal      *
echo *   0 - Sair                          *
echo =======================================
echo:
set "opcao="
set /p opcao="Escolha uma opção: "

if "%opcao%" == "1" goto reboot_now
if "%opcao%" == "2" goto reboot_after
if "%opcao%" == "3" goto menu_opt
if "%opcao%" == "0" ( goto close) else ( echo Opção inválida)
if "%opcao%" == " " goto menu_reboot
pause
call :menu_reboot

:reboot_now
cls
echo:
echo         REINICIAR IMEDIATAMENTE
echo =======================================
echo *       1 - Informe o computador      *
echo *       2 - Voltar ao menu anterior   *
echo *       0 - Sair                      *
echo =======================================
echo:
set "opcao="
set /p opcao="Escolha uma opção: "

setlocal ENABLEDELAYEDEXPANSION
if "%opcao%" == "1" (
    echo:
    set /p host="Nome do computador: "
    shutdown.exe /r /m \\!host! /t 00 >NUL 2>&1
    if !ERRORLEVEL! == 0 (
        echo:
        echo O computador !host! está sendo reiniciado.) else (
            echo:
            echo O computador !host! não existe ou não pode ser reiniciado.)
        pause
)
endlocal    
if "%opcao%" == "2" goto menu_reboot
if "%opcao%" == "0" ( goto close) else ( echo Opção inválida)
if "%opcao%" == " " goto reboot_now
pause
call :reboot_now

:reboot_after
cls
echo:
echo      DEFINIR TEMPO PARA REINICIAR      
echo =======================================
echo *       1 - Informe o computador      *
echo *       2 - Voltar ao menu anterior   *
echo *       0 - Sair                      *
echo =======================================
echo:
set "opcao="
set /p opcao="Escolha uma opção: "

setlocal ENABLEDELAYEDEXPANSION
if "%opcao%" == "1" (
    echo:
    set /p host="Nome do computador: "
    set /p time="Reiniciar em quantos segundos? "
    shutdown.exe /r /m \\!host! /t !time! >NUL 2>&1
    if !ERRORLEVEL! == 0 (
        echo:
        echo O computador !host! será reiniciado em !time! segundos.) else (
            echo:
            echo O computador !host! não existe ou não pode ser reiniciado.)
        pause
)
endlocal    
if "%opcao%" == "2" goto menu_reboot
if "%opcao%" == "0" ( goto close) else ( echo Opção inválida)
if "%opcao%" == " " goto reboot_after
pause
call :reboot_after

:menu_shutdown
cls
echo:
echo                DESLIGAR             
echo =======================================
echo *   1 - Desligar imediatamente        *
echo *   2 - Definir tempo para desligar   *
echo *   3 - Voltar ao menu principal      *
echo *   0 - Sair                          *
echo =======================================
echo:
set "opcao="
set /p opcao="Escolha uma opção: "

if "%opcao%" == "1" goto shutdown_now
if "%opcao%" == "2" goto shutdown_after
if "%opcao%" == "3" goto menu_opt
if "%opcao%" == "0" ( goto close) else ( echo Opção inválida)
if "%opcao%" == " " goto menu_shutdown
pause
call :menu_shutdown

:shutdown_now
cls
echo:
echo         DESLIGAR IMEDIATAMENTE
echo =======================================
echo *       1 - Informe o computador      *
echo *       2 - Voltar ao menu anterior   *
echo *       0 - Sair                      *
echo =======================================
echo:
set "opcao="
set /p opcao="Escolha uma opção: "

setlocal ENABLEDELAYEDEXPANSION
if "%opcao%" == "1" (
    echo:
    set /p host="Nome do computador: "
    shutdown.exe /s /m \\!host! /t 00 >NUL 2>&1
    if !ERRORLEVEL! == 0 (
        echo:
        echo O computador !host! está sendo desligado.) else (
            echo:
            echo O computador !host! não existe ou não pode ser desligado.)
        pause
)
endlocal    
if "%opcao%" == "2" goto menu_shutdown
if "%opcao%" == "0" ( goto close) else ( echo Opção inválida)
if "%opcao%" == " " goto shutdown_now
pause
call :shutdown_now

:shutdown_after
cls
echo:
echo      DEFINIR TEMPO PARA DESLIGAR      
echo =======================================
echo *       1 - Informe o computador      *
echo *       2 - Voltar ao menu anterior   *
echo *       0 - Sair                      *
echo =======================================
echo:
set "opcao="
set /p opcao="Escolha uma opção: "

setlocal ENABLEDELAYEDEXPANSION
if "%opcao%" == "1" (
    echo:
    set /p host="Nome do computador: "
    set /p time="Desligar em quantos segundos? "
    shutdown.exe /s /m \\!host! /t !time! >NUL 2>&1
    if !ERRORLEVEL! == 0 (
        echo:
        echo O computador !host! será desligado em !time! segundos.) else (
            echo:
            echo O computador !host! não existe ou não pode ser desligado.)
        pause
)
endlocal    
if "%opcao%" == "2" goto menu_shutdown
if "%opcao%" == "0" ( goto close) else ( echo Opção inválida)
if "%opcao%" == " " goto shutdown_after
pause
call :shutdown_after