# Automation with PowerShell

##### Estimated lab time: 15 minutes
In this lab you are going to explore what the ASC automation options with PowerShell are.

#### Requirements
You have received an Azure pass or you have a test environment available. Please don't use these lab exercises in a production environment (or at your own risk) <br>

For using these labs in combination with Labs On Demand (LOD), open an incognito/in-private browser session on your laptop and login to the Azure portal leveraging the LOD account (like for example admin@ems123456.onmicrosoft.com)<br>

## 01 - AzureRm PowerShell cmdlets installation
1. Navigate to the Azure portal and click on **Virtual machines**
2. Click on your Windows virtual machine (**Win-0**)
3. Under **Overview** copy the **Public IP address** of your VM
4. Start a remote desktop session (RDP) and login to your VM, note: your default administrator account is is **azureadmin** (unless you have configured an other one)
5. Open an administrator PowerShell session
5. Install the AzureRm modules by typing in ***Install-Module -Name AzureRM -Verbose***

## 02 - Security Center PowerShell cmdlets installation
Security Center provides automation support through PowerShell as well.<br>
The ASC PowerShell cmdlets can be downloaded from <a href="https://www.powershellgallery.com/packages/AzureRM.Security/0.2.0-preview" target="_blank">here</a>.<br>

**Install the Security Center cmdlets in the Azure VM Win-0**<br>
*The ASC cmdlets are in preview. It is recommended to install the ASC cmdlets in the Windows VM (like Win-0) that you have deployed earlier in your lab environment to avoid conflicts which might occur on your system.*

In the same administrator PowerShell session which you have already open on the Win-0 VM, install the ASC cmdlets by typing in the following commands and confirm all with "**yes**" if prompted:<br>

***Tip**: copy and paste the script below in a PowerShell ISE administrator session* <br>
**Important**: Before executing the last step, make sure that you close the PowerShell session and open a new one

```powershell
#Install NuGet
Install-Module -Name PowerShellGet -Force -Verbose 

#Install AzureRm.Profile
Install-Module -name AzureRM.Profile -Force -Verbose 

#Update the modules to ensure you have the latest versions
Update-Module PowerShellGet -Force -Verbose
Update-Module AzureRM.Profile -Force -Verbose

#Important: close your PowerShell session and open a new one

# Install the AzureRm.Security module
Install-Module -Name AzureRM.Security -AllowPrerelease -Verbose
```

### 03 - Exploring the Security Center cmdlets
***Assumptions**:<br>
You have installed the AzureRm and Security Center PowerShell cmdlets, as mentioned in the beginning of this lab* <br>

Open on the **Win-0** VM an administrator PowerShell session.<br>
Explore the Security Center cmdlets by executing:
```powershell
Get-Command -Module AzureRm.Security
```
#### 1 - Configuring email settings
***Note**: make sure that in your favorite PowerShell editor, you are logged into Azure (using Login-AzureRmAccount)*<br>

In the previous exercise we have configured the email notifications through ARM, let's now explore how to configure email settings through PowerShell.<br>
Copy and paste the following script in your PowerShell editor:
```powershell
#Set a security contact for the current scope. For the parameter "-Name", you need to use "default1", "default2", etc.

Set-AzureRmSecurityContact  -Name "default1" -Email "vader@empire.com" -Phone "12345" -AlertAdmin -NotifyOnAlert
```
#### 2 - Check the new email settings:
Run the following command:
```powershell
Get-AzureRmSecurityContact
```

### 04 - Auto Provisioning settings
ASC's Auto Provisioning settings set to On will install the MMA VM extension automatically. Some customers prefer that to happen automatically, some customers like to control that.<br>

#### 1 - Get the current Auto Provisioning settings
To retrieve the current Auto Provisioning settings, run the following:
```powershell
Get-AzureRmSecurityAutoProvisioningSetting
```
<br>

#### 2 - Set Auto Provisioning to On

Enable automatic MMA VM extension installation:
```powershell
Set-AzureRmSecurityAutoProvisioningSetting -Name "default" -EnableAutoProvision
```

#### 3 - Set Auto Provisioning to Off

Disable automatic MMA VM extension installation:
```powershell
Set-AzureRmSecurityAutoProvisioningSetting -Name "default"
```

A sample which contains how to use the AzureRm.Security module can be found <a href="https://github.com/tianderturpijn/ASC/blob/master/PowerShell/Samples/ASC-Samples.ps1" target="_blank">here</a>. <br><br>
*In a later lab we will test drive how to configure Just-In-Time (JIT) with PowerShell.* <br><br>







