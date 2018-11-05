# Policy and Compliance
##### Estimated lab time: minutes
***Note**:*<br>
*Make sure before continuing with this lab that the VM's that you have deployed earlier are showing as "Monitored by Azure Security Center". You can find this setting under **Security Center>Compute & Apps***


This lab covers ASC Policy and Regulatory Compliance and guides you through some preview features.<br>

### 1 - Regulatory Compliance (Preview)
Open a new browser tab/window and copy and paste the following URL in your browser to get access to the Regulatory Compliance preview:

```html
https://aka.ms/AscRegulatoryCompliance
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

