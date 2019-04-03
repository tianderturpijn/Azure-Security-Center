# 03 - Policy and Compliance
##### Estimated lab time: 10 minutes

This lab covers ASC Policy and Regulatory Compliance and guides you through the features.<br>

### Regulatory Compliance
From the Azure Security Center **Overview** blade, click on the **Regulatory compliance** tile: <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/policy_compliance_dashboard.png
)<br><br>

Explore the different Compliance Controls for every Regulatory Compliance: <br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/policy_compliance_details.png
)<br><br>

When you click on **All** you will see an overview of all the Regulatory Compliance controls per subscription:
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/policy_compliance_all.png
)<br><br>

### Policy Management
This exercise guides you through the current Security Center policies, based on Azure Policy, and shows you where to enable or disable Security Center polices. <br>

***Note**: at this time we only support out-of-the-box Security Center policies. Support for custom policies is coming in the near future*

1. Within the Azure portal, navigate to the **Policy** blade <br>
*Note: when you can't find Policy, click in the search bar on top of the Azure portal and search for **Policy**:*
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/search_policy.png
)<br><br>

2. Click on **Assignments** (under Authoring)
3. Notice the 80 policy definitions under that initiative. Click on the **[Preview]: Enable Monitoring in Azure Security Center** initiative:<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/policy_assignment.png
)<br><br>
4. Clicking on the initiative allows you to disable the definition:
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/disable_definition.png
)<br><br>

*Note: in the near future we will provide custom policies which will support deployIfNotExists type of policies*



### Continue with the next lab
04 - VM Protection with JIT, click <a href="https://github.com/tianderturpijn/Azure-Security-Center/tree/master/Labs/04%20-%20VM%20Protection%20with%20JIT" target="_blank">here</a>