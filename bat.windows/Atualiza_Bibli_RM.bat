@echo off
chcp 65001
title Atualização remota da BibliotecaRM

:acesso
cls
echo:
set "pass="
set /p pass="Digite sua senha de rede: "
if not defined pass goto acesso

:dir_bibli
cls
echo:
set /p dir_bibli="Caminho da Biblioteca com aspas duplas: "
if not defined dir_bibli goto dir_bibli

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
    
    :bibli
    echo:
    echo Finalizando o processo "RM.exe"...
    start /b taskkill /F /S %host% /IM "rm.exe" >NUL 2>&1
    if %ERRORLEVEL% == 128 set status=ok && echo Precesso finalizado.
    if %ERRORLEVEL% == 0 set status=ok && echo Processo finalizado.
    if not defined status echo Erro ao finalizar o processo. Código: %ERRORLEVEL% && pause && goto define
    echo:
    echo Instalando a Biblioteca...
    psexec \\%host% -u %USERDOMAIN%\%USERNAME% -p %pass% cmd /c %dir_bibli% /SILENT /SUPPRESSMSGBOXES /NORESTART >NUL 2>&1
        if %ERRORLEVEL% == 0 goto patch
        if not %ERRORLEVEL% == 0 echo Falha na instalação da Biblioteca. Erro: %ERRORLEVEL%. & pause & goto bibli
endlocal