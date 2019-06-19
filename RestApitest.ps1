#script to access Rest API link and get data

 $url="https://reqres.in/api/users?page=2"
 try{ 
 $response=Invoke-WebRequest -Uri $url
 }
 catch{
 $response=$_.Exception.Response 
 }
 if ($response.StatusCode -eq 200) {
 Write-Host $response 
  }