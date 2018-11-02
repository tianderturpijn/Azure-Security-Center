# Fast Track
This section is intended to deploy dependency Azure resources in an automated way in case you need to re-provision your environment or in case you are skipping some labs

#### Deploy VMs and Create a Workspace
Use the button below to deploy the following:
- A Log Analytics workspace
- Security Center OMS solution
- 2 Windows VM's (connected to the workspace)
- 2 Linux Ubuntu VM's (connected to the workspace) <br><br>

Because we are deploying the Security Center solution in the workspace, the VM's will become security managed by Security Center.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftianderturpijn%2FAzure-Security-Center%2Fmaster%2FLabs%2FFast%2520Track%2FFiles%2FdeployAscManagedVmsWithLA.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

<br><br>

### Configure the data collection settings in ASC
As soon as the the workspace has been deployed (you don't have to wait for all the resources to be deployed), navigate to the **Security Center** blade and select your workspace under **Use another workspace**. Select **All Events** under **Windows security events** and click on **Save**.

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/Fast%20Track/Screenshots/datacollection_settings.png
)<br>



