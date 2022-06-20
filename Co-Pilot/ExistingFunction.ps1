function Get-RunningAzureVM {
    param(
        [parameter()]
        [string]$SubscriptionId
    )
    #requires -Module Az.Accounts, Az.Compute
    $AllVMs = @()
    if ($Subscription) {
        $AllSubscriptions = Get-AzSubscription -SubscriptionId $SubscriptionId
    }
    else {
        $AllSubscriptions = Get-AzSubscription
    }
    foreach ($Subscription in $AllSubscriptions) {
        $Null = Set-AzContext $Subscription.Id
        Write-Host "Collecting VMs from $($Subscription.Name)"
        $AllVMs += Get-AzVM -Status | Where-Object { $_.PowerState -eq "VM running" }
    }
    $AllVMs
}

