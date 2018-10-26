# ASC Automation & Configuration

In this lab you are going to explore what the ASC automation and deployment options are.

You will configure ASC with:
1. ARM Templates
2. PowerShell

 
### ARM Template deployment
#### 1 - Explore the ASC settings in the portal
1. Open a browser and login to the  <a href="https://portal.azure.com" target="_blank">Azure Portal</a>
2. Click on **Security Center**
3. Click on **Security Policy**
4. On the line where it shows your subscription, click on **Edit settings**
5. Explore the settings, specifically the email notification settings.

For the ARM deployment lab we are going to start with configuring the **Email notification** settings

#### 2 - Explore the Email Notifications ARM template
1. Open the <a href="https://github.com/tianderturpijn/Azure-Security-Center/blob/master/Labs/01%20-%20Automation/Files/configureAscEmailNotifications.json" target="_blank">ARM template</a> for email notifications
2. Notice the ARM template parameter allowed values. These values are case sensitive and are mandatory.
3. Under the ARM resources (securityContacts), use "default1", "default2", etc. as the name. These are mandatory fields and can only be used in this format

#### 3 - Deploy the Email Notifications ARM template
**Assumptions**: You have installed the AzureRm PowerShell modules on your system.<br> If not, install those using *Install-Module -Name AzureRM*
1. Open your favorite PowerShell editor
2. Login to the Azure Portal by using **Login-AzureRmAccount**
3. Make sure that you have selected your Azure subscription which has been provided to you by using **Select-AzureRmSubscription**<br>
4. ASC resides at the subscription level, so we are going to target our ARM template deployment at the same level (instead of deploying it at the resource group level)
5. The syntax is *New-AzureRmDeployment -TemplateFile* `yourArmTemplateFile` (note: we are going to use a prepared ARM template JSON file)
6. Type the following in your PowerShell session and execute it:
```powershell
New-AzureRmDeployment -TemplateFile 'https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Files/configureAscEmailNotifications.json'
```

7. After a successful completion, switch to the Azure portal and refresh the ASC blade and verify that the email settings have been updated

#### 4 - Deploy a more comprehensive ASC configuration ARM template
Now that you have explored how to deploy an ARM template to configure an ASC setting, you are going to explore how to deploy a more comprehensive ARM template. <br>
ASC stores MMA collected data (and more) in a Log Analytics workspace. In a more complex environment, you will often find an existing Log Analytics workspace which needs to be integrated with ASC (aka the Central Workspace scenario).<br><br>
The following lab assumes that a (Central) Log Analytics workspace already exists (although this can be deployed with an ARM template at the same time) and you are going to configure ASC to use the existing Log Analytics workspace. In addition we are going to enable **Auto Provisioning** which will deploy the MMA automatically, as you would configure it in the portal, like this:<br><br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Screenshots/autoProvisioning_custom_%20Workspace.png)

Also we will configure ASC policies through the ARM template.

#### 5 - Explore the ASC advanced ARM template
1. Open the <a href="https://github.com/tianderturpijn/Azure-Security-Center/blob/master/Labs/01%20-%20Automation/Files/configureAscAdvanced.json" target="_blank">ASC Advanced ARM template</a> and explore it.
2. Look closely at the parameters and their allowed values
3. Under *resources, Microsoft.Security/policies*, observe the policies for recommendations. You can configure them one by one, but in this lab we will set the value to **On** or **Off** for all of them.
4. For ARM templates, it is recommended that you use a parameter file to pass values during a deployment if you don't want to type them in. In this lab we will just type them in and paste some values

#### 6 - Create a Log Analytics workspace
In the majority of the use cases that we have seen, a Log Analytics workspace is already present and needs to be used by ASC. So your lab will focus on that scenario, although you can create one single ARM template to deploy a new workspace and integrate that with, and configure ASC, however we will not focus on that.<br>
For our lab to work, we are going to create a Log Analytics workspace. You can either create it through the Azure portal, or leverage an ARM template.
1. Navigate to the Azure portal and create a Log Analytics workspace **or**:
2. Use the following PowerShell snippet to deploy an ARM template which will deploy this <a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Files/createNewOmsWorkspace.json" target="_blank">newOmsWorkspace</a> ARM template: <br>
```powershell
$myGuid = New-Guid
New-AzureRmResourceGroup -Name ASClab -Location 'WestEurope'

New-AzureRmResourceGroupDeployment -Name myDeployOMS -ResourceGroupName 'newOMSRG' `
 -TemplateFile 'https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Files/createNewOmsWorkspace.json' `
 -omsWorkspaceName ("ASC-workspace-$myGuid") -omsWorkspaceLocation "WestEurope" -Verbose
```







