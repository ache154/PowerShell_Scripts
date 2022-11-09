# Display all the resources in your Azure subscription, iterating through the resource groups.

$i = 0
while ( $i -lt $RGs.Count) {$RG_Name = $RGs.ResourceGroupName; Get-AzResource -ResourceGroupName $RG_Name[$i]; $i++}g
