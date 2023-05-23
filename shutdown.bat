echo off
chcp 65001

:menu_opcao
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
set INPUT=false
set /p opcao="Escolha uma opção: "
if %opcao% == 1 goto menu_reiniciar
if %opcao% == 2 goto menu_desligar
if %opcao% == 0 goto sair
if %INPUT% == false echo Opção inválida. Tente novamente & timeout 2 > NUL & goto menu_opcao

:sair
exit

:menu_reiniciar
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
set INPUT=false
set /p opcao="Escolha uma opção: "
if %opcao% == 1 goto reboot_now
if %opcao% == 2 goto reboot_after
if %opcao% == 3 goto menu_opcao
if %opcao% == 0 goto sair
if %INPUT% == false echo Opção inválida. Tente novamente & timeout 2 > NUL & goto menu_reiniciar
    

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
set "host="
set "opcao="
set INPUT=false
set /p opcao="Escolha uma opção: "

if %opcao% == 1 (
    set /p host="Nome do computador: " &
    echo Nome host dentro %host%
    pause )
    echo Nome hosta fora %host%
    pause
    @REM && start /B shutdown.exe /r /t 60 /m \\%host% 

    @REM start /B shutdown.exe /r /m \\%host% /t 60 
    @REM     if %ERRORLEVEL > 0 echo O computador não existe ou não pode ser reiniciado.
    @REM ))
    @REM if %ERRORLEVEL% > 0 echo O computador não existe ou não pode ser reiniciado) 
    @REM else echo Reiniciando o compuador remoto
if %opcao% == 2 goto menu_reiniciar
if %opcao% == 0 goto sair
if %INPUT% == false echo Opção inválida. Tente novamente & timeout 2 > NUL & goto reboot_now


pause

goto menu_opcao

@REM :reboot_after
@REM cls
@REM echo:
@REM echo Definir tempo para reiniciar
@REM echo

@REM :menu_desligar
@REM cls
@REM echo:
@REM echo                DESLIGAR             
@REM echo =======================================
@REM echo *   1 - Desligar imediatamente        *
@REM echo *   2 - Definir tempo para desligar   *
@REM echo *   3 - Voltar ao menu principal      *
@REM echo *   0 - Sair                          *
@REM echo =======================================
@REM echo:
@REM set opcao=""
@REM set /p opcao="Escolha uma opção: "

@REM if %opcao% == 1 goto shutdown_now
@REM if %opcao% == 2 goto shutdown_after
@REM if %opcao% == 3 goto menu_opcao
@REM if %opcao% == 0 goto sair
