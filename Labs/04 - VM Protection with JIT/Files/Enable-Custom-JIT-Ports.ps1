# Sample script to add custom JIT rules to a VM
# Documentation: https://docs.microsoft.com/en-us/powershell/module/az.security/set-azjitnetworkaccesspolicy?view=azps-2.6.0
# Created by Tiander Turpijn (Microsoft)

#Variables
$AzureSubID = "<YourAzureSubscriptionID>"
$vmName = "<YourVMName>"
$resourceGroupName = "YourResourceGroupName"
$location = "<YourLocation>"
$duration = "PT3H" #=3hrs

$JitPolicy = (@{
    id="/subscriptions/$AzureSubID/resourceGroups/$resourceGroupName/providers/Microsoft.Compute/virtualMachines/$vmName"
   ports=(@{
    number=22;
    protocol="*";
    allowedSourceAddressPrefix=@("*");
    maxRequestAccessDuration=$duration},
    @{
    number=3389;
    protocol="*";
    allowedSourceAddressPrefix=@("*");
    maxRequestAccessDuration= $duration})})

$JitPolicyArray=@($JitPolicy)

Set-AzJitNetworkAccessPolicy -Kind "Basic" `
 -Location $location -Name "default" `
 -ResourceGroupName $resourceGroupName `
 -VirtualMachine $JitPolicyArray



 