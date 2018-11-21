# VM and Workspace Deployment
#### Estimated lab time: 15 minutes
This section is intended to deploy dependency Azure resources in an automated way to get you started quickly or in case you need to re-provision your environment.

#### Assumptions
You have received an Azure pass or you have a test environment available. Please don't use these lab exercises in a production environment (or at your own risk) <br>

For using these labs in combination with Labs On Demand (LOD), open an incognito/inprivate browser session on your laptop and login to the Azure portal leveraging the LOD account (like for example admin@ems123456.onmicrosoft.com)<br><br>

***Additional notes**:*
- Close the Azure Advisor recommendations if that opens for you.
- When deploying the template below, a number of fields are locked to ensure that the references in the labs are accurate.<br>
- **Create a new resource group for your deployment** (like ASC-Labs)
- Provide one single password for your administrator and root account (same account name is used for both, default is azureadmin)
- As soon as the workspace has been created, you can continue with the lab exercise
- Click on **Start Trial**, if you are prompted for a Security Center trial

#### Deploy VMs and Create a Workspace
Use the **Deploy to Azure** button below to deploy the following:
- A Log Analytics workspace (ASC-Workspace-xxxx)
- Security Center OMS solution
- 2 Windows VM's (*Win-x*, connected to the workspace)
- 2 Linux Ubuntu VM's (*Linux-x*, connected to the workspace) <br><br>

***Note**: after clicking on the Deploy to Azure button and filling in fields, scroll down, check the box with **I agree**... and click on **Purchase** to start the deployment.*

Because we are deploying the Security Center solution in the workspace, the VM's will become security managed by Security Center.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftianderturpijn%2FAzure-Security-Center%2Fmaster%2FLabs%2F01%2520-%2520VM%2520and%2520Workspace%2520Deployment%2FFiles%2FdeployAscManagedVmsWithLA.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<br><br>

The deployment takes about 13 minutes.<br><br>
After the deployment of the template, you can check the progress of your deployment if you click on your created resource group details, then click on **Deployments** (*1 deploying*). <br>
Continue with the exercise below as soon as your workspace has been created. You don't have to wait until the deployment has completed.

### Configure the data collection settings in ASC
As soon as the the workspace has been deployed (you don't have to wait for all the resources to be deployed), do the following:
1. Navigate to the **Security Center** blade
2. Click on **Start Trial** (if you have clicked on Skip, you can click **on Getting Started**)
3. Click on **Install agents**, if the button has been grayed out, then it's already set to **On**
4. Click on **Security policy**
5. Your subscription (Azure pass) should be listed (if it does not, close your browser session and open a new one)
6. On the line where it lists your Azure subscription (Azure pass), click on **Edit settings**
7. Set **Auto Provisioning** to **On** (if it's not already set to On)
8. Select your workspace **ASC-Workspace-xxxx** (which has been created by the template) under **Use another workspace**
9. Click on **Save**
9. Click on **Yes** on **Would you like to reconfigure monitored VMs?**
10. Switch back to **Security Policy** and ignore the message "Your unsaved edits will be discarded"
11. On the line where it lists your **workspace**, click on **Edit settings**
12. Click on **Pricing tier**, select **Standard** and click on **Save**
13. Click on Data collection and select **All Events** and click on **Save**. <br><br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20VM%20and%20Workspace%20Deployment/Screenshots/datacollection_settings.png
)<br>


*Note: It can take some time for the VM's to become visible in Security Center*



