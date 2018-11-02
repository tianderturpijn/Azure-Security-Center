# Sample script to add custom JIT rules to a VM
# Documentation: https://docs.microsoft.com/en-us/azure/security-center/security-center-just-in-time#using-just-in-time-vm-access-via-powershell
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

Set-AzureRmJitNetworkAccessPolicy -Kind "Basic" `
 -Location $location -Name "default" `
 -ResourceGroupName $resourceGroupName `
 -VirtualMachine $JitPolicyArray



 