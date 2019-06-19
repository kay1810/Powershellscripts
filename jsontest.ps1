#Convert hardcoded data to json format

 $data = [ordered]@{
          Description= "Projects and builds";
          ProjectA = @(
            @{"Build1"="Buildconfig1"; "Build2"="Buildconfig2"}
          
        );
		ProjectB = @(
            @{"Build1"="Buildconfig1"; "Build2"="Buildconfig2"}
          
        );
		ProjectC = @(
            @{"Build1"="Buildconfig1"; "Build2"="Buildconfig2"; "Build3"="Buildconfig3"}
        
        )
		   }
$json = $data | ConvertTo-Json
$json