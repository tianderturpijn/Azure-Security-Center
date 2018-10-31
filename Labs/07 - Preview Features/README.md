# 06 - Preview Features
This optional lab points you to a number of preview features for you to explore

#### 1 - Container Security Monitoring
*Note: This exercise also shows you how to use Azure CLI straight from the Azure portal*

1. In the Azure portal click on the **Cloud Shell** icon in the upper right, next to your account, as shown below <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//01%20-%20Automation/Screenshots/Azure_cli.png
) <br><br>
2. This creates a cloud shell session: <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//01%20-%20Automation/Screenshots/bash_cloudshell.png
) <br><br>

3. Create a new resource group for your container by typing in the following (replace **myResourceGroup** with your name of choice)
```text
az group create --name <myResourceGroup> --location eastus
```
<br>
4. The following command creates a **Docker** container with a small web app written in Node.js <br>

```txt
az container create --resource-group <yourResourceGroupName> --name <yourContainerName> --image microsoft/aci-helloworld --dns-name-label <yourDnsLabel> --ports 80
```
5. Wait for the container to be deployed




