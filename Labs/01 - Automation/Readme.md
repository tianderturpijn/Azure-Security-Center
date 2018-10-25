# ASC Automation & Configuration

In this lab we are going to explore what the ASC automation and deployment options are.

We will configure ASC with:
1. ARM Templates
2. PowerShell

 
### ARM Template deployment
#### 01 - Explore the ASC settings in the portal
1. Open a browser and login to the  <a href="https://portal.azure.com" target="_blank">Azure Portal</a>
2. Click on **Security Center**
3. Click on **Security Policy**
4. On the line where it shows your subscription, click on **Edit settings**
5. Explore the available settings

For the ARM deployment lab we are going to start with the **Email notification** settings

#### 02 - Explore the Email Notifications ARM template
1. Open the <a href="https://github.com/tianderturpijn/Azure-Security-Center/blob/master/Labs/01%20-%20Automation/Files/configureAscEmailNotifications.json" target="_blank">ARM template</a> for email notifiations
2. Notice the ARM template parameter allowed values. These values are case sensitive and are mandatory.
3. Under the ARM resources (securityContacts), use "default1", "default2", etc. as the name. These are mandatory fields and can only be used in this format

#### 03 - Deploy the Email Notifications ARM template
**Assumptions**: You have installed the AzureRm PowerShell modules on your system.<br> If not, install those using *Install-Module -Name AzureRM*
1. Open your favorite PowerShell editor
2. Login to the Azure Portal by using **Login-AzureRmAccount**
3. Make sure that you have selected your Azure subscription which has been provided to you by using **Select-AzureRmSubscription**<br>
4. ASC resides at the subscription level, so we are going to target our ARM template deployment to the same level (instead of deploying at the resource group level)
5. Type the following command New-AzureRmDeployment
5. 

