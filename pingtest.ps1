#Script to check connectivity 

 $url="www.google.com"
 try{ 
 $response=Invoke-WebRequest -Uri $url
 }
 catch{
 $response=$_.Exception.Response 
 }
 if ($response.StatusCode -eq 200) {
    Write-Host "Connection successful"
 }
 Else {
    Write-Host "Error in connection"
 }