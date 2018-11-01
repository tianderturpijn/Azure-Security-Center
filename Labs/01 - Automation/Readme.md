# ASC Automation & Configuration

##### Estimated lab time: 
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
5. Explore the settings, specifically the **email notification settings**.<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//01%20-%20Automation/Screenshots/asc_emailsettings.png
)

For the first ARM deployment exercise we are going to start with configuring the **Email notification** settings

#### 2 - Explore the Email Notifications ARM template
1. Open the <a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Files/configureAscEmailNotifications.json" target="_blank">ARM template</a> for email notifications in a new browser window
2. Notice the ARM template **parameter** allowed values. These values are case sensitive and are mandatory.
3. Under the ARM resources section  (**Microsoft.Security/securityContacts**), use "default1", "default2", etc. as value for the field name. These are mandatory fields and can only be used in this format

#### 3 - Deploy the Email Notifications ARM template
**Assumptions**: You have installed the AzureRm PowerShell modules on your system.<br> If not, install those in a PowerShell session using ***Install-Module -Name AzureRM***
1. Open your favorite PowerShell editor
2. Login to the Azure Portal by using **Login-AzureRmAccount**
3. Make sure that you have selected your Azure subscription which has been provided to you by using **Select-AzureRmSubscription**<br>
4. ASC resides at the subscription level, so we are going to target our ARM template deployment at the same level (instead of deploying it at the resource group level)
5. The syntax is *New-AzureRmDeployment -TemplateFile* `yourArmTemplateFile` (note: we are going to use a prepared ARM template JSON file)
6. Copy and paste the following in your PowerShell session and execute it:
```powershell
New-AzureRmDeployment -TemplateFile 'https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Files/configureAscEmailNotifications.json'
```

7. After a successful completion, switch to the Azure portal and refresh the ASC blade and verify that the email settings have been updated according to the values in the template.
8. Optional exercise: you can copy the template and use your own values

#### 4 - Deploy a more complex ASC configuration ARM template
Now that you have explored how to deploy an ARM template to configure an ASC setting, you are going to explore how to deploy a more complex ARM template. <br>
ASC stores MMA collected data (and more) in a Log Analytics workspace. In a more complex environment, you often will find an existing Log Analytics workspace which needs to be integrated with ASC (aka the Central Workspace scenario).<br><br>
The following lab assumes that a (Central) Log Analytics workspace already exists (although this can be deployed with an ARM template at the same time) and you are going to configure ASC to use the existing Log Analytics workspace. In addition we are going to enable **Auto Provisioning** which will deploy the MMA extension automatically, as you would configure it in the portal, like this:<br><br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Screenshots/autoProvisioning_custom_%20Workspace.png)

Also we will configure ASC policies through the ARM template.

#### 5 - Explore the ASC advanced ARM template
1. Open the <a href="https://github.com/tianderturpijn/Azure-Security-Center/blob/master/Labs/01%20-%20Automation/Files/configureAscAdvanced.json" target="_blank">ASC Advanced ARM template</a> in a new browser window and explore it.
2. Look closely at the **parameters** and their allowed values
3. Under **resources**, observe the several settings that we will configure like autoProvisioning, workspace settings, etc. The recommendation policies can be configured one by one, but in this lab we will set the value to **On** or **Off** for all of them.
4. For ARM templates, it is recommended that you use a parameter file to pass values during a deployment if you don't want to type them in. In this lab we will just type them in and paste some values

#### 6 - Create a Log Analytics workspace
In the majority of the use cases that we have seen, a Log Analytics workspace is already present and needs to be integrated with ASC. So your lab will focus on that scenario, although you can create one single ARM template to deploy a new workspace and integrate and configure ASC in one deployment. In this lab we will not focus on that.<br>
For our lab to work, we are going to create a Log Analytics workspace. You can either create it through the Azure portal, or leverage an ARM template.
1. Navigate to the Azure portal and create a Log Analytics workspace **or**:
2. Copy, paste and run the following PowerShell script to deploy an ARM template which will deploy the <a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Files/createNewOmsWorkspace.json" target="_blank">newOmsWorkspace</a> ARM template: (optionally you can use your own values in the script below) <br>
```powershell
$myGuid = New-Guid
$RG = New-AzureRmResourceGroup -Name 'ASC-Lab' -Location 'eastus'

New-AzureRmResourceGroupDeployment -Name myWorkspaceDeploy -ResourceGroupName $RG.ResourceGroupName `
 -TemplateFile 'https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Files/createNewOmsWorkspace.json' `
 -omsWorkspaceName ("ASC-workspace-$myGuid") -omsWorkspaceLocation "eastus" -Verbose
```
3. Switch to the Azure portal and open the **Security Center** blade
4. Click on **Security policy**
5. Your new created workspace should be listed under the **Policy Management** view <br><br>

#### 7 - Change the Pricing tier and data collection settings of your workspace 
Since you can set the pricing tier and data collection settings per workspace, which is often not clear to customers, we are going to set it in the portal instead of through automation (although you can automate it)
1. In the Policy Management view where your workspace is listed, click on Edit settings
2. Click on **Pricing tier** and note that by default it is set to **Free**
3. Click on **Standard** and click on **Save**
4. Click on Data collection
5. Under Windows security events, select All events
6. Click on Save

#### Bla
6. Since you can now use ASC free or standard at the workspace level
4. Switch to the Azure portal and verify if the Log Analytics workspace has been created successfully.
4. Open the properties of the new created workspace, take a note of the **resourceGroup** name, click on **Advanced settings** and also make a note of the **workspaceID** and the **primaryKey**, since you need those 3 values for the next lab

#### 7 - Deploy the ASC advanced ARM Template
Now that you have created a workspace, we are going to deploy an ARM template which will configure a number of settings and you will connect ASC with the workspace we have created in the previous step.<br>
1. Switch to the PowerShell session where you are logged into Azure, with the correct subscription selected and copy & paste the following:
```powershell
New-AzureRmDeployment -TemplateFile 'https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/01%20-%20Automation/Files/configureAscAdvanced.json' `
-name 'AscAdvancedDeployment' -Location '<yourLocation>' -autoProvisioning 'On' -workspaceName '<yourWorkspaceName>' `
-workspaceSubscriptionId '<yourAzuresubscriptionID>' -workspaceResourceGroup '<resourceGroupNameOfTheWorkspace>' `
-emailSecurityContact 'john@contoso.com' -phoneSecurityContact '12345' -alertNotifications 'On' -alertsToAdmin 'On' `
-securitySettings 'On'
```
*Note: it might take a couple minutes for the Azure portal to catch up and show your updated settings (like autoProvision)*

#### 8 - ASC PowerShell cmdlets
The ASC PowerShell cmdlets can be downloaded from <a href="https://www.powershellgallery.com/packages/AzureRM.Security/0.2.0-preview" target="_blank">here</a>.<br>
Install the cmdlets by typing in a PowerShell window:
```powershell
Install-Module -Name AzureRM.Security -AllowPrerelease
```
1. When you have installed the AzureRm.Security module, explore the cmdlets by executing:
```powershell
Get-Command -Module AzureRm.Security
```
2. Configure the ASC security contact by executing:
```powershell
#Set a security contact for the current scope. For the parameter "-Name", you need to use "default1", "default2", etc.

Set-AzureRmSecurityContact  -Name "default1" -Email "john@johndoe.com" -Phone "12345" -AlertAdmin -NotifyOnAlert
```
3. Check the new security contact settings:
```powershell
Get-AzureRmSecurityContact
```

4. Configure Auto Provisioning settings by executing:
```powershell
Set-AzureRmSecurityAutoProvisioningSetting -Name "default" -EnableAutoProvision
```
5. Check the Auto Provisioning settings:
```powershell
Get-AzureRmSecurityAutoProvisioningSetting
```
<br>

A sample which contains how to use the AzureRm.Security module can be found <a href="https://github.com/tianderturpijn/ASC/blob/master/PowerShell/Samples/ASC-Samples.ps1" target="_blank">here</a>. <br><br>
*In a later lab we will test drive how to configure Just-In-Time (JIT) with PowerShell.*







