C:\Windows\System32\Certutil.Exe -Urlcache -Split -F https://7-zip.org/a/7z2201-x64.exe $env:TEMP\7z.Exe
Start-Process -FilePath $env:TEMP\7z.Exe -Args "/S" -Verb RunAs -Wait
Remove-Item $env:TEMP\7z.Exe
