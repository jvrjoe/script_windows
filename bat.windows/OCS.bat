@echo off
chcp 65001
cls

set /p pass="Senha de rede: "
goto instala

:instala
cls
set "host="
set /p host="Nome da máquina: "
psexec.exe -u %USERDOMAIN%\%USERNAME% -p %pass% \\%host% cmd /c \\copinha\netlogon\invent.bat
pause

goto instala
