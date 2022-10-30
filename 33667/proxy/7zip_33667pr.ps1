$proxy_url = Get-Content 'C:\CRDemo\proxy.txt'
Invoke-WebRequest "https://7-zip.org/a/7z2201-x64.exe" -Proxy $proxy_url -Headers $headers -OutFile $env:TEMP\7z.Exe
Start-Process -FilePath $env:TEMP\7z.Exe -Args "/S" -Verb RunAs -Wait
Remove-Item $env:TEMP\7z.Exe
