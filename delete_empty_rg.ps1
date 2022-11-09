# Delete empty resource groups

$EmptyRG = 0
$NotEmptyRG = 0
foreach ($RG in Get-AzResourceGroup) 
{
    if ($null -eq (Get-AzResource -ResourceGroupName $RG.ResourceGroupName)) 
    {
        Remove-AzResourceGroup -ResourceGroupName $RG.ResourceGroupName -Force -Verbose -WhatIf
        Write-Output "$($RG.ResourceGroupName) is empty and has been deleted"
        $EmptyRG++
    }

    else 
    {
        Write-Output "$($RG.ResourceGroupName) is not empty"
        $NotEmptyRG++
    }
}

Write-Output "$EmptyRG Resource Groups are empty and have been deleted, $NotEmptyRG Resource Groups are not empty and have not been modified"
