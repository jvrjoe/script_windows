@echo off
chcp 65001
title Atualização remota da UltraVNC

:acesso
cls
echo:
set "pass="
set /p pass="Digite sua senha de rede: "
if not defined pass goto acesso

:dir_exec
cls
echo:
set /p dir_exec="Caminho do executável com aspas duplas: "
if not defined dir_exec goto dir_exec

setlocal ENABLEDELAYEDEXPANSION
    :define
    cls
    echo:
    set /p host="Informe o nome ou IP da máquina: "
    cls
    echo ===========================================
    echo  Máquina: %host%                                      
    echo ===========================================
    if not defined host goto define

    :exec
    echo:
    echo Finalizando o processo "winvnc.exe"...
    start /b taskkill /F /S %host% /IM "winvnc.exe" >NUL 2>&1
    if %ERRORLEVEL% == 128 set status=ok && echo Precesso finalizado.
    if %ERRORLEVEL% == 0 set status=ok && echo Processo finalizado.
    if not defined status echo Erro ao finalizar o processo. Código: %ERRORLEVEL% && pause && goto define
    echo:
    echo Atualizando o UltraVNC...
    psexec \\%host% -u %USERDOMAIN%\%USERNAME% -p %pass% cmd /c %dir_exec% /silent >NUL 2>&1
        if %ERRORLEVEL% == 0 echo Processo finalizado com êxito! & pause & goto define
        if not %ERRORLEVEL% == 0 echo Falha na atualização. Erro: %ERRORLEVEL%. & pause & goto exec