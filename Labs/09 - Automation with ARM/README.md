# 09 - Automation with ARM

##### Estimated lab time: 15 minutes
In this lab you are going to explore what the ASC automation options are leveraging Azure Resource Manager (ARM) templates

#### Requirements
1. You have completed **Module 08 - Automation with PowerShell**
2. You have received an Azure pass or you have a test environment available. Please don't use these lab exercises in a production environment (or at your own risk) <br>

For using these labs in combination with Labs On Demand (LOD), open an incognito/in-private browser session on your laptop and login to the Azure portal leveraging the LOD account (like for example admin@ems123456.onmicrosoft.com)<br>



##  ARM Template deployment
#### 1 - Explore the ASC settings in the portal
1. Open a browser and login to the  <a href="https://portal.azure.com" target="_blank">Azure Portal</a>
2. Click on **Security Center**
3. Click on **Security Policy**
4. On the line where it shows your subscription, click on **Edit settings**
5. Explore the settings, specifically the **email notification settings**.<br><br>
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs//09%20-%20Automation%20with%20ARM/Screenshots/asc_emailsettings.png
)

For the first ARM deployment exercise we are going to start with configuring the **Email notification** settings

#### 2 - Explore the Email Notifications ARM template
1. Open the <a href="https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/09%20-%20Automation%20with%20ARM/Files/configureAscEmailNotifications.json" target="_blank">ARM template</a> for email notifications in a new browser window
2. Notice the ARM template **parameter** allowed values. These values are case sensitive and are mandatory.
3. Under the ARM resources section  (**Microsoft.Security/securityContacts**), use "default1", "default2", etc. as value for the field name. These are mandatory fields and can only be used in this format

#### 3 - Deploy the Email Notifications ARM template

1. Open your favorite PowerShell editor
2. Login to the Azure Portal by using **Login-AzAccount**
3. Make sure that you have selected your Azure subscription which has been provided to you by using **Select-AzSubscription** (only necessary if you have multiple subscriptions)<br>
4. ASC resides at the subscription level, so we are going to target our ARM template deployment at the same level (instead of deploying it at the resource group level)
5. The syntax is *New-AzDeployment -TemplateFile* `yourArmTemplateFile` (note: we are going to use a prepared ARM template JSON file)
6. Copy and paste the below in your PowerShell session and execute it:<br><br>
**Note**:

- Use a proper email format like luke@skywalker.com.
- Use only numbers (no spaces) as a phone number.
- Fill in **On** or **Off** for alerts (case sensitive)
- If you receive an error running the New-AzDeployment cmdlet, make sure to run this:<br> **Install-Module -Name Az.Resources**<br>
```powershell
New-AzDeployment -TemplateUri "https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/09%20-%20Automation%20with%20ARM/Files/configureAscEmailNotifications.json" -location westus2
```

![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/09%20-%20Automation%20with%20ARM/Screenshots/PS_commands.png
)

7. After a successful completion, switch to the Azure portal and **refresh** (Ctrl+F5) the ASC blade and verify that the email settings have been updated according to the values in the template.
8. **[Optional exercise]** You can copy the template and use your own values

## Workspace creation
Security Centers stores MMA collected information (and more) in a Log Analytics workspace. ASC can create a default workspace automatically. This exercise is focused on using a custom workspace.<br><br>
In the next exercise we will create a new workspace which will be used as your default ASC workspace.

#### 1 - Create a Log Analytics workspace
***Note**: if you already have deployed a Log Analytics workspace you can skip this exercise, or create a second one to test drive multiple custom workspaces reporting up to ASC.*<br>

You can either create a workspace through the Azure portal, leverage an ARM template, or use PowerShell.
1. Navigate to the Azure portal and create a Log Analytics workspace **OR**:
2. Copy, paste and run the following PowerShell script "as is" to deploy an ARM template which will deploy the <a href="https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/09%20-%20Automation%20with%20ARM/Files/createNewOmsWorkspace.json" target="_blank">newOmsWorkspace</a> ARM template: (optionally you can use your own values in the script below, like location, etc.) <br>
```powershell
$myGuid = New-Guid
$RG = New-AzResourceGroup -Name 'ASC-Lab-2' -Location 'eastus'

New-AzResourceGroupDeployment -Name myWorkspaceDeploy -ResourceGroupName $RG.ResourceGroupName `
 -TemplateUri 'https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/09%20-%20Automation%20with%20ARM/Files/createNewOmsWorkspace.json' `
 -omsWorkspaceName ("ASC-workspace-$myGuid") -omsWorkspaceLocation "eastus" -Verbose
```

3. Switch to the Azure portal and open the **Security Center** blade
4. Click on **Security policy**
5. Your new created workspace should be listed under the **Policy Management** view <br><br>

***Note**: the ARM template deploys a new workspace with concatenating the workspace name with a GUID to ensure uniqueness.*
 
#### 2 - Change the Pricing tier and data collection settings of your workspace 
You can set the pricing tier and data collection settings per workspace, which is often not clear to customers, therefore we are going to set it in the portal instead of through automation (although you can automate it)
1. In the **Policy Management** view where your workspace is listed, click on **Edit settings** <br><br>
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/09%20-%20Automation%20with%20ARM/Screenshots/pricing_workspace1.png
)<br>
2. Click on **Pricing tier** and note that by default it is set to **Free**
3. Click on **Standard** and click on **Save**
4. Click on **Data collection**
5. Under **Windows security events**, select **All events** (by default it is set to none)
6. Click on **Save**

#### 3 - Collect the WorkspaceID and WorkspaceKey
For the next (**optional**) exercise where we deploy a more advanced ASC ARM template, we are going to need the workspace details.
1. In the Azure portal, navigate to Log Analytics
2. Click on your **workspace**
3. On the Overview blade, make a note of the **Resource group name** and the **Subscription ID**
4. Click on **Advanced settings** and also make a note of the **workspaceID** and the **primaryKey**, since you need those  values for the next exercise

### [Optional Lab] More complex ARM template deployment

#### 1 - Deploy a more complex ASC configuration ARM template
Now that you have explored how to deploy an ARM template to configure an ASC setting, you are going to explore how to deploy a more complex ARM template. <br>
ASC stores MMA collected data (and more) in a Log Analytics workspace. In a more complex environment, you often will find an existing Log Analytics workspace which needs to be integrated with ASC (aka the Central Workspace scenario).<br><br>
The following lab assumes that a (Central) Log Analytics workspace already exists (although this can be deployed with an ARM template at the same time) and you are going to configure ASC to use the existing Log Analytics workspace. In addition we are going to enable **Auto Provisioning** which will deploy the MMA extension automatically, as you would configure it in the portal, like this:<br><br>

![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/09%20-%20Automation%20with%20ARM/Screenshots/autoProvisioning_custom_%20Workspace.png)

Also we will configure ASC policies through the ARM template.

#### 2 - Explore the ASC advanced ARM template
1. Open the <a href="https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/09%20-%20Automation%20with%20ARM/Files/configureAscAdvanced.json" target="_blank">ASC Advanced ARM template</a> in a new browser window and explore it.
2. Look closely at the **parameters** and their allowed values
3. Under **resources**, observe the several settings that we will configure like autoProvisioning, workspace settings, etc. The recommendation policies can be configured one by one, but in this lab we will set the value to **On** or **Off** for all of them.
4. For ARM templates, it is recommended that you use a parameter file to pass values during a deployment if you don't want to type them in. In this lab we will just type them in and paste some values

#### 3 - Deploy the ASC advanced ARM Template
Your are going to deploy an ARM template which will configure a number of ASC settings and you will connect ASC with your workspace.<br>
1. Switch to the PowerShell session where you are logged into Azure, with the correct subscription selected and copy & paste the following script. Make sure to update all values with the information you have collected in the previous exercises:
```powershell
New-AzDeployment -TemplateFile 'https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/09%20-%20Automation%20with%20ARM/Files/configureAscAdvanced.json' `
-name 'AscAdvancedDeployment' -Location 'eastus' -autoProvisioning 'On' -workspaceName '<yourWorkspaceName>' `
-workspaceSubscriptionId '<yourAzuresubscriptionID>' -workspaceResourceGroup '<resourceGroupNameOfTheWorkspace>' `
-emailSecurityContact 'john@contoso.com' -phoneSecurityContact '12345' -alertNotifications 'On' -alertsToAdmin 'On' `
-securitySettings 'On'
```
*Note: it might take a couple minutes for the Azure portal to catch up and show your updated settings (like autoProvision)*

<br>

### Continue with the next lab
10 - Additional, click <a href="https://github.com/yaniv-shasha/Azure-Security-Center-1/tree/master/Labs/10%20-%20Additional" target="_blank">here</a>



