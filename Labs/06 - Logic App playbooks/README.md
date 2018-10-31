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
```powershell
https://dev12345.service-now.com
```

- admin account name & password <br><br>

#### 2 - Create the ServiceNow playbook


1. Navigate to **Security Center>Playbooks** (under Automation & Orchestration)
2. Click on **Add Playbook**
3. Give your playbook a name like "ASC-Alert-To-ServiceNow"
4. When the playbook has been created, click on **Edit** in the overview blade
5. 