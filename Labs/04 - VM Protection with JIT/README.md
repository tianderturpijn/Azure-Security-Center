# 04 - VM Protection with Just in Time (JIT) access
##### Estimated lab time: 15 minutes

:heavy_exclamation_mark:***Requirements**:*<br>
Make sure before continuing with this lab that the VM's that you have deployed earlier are showing as **Monitored by Azure Security Center**. You can find this setting under **Security Center>Compute & Apps**. Click on the VM to find this property.

In this lab you will protect your VMs with Just-In-Time (JIT) access. We will show you an additional JIT feature, showcasing the JIT integration with the Azure Compute blade<br>

### 1 - Enable JIT on a VM in ASC
1. Open Security Center in the Azure portal
2. Navigate to **Just in time VM access** (under Advanced Cloud Defense)
3. Under **Recommended** select a VM which you have deployed earlier and click on the button **Enable JIT on x VMs**
4. Optionally: delete ports by clicking on the 3 dots (...) on the right or add new ports by clicking on **Add**
5. Click **Save**
6. In the Azure portal (using the same session), navigate to **Virtual Machines**
7. Click on the VM you have enabled for JIT and in the Overview blade, click on **Connect**
8. On the opened blade at the right, notice the banner saying "*This VM has a just-in-time access policy*..."<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20VM%20Protection%20with%20JIT/Screenshots/ConnectVM_JIT_Enabled.png
)
9. Click on the button **Request access**
10. When you have the proper permission, access will be granted and you can now connect to the VM

### 2 - Enable JIT on a VM from the Virtual Machine blade
1. In the same browser session, navigate to the **Virtual Machine** blade
2. Select a VM for which you have **not** enabled JIT
3. Click on **Connect** in the Overview blade
4. Notice the banner saying "*To improve security, enable just-in-time access*"<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20VM%20Protection%20with%20JIT/Screenshots/EnableJITfromVMblade.png
)
5. Click on the arrow pointing to the right (as shown in the previous image) and click on the button **Enable just-in-time policy**<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20VM%20Protection%20with%20JIT/Screenshots/EnableJITbutton.png
)
6. You have now enabled JIT for this VM. You can click on the link **Open Azure Security Center** to edit or disable the policy
7. When you have clicked on the link in the previous step, notice the column last access. That should say Active now, since we just enable JIT access to a VM in the previous steps
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20VM%20Protection%20with%20JIT/Screenshots/JitActiveNow.png
)

### 3 - [Optional Lab] Enable custom JIT ports with PowerShell
***Requirements**:*<br>
Navigate to **Module 08 - Automation with PowerShell** and make sure that you have completed **Labs 01 - 
AzureRm PowerShell cmdlets installation and 02 - 
Security Center PowerShell cmdlets installation** before proceeding with this lab<br>


To enable JIT through PowerShell you can leverage the following syntax:
```powershell
$myVM = Get-AzureRmVM -Name <VMname> -ResourceGroupName <resourceGroupName>
Set-AzureRmJitNetworkAccessPolicy -ResourceGroupName "<rescourceGroupName>" -Location "<location>" -Name "default" -VirtualMachine $myVM -Kind "Basic"
```
**In the following excercise you are going to enable JIT for a specific VM, configuring custom ports.**
1. Copy this <a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20VM%20Protection%20with%20JIT/Files/Enable-Custom-JIT-Ports.ps1" target="_blank">JIT sample script</a> and paste it in your favorite PowerShell editor
2. Make sure you replace all the variables within "<>" and update the script with your required ports
3. Make sure that you are logged into Azure and that you have selected the Azure subscription which has been given to you
4. Excute the script. Make sure that you refresh the Azure portal after executing the script
5. Explore in ASC that the custom ports have been added to your JIT enabled VM

<br>

### Continue with the next lab
05 - Linux Detections, click <a href="https://github.com/tianderturpijn/Azure-Security-Center/tree/master/Labs/05%20-%20Linux%20Detections" target="_blank">here</a>


