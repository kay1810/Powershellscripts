$user=$args[0]
$pass=$args[1]
$credpair="$($user):$($pass)"
Write-Host $credpair
$encodedcred=[System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($credpair))
$hosturl= "http://ec2-13-235-103-140.ap-south-1.compute.amazonaws.com:8080"
$Header=@{
          Authorization="Basic $encodedcred"
		  Accept="Application/json"
         }
$response=Invoke-WebRequest -uri ($hosturl+"/app/rest/projects") -Header $Header -UseBasicParsing
$timestamp=get-date -f MM-dd-yyyy_HH_mm_ss
if($response.StatusCode -eq 200){
Write-Host "Connection successful"
$data= $response.Content| ConvertFrom-Json 
$projectlist=$data.project
$projectlist | Export-CSV  -Path ./output.$timestamp.csv -NoTypeInformation
Write-Host "csv file created"
Write-Host "Importing csv file to view data"
$contents=Import-Csv ./output.$timestamp.csv
Write-Host $contents
}
else{
Write-Host "Connection not successful"
}
