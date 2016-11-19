$IISExpressPath = "C:\Program Files\IIS Express"

$Cevap = Read-Host -Prompt "Default IISExpress Yolu Kullanılsınmı?($IISExpressPath) E/H "

if($Cevap -eq "H"){
    $IISExpressPath = Read-Host -Prompt "IISExpress Youlunu giriniz "
}

$ASPNETWebAdminPath = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ASP.NETWebAdminFiles"

$Cevap = Read-Host -Prompt "Default ASP.NET Web Admin Yolu Kullanılsınmı?($ASPNETWebAdminPath) E/H"

if($Cevap -eq "H"){
    $ASPNETWebAdminPath = Read-Host -Prompt "ASP.NET Web Admin Yolu giriniz "
}

$Port = Read-Host -Prompt "Port numarsı giriniz (8082) "

$IISExpress = Start-Process $IISExpressPath"\iisexpress.exe" -ArgumentList "/path:$ASPNETWebAdminPath /vpath:/ASP.NETWebAdminFiles /port:$Port /clr:4.0 /ntlm" -WindowStyle Minimized

$YourPath = Read-Host -Prompt "Web sitenin yolu "

$URL = "http://localhost:"+$Port+"/ASP.NETWebAdminFiles/default.aspx?applicationPhysicalPath="+$YourPath+"\&applicationUrl=/"

$Site = Start-Process $URL