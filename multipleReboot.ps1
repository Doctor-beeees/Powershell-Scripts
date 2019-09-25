

$a =  @(get-eventlog system  | where-object {$_.eventid -eq 6006} | Select-Object -Property Source, EventID, InstanceId, Message, TimeGenerated)



$compareDateOne = Get-Date ($a[0].TimeGenerated) 
$compareDateTwo = Get-Date ($a[1].TimeGenerated) 
$diff = NEW-TIMESPAN –Start $compareDateOne –End $compareDateTwo 

for($i=0; $i -lt 5; $i++){

    $n = $i + 1
    $compareDateOne = Get-Date ($a[$i].TimeGenerated) 
    $compareDateTwo = Get-Date ($a[$n].TimeGenerated) 
    $diff = NEW-TIMESPAN –Start $compareDateOne –End $compareDateTwo 

    if($diff.TotalMinutes -lt -420 ){
    
        Write-Output "its a boy"
        Write-Output $a[$i] | Select -property *
        Write-Output $diff.TotalMinutes

    }else{

        Write-Output "its not good bud"
        Write-Output $a[$i] | Select -property *
}
}