# Preview Features
##### Estimated lab time: 15 minutes
This optional lab points you to a number of preview features for you to explore.

#### 1 - Container Security Monitoring
*Note: This exercise also shows you how to use Azure CLI straight from the Azure portal*

1. In the Azure portal click on the **Cloud Shell** icon in the upper right, next to your account, as shown below <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//07%20-%20Preview%20Features/Screenshots/Azure_cli.png
) <br><br>

2. If you are prompted for selecting Bash or PowerShell, select **Bash**
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//07%20-%20Preview%20Features/Screenshots/bash_selection.png
) <br><br>

3. If you are receiving a message that you have no storage mounted, click on **Create storage**
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//07%20-%20Preview%20Features/Screenshots/create_storage.png
) <br><br>

4. This creates a cloud shell session: <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//07%20-%20Preview%20Features/Screenshots/bash_cloudshell.png
) <br><br>

5. Create a new resource group for your container by typing in the following (replace **myResourceGroup** with your name of choice)
```text
az group create --name <myResourceGroup> --location eastus
```
<br>

6. The following command creates a Docker container with a small web app written in Node.js <br>
***Note***: The container name must be in **lowercase**

```txt
az container create --resource-group <yourResourceGroupName> --name <yourContainerName> --image microsoft/aci-helloworld --dns-name-label <yourDnsLabel> --ports 80
```
7. Wait for the container to be deployed

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/07%20-%20Preview%20Features/Screenshots/container_create.png
)<br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/07%20-%20Preview%20Features/Screenshots/container_created.png)

) <br><br>

8. Verify that the container has been created under your resource group in the Azure portal: <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//07%20-%20Preview%20Features/Screenshots/resourcegroup.png
) <br><br>
***Note**: It takes some time for the container to become visible in Security Center* <br>

#### 2 - Explore the new Container tab under Compute & Apps
1. The new container view in Security Center is accessible through a feature flag. Copy and paste the following URL in your Azure portal session:
```text
https:/aka.ms/asc_containers_preview
```
<br>

**This shows the container in Security Center:** <br><br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//07%20-%20Preview%20Features/Screenshots/container_in_asc.png
) <br><br>

2. Clicking on the container shows more details:
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//07%20-%20Preview%20Features/Screenshots/docker_details.png
) <br><br>

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//07%20-%20Preview%20Features/Screenshots/docker_details2.png
)

<br>

### Continue with the next lab
08 - Automation with PowerShell, click <a href="https://github.com/tianderturpijn/Azure-Security-Center/tree/master/Labs/08%20-%20Automation%20with%20PowerShell" target="_blank">here</a>

