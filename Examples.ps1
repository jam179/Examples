# example no body

$Region= "Regioninfo"

$URI = (($Endpoint.access.serviceCatalog | Where-Object name -eq "cloudServersOpenStack").endpoints | Where-Object region -eq $Region).publicURL + "/servers"
$execute = Invoke-RestMethod -URI $URI -Method Get -Headers $AuthToken
$execute | Format-Wide  #this just shows the results


# Example with Body


$Var1 = "Var1info"
$Var2 = "Var2info"
$Var3 = "Var3info"
$Region= "Regioninfo"

$Body = @{"FromDoc" = @{"Param1" = $Var1; "Param2" = $Var2 ; "Param2" = $Var3 }} | convertTo-Json
$URI = (($Endpoint.access.serviceCatalog | Where-Object name -eq "cloudServersOpenStack").endpoints | Where-Object region -eq $Region).publicURL + "/servers"
$execute = Invoke-RestMethod -Uri $URI -Method POST -Headers $AuthToken -Body $CBody -ContentType "application/json"
