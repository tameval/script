$tkn= Get-Content "C:\CRDemo\tkn.txt"
$headers=@{"Authorization"="token ghp_"+$tkn; "Accept"="application/octet-stream"}
Invoke-WebRequest "https://raw.githubusercontent.com/tameval/script/main/scanning_dga.bat" -Headers $headers -OutFile $env:TEMP\scan.bat
Start-Process -Wait $env:TEMP\scan.bat
Remove-Item $env:TEMP\scan.bat
