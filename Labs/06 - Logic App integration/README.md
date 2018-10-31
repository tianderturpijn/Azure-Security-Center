# 05 - Logic Apps integration
In this lab you are going to explore the Security Center integration with Logic Apps.<br>
***Note**: More comprehensive guidance can be found* <a href="https://techcommunity.microsoft.com/t5/Security-Identity/Automate-Azure-Security-Center-actions-with-Playbooks-and/td-p/264843" target="_blank">here</a>.

The most asked automation integration use case is how Security Center integrates with ITSM solutions like ServiceNow, so in this lab we are going to explore exactly that integration.<br><br>

#### 1 - Create a ServiceNow developer instance
Skip the following steps if you already have a ServiceNow instance
1. Navigate to the <a href="https://signon.service-now.com/ssoregister.do?redirectUri=https://developer.servicenow.com" target="_blank">ServiceNow developer website</a> and create a developer instance
2. Go through all the steps until you have a developer instance which is active and running
3. Take a note of the following information, because you will need that in the following steps:
- The URL of your developer instance, similar to
```txt
https://dev12345.service-now.com
```
- admin account name & password <br><br>

#### 2 - Create the ServiceNow playbook


1. Navigate to **Security Center>Playbooks** (under Automation & Orchestration)
2. Click on **Add Playbook**
3. Give your playbook a name like "ASC-Alert-To-ServiceNow", choose your **subscription**, create or choose your **resource group**, select a location and click on **Create**
4. When the playbook has been created, select the playbook. This should bring you to the **Logic Apps Designer** (if that does not happen, click on your playbook and click on **Edit**)
5. Under Templates, select the **Blank Logic App**
6. In the **Seach connectors and triggers field**, type in security center and select **When a response to an Azure Security Center alert is triggered** <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/asc_trigger.png)
7. Click on **+ New Step**
8. In the **Seach connectors and triggers field** search for **ServiceNow**
9. Under **Actions**, select **Create Record**<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/ServiceNowConnection.png)
10. Provide a **Connection Name** and fill in the ServiceNow **Instance Name**, **Username** and **Password** that you have captured in the previous steps and click on **Create**
11. Click on Show advanced options
