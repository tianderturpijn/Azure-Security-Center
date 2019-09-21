# 03 - Policy and Compliance
##### Estimated lab time: 10 minutes

This lab covers ASC Policy and Regulatory Compliance and guides you through the features.<br>

### Regulatory Compliance
From the Azure Security Center **Overview** blade, click on the **Regulatory compliance** tile: <br><br>
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/policy_compliance_dashboard.png
)<br><br>

Explore the different Compliance Controls for every Regulatory Compliance: <br>

![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/policy_complince_new.png
)<br><br>


You can press on the menu bar and see Azure security center controls that map to each standard:
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/stand_drill.png
)<br><br>


The reasons for the greyed out control is:
1. Azure security center is still don't support this control.
2. The control is not something that can be tracked by security product(we are planning to add a way for adding evidence link that can present to the auditor).<br><br>


Regulatory compliance allows you to export the compliance results into a **PDF report** that you can presnt to the auditor.

Press on the **Download report**
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/downloadreport.PNG
)<br><br>

* On the right pane open the drop-down menu and view all the standard that we support.
Select **ISO 27001** and press **download**.

![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/export_report_new.png
)<br><br>

* Review the reprot and the complaince status.


### Policy Management
This exercise guides you through the current Security Center policies, based on Azure Policy, and shows you where to enable or disable Security Center polices. <br>

***Note**: at this time we only support out-of-the-box Security Center policies. Support for custom policies is coming in the near future*

1. Within the Azure portal, navigate to the **Policy** blade <br>
*Note: when you can't find Policy, click in the search bar on top of the Azure portal and search for **Policy**:*
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/search_policy.png
)<br><br>

2. Click on **Assignments** (under **Authoring**)
3. Notice the ~70 (or more, this is work in progress) policy definitions under the **ASC Default** initiative. Click on the initiative:<br><br>
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/policy_assignment.png
)<br><br>
4. Clicking on the initiative allows you to disable the definition:
![alt text](https://raw.githubusercontent.com/yaniv-shasha/Azure-Security-Center-1/master/Labs/03%20-%20Policy%20and%20Compliance/Screenshots/disable_definition.png
)<br><br>

5. It can take up to 12 hr' till the recommendation remove from Azure security Center Dashboard.


*Note: in the near future we will provide custom policies which will support deployIfNotExists type of policies*



### Continue with the next lab
04 - VM Protection with JIT, click <a href="https://github.com/yaniv-shasha/Azure-Security-Center-1/tree/master/Labs/04%20-%20VM%20Protection%20with%20JIT" target="_blank">here</a>