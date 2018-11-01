# 05 - Logic Apps integration
##### Estimated lab time: 
In this lab you are going to explore the Security Center integration with Logic Apps.<br>
***Note**: More comprehensive guidance can be found* <a href="https://techcommunity.microsoft.com/t5/Security-Identity/Automate-Azure-Security-Center-actions-with-Playbooks-and/td-p/264843" target="_blank">here</a>.

The most asked automation integration use case is how Security Center integrates with ITSM solutions like ServiceNow, so in this lab we are going to explore exactly that integration.<br><br>

#### 1 - Create an ASC test alert
Before you are going to create the playbook, let's make sure that we have an ASC alert we can act upon.
1. Login to your Windows VM that you have created earlier and is monitored by Security Center
2. Create a temp folder on c: (c:\temp)
3. Copy **calc.exe** from **c:\windows\system32** to **c:\temp**
4. Rename **calc.exe** to **ASC_AlertTest_662jfi039N.exe**
5. Open a command prompt and execute this file as follows (this will generate an ASC test alert):
```dos
ASC_AlertTest_662jfi039N.exe -foo
```

6. Close the calculator window

#### 2 - Create a ServiceNow developer instance
Skip the following steps if you already have a ServiceNow instance
1. Navigate to the <a href="https://signon.service-now.com/ssoregister.do?redirectUri=https://developer.servicenow.com" target="_blank">ServiceNow developer website</a> and create a developer instance
2. Go through all the steps until you have a developer instance which is active and running
3. Take a note of the following information, because you will need that in the following steps:
- The URL of your developer instance, similar to
```txt
https://dev12345.service-now.com
```
- admin account name & password <br><br>

#### 3 - Create the ServiceNow playbook


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
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/ServiceNowConnection.png)<br><br>
10. Provide a **Connection Name** and fill in the ServiceNow **Instance Name**, **Username** and **Password** that you have captured in the previous steps and click on **Create**
11. Click on **Show advanced options**, as shown below:<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/snow_advanced_options.png)<br><br>
12. Under **Record Type** dropdown box, select **Incident** (this collapses the incident options)
13. In the **Record fields**, scroll down, click once in the fields highlighted below and select the values as shown below:<br><br> 
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/incident_fields.png)<br><br>
14. Click on **Save**

#### 4 - Invoke the ServiceNow playbook from an ASC alert
1. Navigate to **Security Center>Security Alerts**
2. Look for the Azure Security Center test alert and click on it<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/test_alert.png)
3. Under Attacked Resource, click on your VM
4. On the bottom of the alert properties, click on **View playbooks**<br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/view_playbooks_button.png)

5. Click on **Run playbook**<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/run_playbook.png)
6. Switch to the playbook history and notice the status, but you can also click on the playbook to see details and even runtime information <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/playbook_history.png) <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/playbook_history_details.png)<br><br>




7. Switch to your ServiceNow developer instance and check for a new created incident record<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/06%20-%20Logic%20App%20integration/Screenshots/snow_record.png)


