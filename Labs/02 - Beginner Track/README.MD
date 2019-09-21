# Beginner Track
Welcome to the labs which will guide you through Azure Security Center (ASC). <br>
The labs are intended to make you familiar with the different Security Center's features. <br>

Estimated lab time: 20 minutes
### Exploring the Security Center Overview blade
1. Navigate to the Azure portal (https://portal.azure.com) and click on Security Center
2. In the Overview blade note the **Policy & compliance** section. This provides an overview of your secure score, based on your resources, regulatory standards and your subscription coverage: <br><br>
   ![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_compliancy_tile.png
)<br><br>
3. Click on the **Subscription coverage** tile
   ![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/subscription_coverage.png
)<br>
This shows you the number of subscriptions and the coverage type.<br>
*Note:* in this lab you will only have one subscription which should be under **full coverage** <br>
   This view will help you find subscriptions that are not covered by ASC to help identify "shadow IT" subscriptions <br>
4. Go back to the overview blade and note the **Secure Score** tile under Policy & compliance. When you **click on the Secure Score tile**, you can explore your **Secure score by category** by clicking on each tile:<br><br>
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/secure_score_dashboard.png
)<br><br>

### Security Center Policies
1. In the Security Center Overview, click on **Security policy** and then click on your subscription (Azure Pass):
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting1.png
)<br><br>
This brings you to the **Security policy settings** for your subscription (*note: if your subscription is not showing, refresh your browser*). <br> <br>


2. In the Security Center, Security policy blade, click on the default ASC assignment:
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/AzPolicyAssignment.png
)<br><br>


This brings you to the ASC policy settings - which are Azure policies - where you can set the parameters for each policy definition. This is where you can enable or disable a specific policy definition by clicking on the parameter setting.
 

![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/SystemUpdate2.png
)<br><br>

3. Scroll down to the bottom and click on **Assign** or **Save** to save (save only in case you have made updates) the Policy initiative.

### Edit Subscription settings (including Data Collection settings)
1. Go back to the **Pricing & settings** blade and press on your subscription 
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/pricing%20and%20settings.PNG
)<br><br>
2. Notice the 5 options:
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/datacollection01.PNG
)<br>
The Auto Provisioning settings - if set to On - will take care of automatic installation of the Microsoft Monitoring Agent (MMA) for all VM's in your subscription, either existing or new.<br><br>
**Threat detection** is the new integration with **Microsoft Cloud App Security** (MCAS) and **Windows Defender ATP** (WDATP):
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/threadprotection.PNG
)<br><br>

**Email notifications** allows you to configure one or more email addresses to be used to send high severity alerts.<br><br>

**Pricing Tier** shows you the difference between what's offered in the Free and Standard tier (it should be set to Standard for our labs):<br>
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/pricingtier.PNG
)<br><br>

Notice that there are different pricing plans for **VM's, SQL servers**, **App Services** and **Storage Accounts**:
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting6.png
)<br><br>

### Edit workspace settings (Including Data Collection settings)
1. Go back one more time to the **Pricing & Settings** blade, but this time click on the line where your **workspace** is listed:
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/workspacepricing01.PNG
)<br><br>
This allows you to configure the Windows security events collection settings for your workspace and helps you to perform auditing, investigation and and analysis.<br>
Notice that the options are potentially grayed out.<br>
If so, you first need to set the workspace Pricing tier to Standard.
2. Click on **Pricing tier** and set the pricing tier to **Standard** and click on **Save**
3. Click on **Data collection**, you should now be able to configure the Windows security events collection
4. Set the collection to **All Events** and click on **Save**
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting8.png
)<br><br>

**Note:**
You don't have to change the setting **None** to receive alerts in Security Center, change this setting only if you want to do investigations and analysis of your threats in Log Analytics.

### Secure Score and "One Click Fix it".
In the beginning of this lab, you explored briefly the **Secure Score** tile. Let's look a little bit deeper into it. <br>
Security Center mimics the work of the security analyst, reviewing your security recommendations and applying advanced algorithms to determine how crucial each recommendation is.

1. Go to the Security Center Overview blade
2. Click on the **Secure score** tile and then under **Secure score by category** click on **Compute & apps**
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/secure_score_dashboard.png
)<br><br>
3. Observe the number under the **Secure score impact column** and the affected **Resource** column. This helps in prioritizing working on the recommendations, the higher the number, the greater the impact <br><br>
4. Click on  **recommendation**, and notice that on one of the recoemdnation we added the option to **1-Click-Fix**
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/SotrageFixIT.png)<br><br>

One-click fix enables you to remediate a recommendation on a bulk of resources, with a single click. It is an option only available for specific recommendations. One-click fix simplifies remediation and enables you to quickly improve your secure score and increase the security in your environment.

5. Click on **Secure transfer to storage accounts should be enabled** recommendation.
Notice for the Secure Score impact :<br><br>
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/storageScore.png
)<br><br>

6. We also presnt the remidation logic (ARM teamplte Artifact or the REST API call), press on the the **remidation logic**
and review the properties that is going to fix.

![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/remediationLogic.png
)<br><br

7. Select the storage account and press **Remediate**.

![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/StorageRemi.png
)<br><br>

Provide your settings of choice, then click **OK**, this starts the endpoint protection installation.

Another example which might not exist in your lab environment is a recommendation for containers:<br><br>:
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/02%20-%20Beginner%20Track/Screenshots/secure_score3.png
)<br><br>

The example above is based on Container security monitoring (you have a lab that deploys a docker container). It shows the **Recommendation impact**, the **Threats** found and the **Remediation steps**

### Continue with the next lab
03 - Policy and Compliance, click <a href="https://github.com/yaniv-shasha/Azure-Security-Center-1/tree/master/Labs/03%20-%20Policy%20and%20Compliance" target="_blank">here</a>
