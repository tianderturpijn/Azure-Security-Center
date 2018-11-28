# Beginner Track
Welcome to the labs which will guide you through Azure Security Center (ASC). <br>
The labs are intended to make you familiar with the different Security Center's features. <br>

### Exploring the Security Center Overview blade
1. Navigate to the Azure portal (https://portal.azure.com) and click on Security Center
2. In the Overview blade note the **Policy & compliance** section. This provides an overview of the number of subscriptions and resources which are monitored by ASC
3. Click on the **Subscription coverage** tile
   ![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/subscription_coverage.png
)<br>
4. This shows you the number of subscriptions and the coverage type.<br>
*Note:* in this lab you will only have one subscription which should be under **Standard coverage** <br>
   This view will help you find subscriptions that are not covered by ASC to help identify "shadow IT" subscriptions <br>
5. Go back to the overview blade and note the **Policy compliance** tile
6. Policy compliance provides a quick view of your overall policy compliance, which is calculated based on Security Center’s best practices. It highlights subscriptions with the least compliant resources. 
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_compliance.png
)<br>
7. Click on the **Policy compliance** tile
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_management_details.png
)<br>
8. Notice the following columns:<br>
**Policy Initiative Assignment** – Security Center built-in policies and initiatives that are assigned to a subscription or management group.<br>
**Compliance** – Overall compliance score for a management group, subscription, or workspace. The score is the weighted average of the assignments. The weighted average factors in the number of policies in a single assignment and the number of resources the assignment applies to.<br><br>
**Calculation example**, if your subscription has two VMs and an initiative with five policies assigned to it, then you have 10 assessments in your subscription. If one of the VMs doesn't comply to two of the policies, then the overall compliance score of your subscription’s assignment is 80%.

### Security Center Policies
While still in the **Policy Management** blade, click on your subscription (Azure Pass):
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting1.png
)<br><br>
This brings you to the **Security policy settings** for your subscription (if the subscription is not showing, refresh your browser):  <br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting2.png
)<br>
Notice the alignment with **Azure Policy**. The policies are therefore read-only in this view and need to be configured in the Azure Policy blade.

### Edit Subscription settings (including Data Collection settings)
1. Go back to the **Security Policy** blade and under **Policy Management** click on **Edit settings:**
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/subscription_settings.png
)<br><br>
2. Notice the 4 options:
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting3.png
)<br>
The Auto Provisioning settings - if set to On - will take care of automatic installation of the Microsoft Monitoring Agent (MMA) for all VM's in your subscription, either existing or new.<br><br>
**Threat detection** is the new integration with **Microsoft Cloud App Security** (MCAS) and **Windows Defender ATP** (WDATP):
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting4.png
)<br><br>

**Email notifications** allows you to configure one or more email addresses to be used to send high severity alerts.<br><br>

**Pricing Tier** shows you the difference between what's offered in the Free and Standard tier (it should be set to Standard for our labs):<br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting5.png
)<br><br>

Notice that there are different pricing plans for **VM's, SQL servers** and **App Services**:
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting6.png
)<br><br>

### Edit workspace settings (Including Data Collection settings)
1. Go back one more time to the **Security policy** blade, but this time click on **Edit settings** on the line where your **workspace** is listed:
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting7.png
)<br><br>
This allows you to configure the Windows security events collection settings for your workspace and helps you to perform auditing, investigation and and analysis.<br>
Notice that the options are potentially grayed out.<br>
If so, you first need to set the workspace Pricing tier to Standard.
2. Click on **Pricing tier** and set the pricing tier to **Standard** and click on **Save**
3. Click on **Data collection**, you should now be able to configure the Windows security events collection
4. Set the collection to **All Events** and click on **Save**
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/policy_setting8.png
)<br><br>

**Note:**
You don't have to change the setting **None** to receive alerts in Security Center, change this setting only if you want to do investigations and analysis of your threats in Log Analytics.

### Secure Score
Security Center mimics the work of the security analyst, reviewing your security recommendations and applying advanced algorithms to determine how crucial each recommendation is.

1. Go to the Security Center Overview blade
2. Under Resource security hygiene, observe the Secure score tile
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/secure_score1.png
)<br><br>
3. Click on the Secure score tile
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/secure_score2.png
)<br><br>
4. Observe to the number under the **Secure score impact column** and the affected **Resource** column. This helps in prioritizing working on the recommendations, the higher the number, the greater the impact <br><br>
5. Click on a recommendation
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/secure_score3.png
)<br><br>

The example above is based on Container security monitoring (you have a lab that deploys a docker container). It shows the **Recommendation impact**, the **Threats** found and the **Remediation steps**

### Explore the recommendations
1. From Security Center **Overview** blade, under **Resource Security Hygiene**, you can also select recommendations per resource type: <br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/recommendations.png
)<br><br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/recommendations2.png
)<br><br>

2. Explore the different recommendations and remediation steps, for example for your Win-0 and disk encryption:<br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/apply_diskencryption.png
)<br><br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/02%20-%20Beginner%20Track/Screenshots/apply_diskencryption2.png
)<br><br>

### Continue with the next lab
03 - Policy and Compliance, click <a href="https://github.com/tianderturpijn/Azure-Security-Center/tree/master/Labs/03%20-%20Policy%20and%20Compliance" target="_blank">here</a>
