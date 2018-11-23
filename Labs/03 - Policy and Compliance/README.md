# 03 - Policy and Compliance
##### Estimated lab time: 10 minutes

This lab covers ASC Policy and Regulatory Compliance and guides you through some preview features.<br>

### 1 - Regulatory Compliance (Preview)
Open a new browser tab/window and copy and paste the following URL in your browser to get access to the Regulatory Compliance preview:

```txt
Ask your instructor for the link
```
<br>

1. Navigate to the **Security Center** blade
2. Click on **Regulatory Compliance**

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/regulatoryblade.png
)<br>

3. Explore the different regulations (like Azure CIS)
4. Click on the different assessments

#### Remediate PCI DSS 3.2
This exercise remediates a failed assessment for PCI DSS 3.2
1. Click on the **PCI DSS 3.2** tab
2. Under the **Assessment** column, notice that you have a **Enable Network Security Groups on subnets** failed assessment

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/nsg_assessment.png
)<br>

1. Click on the Assessment
2. This shows you which subnet is at risk (subnet01), click on the subnet
3. Remediate the failed assessment by clicking on **Create new**
4. Give your new Network Security Group (NSG) a name and click on **OK** This adds a new NSG
5. This will resolve your failed assessment on the next scan

### 2 - Policy Management
This exercise guides you through the current Security Center policies and is intended for exploration purposes only. <br>

***Note**: at this time we only support out-of-the-box Security Center policies. Support for custom policies is coming in the near future*

1. Within the Azure portal, navigate to the **Policy** blade
2. Click on **Definitions** (under Authoring)
3. Under **Categories**, deselect all the categories and select only **Security Center** <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/asc_policies.png
)<br>

4. Explore the policies by clicking on them
5. Notice the different icons as shown below, they represent a **Policy** and an **Initiative** (group of policies): <br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/initiative.png
) <br><br>

6. Click on each of those to explore the difference

### Continue with the next lab
04 - VM Protection with JIT, click <a href="https://github.com/tianderturpijn/Azure-Security-Center/tree/master/Labs/04%20-%20VM%20Protection%20with%20JIT" target="_blank">here</a>