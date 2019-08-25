# 08 - Automation with PowerShell

##### Estimated lab time: 15 minutes
In this lab you are going to explore what the ASC automation options with PowerShell are.

#### Requirements
You have received an Azure pass or you have a test environment available. Please don't use these lab exercises in a production environment (or at your own risk) <br>

For using these labs in combination with Labs On Demand (LOD), open an incognito/in-private browser session on your laptop and login to the Azure portal leveraging the LOD account (like for example admin@ems123456.onmicrosoft.com)<br>

## Az module PowerShell installation
1. Navigate to the Azure portal and click on **Virtual machines**
2. Click on your Windows virtual machine (**Win-0**)
3. Under **Overview** copy the **Public IP address** of your VM
4. Start a remote desktop session (RDP) and login to your VM, note: your default administrator account is is **azureadmin** (unless you have configured an other one)
5. Open an administrator PowerShell session
5. Install the Azure Az module by typing in ***Install-Module -Name Az -AllowClobber -Verbose***, click on **Y** or **A** to allow the installation to continue and complete.

## Install the Azure Security Center module
To install the Security Center module type the following:<br>
```powershell
Install-Module -Name Az.Security -AllowClobber -Verbose
```
click on **Y** or **A** to allow the installation to continue and complete.

## Exploring the Security Center cmdlets
Open on the **Win-0** VM an administrator PowerShell session.<br>
Explore the Security Center cmdlets by executing:
```powershell
Get-Command -Module Az.Security
```
#### Configuring email settings
***Note**: make sure that in your favorite PowerShell editor, you are logged into Azure (using Connect-AzAccount)*<br>

let's now explore how to configure ASC's email notification settings through PowerShell.<br>
Beforee we run the commands, we need to do some house keeping in the server.

1. Disable IE Enhanced Security 

![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/08%20-%20Automation%20with%20PowerShell/IE.png)

2. Run and login with your Azure Pass Account

```powershell
Connect-AzAccount
```
Copy and paste the following script in your PowerShell editor:
```powershell
#Set a security contact for the current scope. For the parameter "-Name", you need to use "default1", "default2", etc.

Set-AzSecurityContact  -Name "default1" -Email "vader@empire.com" -Phone "12345" -AlertAdmin -NotifyOnAlert
```
#### Check the new email settings:
Run the following command:
```powershell
Get-AzSecurityContact
```

### Auto Provisioning settings
ASC's Auto Provisioning settings set to On will install the MMA VM extension automatically. Some customers prefer that to happen automatically, some customers like to control that.<br>

#### Get the current Auto Provisioning settings
To retrieve the current Auto Provisioning settings, run the following:
```powershell
Get-AzSecurityAutoProvisioningSetting
```
<br>

#### Set Auto Provisioning to On

Enable automatic MMA VM extension installation:
```powershell
Set-AzSecurityAutoProvisioningSetting -Name "default" -EnableAutoProvision
```

#### Set Auto Provisioning to Off

Disable automatic MMA VM extension installation:
```powershell
Set-AzSecurityAutoProvisioningSetting -Name "default"
```

A sample which contains how to use the Az.Security module can be found <a href="https://github.com/tianderturpijn/ASC/blob/master/PowerShell/Samples/ASC-Samples.ps1" target="_blank">here</a>. <br><br>
<br>

### Continue with the next lab
09 - Automation with ARM, click <a href="https://github.com/yaniv-shasha/Azure-Security-Center-1/tree/master/Labs/09%20-%20Automation%20with%20ARM" target="_blank">here</a>





