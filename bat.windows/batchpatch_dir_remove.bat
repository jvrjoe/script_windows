@echo off
chcp 65001
cls

set /p pass="Senha de rede: "
goto remove

:remove
cls
set "host="
set /p host="Nome da máquina: "
psexec.exe -u %USERDOMAIN%\%USERNAME% -p %pass% \\%host% cmd /c rmdir /s /q "C:\Program Files\BatchPatch"
pause

goto remove
