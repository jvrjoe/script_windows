@echo off
chcp 65001
title Listar/Remover usuário antigo.

REM Para a execução em várias máquinas, deve-se criar um arquivo .txt com o nome de cada uma, linha a linha. O caminho do arquivo será solicitado.
REM É necessário que o executável "DelProf2.exe" esteja no diretório %USERPROFILE%

:option
cls
echo:
echo Escolha uma opção para listar ou remover usuário antigo remotamente.
echo 1 - Uma máquina.
echo 2 - Várias máquinas.
echo 0 - Sair
echo:
set "opt="
set /p opt="Digite o número da opção: "
echo.
if "%opt%" == "1" goto only_one
if "%opt%" == "2" goto several
if "%opt%" == "0" ( exit ) else ( echo Opção inválida)
pause
call :option

setlocal ENABLEDELAYEDEXPANSION
    :only_one
    title Uma máquina.
    cls
    echo:
    echo Escolha uma opção:
    echo 1 - Listar usuários de uma máquina.
    echo 2 - Remover usuários de uma máquina.
    echo 3 - Voltar ao menu anterior.
    echo 0 - Sair
    echo:
    set "opt="
    set /p opt="Digite o número da opção: "
    echo.
    if "%opt%" == "1" goto list_only_one
    if "%opt%" == "2" goto remove_only_one
    if "%opt%" == "3" goto option
    if "%opt%" == "0" ( exit ) else ( echo Opção inválida)
    pause
    call :only_one

    :list_only_one
    title Listar usuários de uma máquina.
    cls
    echo:
    set "host="
    set /p host="Digite o nome da máquina: "
    title Máquina: %host%
    REM set "days="
    REM set /p days="Dias de inatividade: "
    cls
    echo:
    REM %USERPROFILE%\DelProf2.exe -l -c:%host% -ed:admin -d:%days%
    %USERPROFILE%\DelProf2.exe -l -c:%host% -ed:admin | findstr %host%
    echo:
    set "quest_log="
    set /p quest_log="Deseja salvar este log sim(1) ou não(0)? "
    if "%quest_log%" == "1" %USERPROFILE%\DelProf2.exe -l -c:%host% -ed:admin | findstr %host% > %SYSTEMDRIVE%\list_users_%host%.txt & echo Log salvo: %SYSTEMDRIVE%\list_users_%host%.txt & echo. & pause & goto only_one
    if "%quest_log%" == "0" ( goto only_one) else ( echo Opção inválida)
    pause
    call :only_one

    :remove_only_one
    title Remover usuários de uma máquina.
    cls
    echo:
    set "host="
    set /p host="Digite o nome da máquina: "
    title Máquina: %host%
    REM set "days="
    REM set /p days="Dias de inatividade: "
    cls
    echo:
    REM %USERPROFILE%\DelProf2.exe -c:%host% -ed:admin -d:%days% -p
    %USERPROFILE%\DelProf2.exe -c:%host% -ed:admin -p
    echo:
    pause
    goto only_one

    :several
    title Várias máquinas.
    cls
    echo:
    echo Escolha uma opção:
    echo 1 - Listar usuários de várias máquinas.
    echo 2 - Remover usuários de várias máquinas.
    echo 3 - Voltar ao menu anterior.
    echo 0 - Sair
    echo:
    set "opt="
    set /p opt="Digite o número da opção: "
    echo.
    if "%opt%" == "1" goto list_several
    if "%opt%" == "2" goto remove_several
    if "%opt%" == "3" goto option
    if "%opt%" == "0" ( exit ) else ( echo Opção inválida.)
    pause
    call :several

    :list_several
    title Listar usuários de várias máquinas.
    cls
    echo:
    set "path="
    set /p path="Digite o caminho do arquivo TXT com o nome das máquinas: "
    REM set "days="
    REM set /p days="Dias de inatividade: "
    cls
    echo:
    REM for /F %%i in (%path%) do %USERPROFILE%\DelProf2.exe -l -c:%%i -ed:admin -d:%days%
    for /F %%i in (%path%) do echo --------------------------------------------------------------------------- & echo. & %USERPROFILE%\DelProf2.exe -l -c:%%i -ed:admin | %WINDIR%\System32\findstr.exe %%i & echo.
    echo:
    set "quest_log="
    set /p quest_log="Deseja salvar este log sim(1) ou não(0)? "
    if "%quest_log%" == "1" ( for /F %%i in (%path%) do echo --------------------------------------------------------------------------- & echo. & %USERPROFILE%\DelProf2.exe -l -c:%%i -ed:admin| %WINDIR%\System32\findstr.exe %%i & echo.) > %SYSTEMDRIVE%\list_users_several.txt & echo Log salvo: %SYSTEMDRIVE%\list_users_several.txt & echo. & pause & goto several
    if "%quest_log%" == "0" ( goto several) else ( echo Opção inválida.)
    pause
    goto several

    :remove_several
    title Remover usuários de várias máquinas.
    cls
    echo:
    set "path="
    set /p path="Digite o caminho do arquivo TXT com o nome das máquinas: "
    REM set "days="
    REM set /p days="Dias de inatividade: "
    cls
    echo:
    REM for /F %%i in (%path%) do %USERPROFILE%\DelProf2.exe -c:%%i -ed:admin -d:%days% -p
    for /F %%i in (%path%) do %USERPROFILE%\DelProf2.exe -c:%%i -ed:admin -p
    echo:       
    pause
    goto several
    pause
endlocal