@echo off
chcp 65001
title Renomear máquina na rede

:acesso
cls
echo:
set "pass="
set /p pass="Digite sua senha de rede: "
if not defined pass goto acesso


setlocal ENABLEDELAYEDEXPANSION
	:rename
	cls
	echo:
	set /p host="Nome da máquina: "
	set /p new_host="Novo nome: "
	psexec.exe -u %USERDOMAIN%\%USERNAME% -p %pass% \\!host! cmd /c WMIC ComputerSystem where Name="!host!" call Rename Name="!new_host!"
		if %ERRORLEVEL% == 0 echo Máquina %host% renomeada para %new_host%
        if not %ERRORLEVEL% == 0 echo Falha ao renomear. Erro: %ERRORLEVEL%. & pause & goto rename
	echo:
	pause
	goto rename
endlocal
