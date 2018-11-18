# Beginner Track
Welcome to the labs which will guide you through Azure Security Center (ASC). <br>
The labs are intended to make you familiar with the different blades and Security Center's features. <br><br>

### Exploring the Security Center Overview blade
1. Navigate to the Azure portal (https://portal.azure.com) and click on Security Center
2. In the Overview blade note the **Policy & compliance** section. This provides an overview of the number of subscriptions and resources which are monitored by ASC
3. Click on the **Subscription coverage** tile
   ![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/A%20-%20Beginner%20Track/Screenshots/subscription_coverage.png
)<br>
4. This shows you the number of subscriptions and the coverage type. *Note:* in this lab you will only have one subscription which should be under **Standard coverage** <br>
   This view will help you find subscriptions that are not covered by ASC to help identify "shadow IT" subscriptions <br>
5. Go back to the overview blade and note the **Policy compliance** tile
6. Policy compliance provides a quick view of your overall policy compliance, which is calculated based on Security Center’s best practices. It highlights subscriptions with the least compliant resources. 
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/A%20-%20Beginner%20Track/Screenshots/policy_compliance.png
)<br>
7. Click on the **Policy compliance** tile
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/A%20-%20Beginner%20Track/Screenshots/policy_management_details.png
)<br>
8. Notice the following columns:<br>
**Policy Initiative Assignment** – Security Center built-in policies and initiatives that are assigned to a subscription or management group.<br>
**Compliance** – Overall compliance score for a management group, subscription, or workspace. The score is the weighted average of the assignments. The weighted average factors in the number of policies in a single assignment and the number of resources the assignment applies to.<br><br>
**Calculation example**, if your subscription has two VMs and an initiative with five policies assigned to it, then you have 10 assessments in your subscription. If one of the VMs doesn't comply to two of the policies, then the overall compliance score of your subscription’s assignment is 80%.

## Work in progress...
