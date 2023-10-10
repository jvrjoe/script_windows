@echo off
chcp 65001
title Renomear máquina na rede

rem cls
rem set /p pass="Sua senha de rede: "


setlocal ENABLEDELAYEDEXPANSION
	:rename
	cls
	echo:
	rem set "host="
	rem set "new_host="
	set /p host="Nome da máquina: "
	set /p new_host="Novo nome: "

	psexec.exe -u protest\administrator -p 123protestadministrator \\!host! cmd /c WMIC ComputerSystem where Name="!host!" call Rename Name="!new_host!"
rem	if !ERRORLEVEL! == 0 (
rem     echo:
rem     echo !host! renomeada para !new_host!. ) else (
   rem         echo:
      rem      echo Erro ao renomear !host! Código: !ERRORLEVEL!.)
	
	rem shutdown.exe /r /m \\!host! /t 00 >NUL 2>&1

	echo:
	pause
	goto rename
endlocal
