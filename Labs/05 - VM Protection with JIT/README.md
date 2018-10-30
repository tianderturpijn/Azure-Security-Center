# VM Protection with Just in Time (JIT) access
In this lab you will protect your VMs with Just-In-Time (JIT) access. JIT has been released, but in this lab we will show you an additional JIT feature, showcasing the JIT integration with Azure<br>
*Note: the steps below are showcasing a preview feature which needs to be executed using a feature flag*

### 1 - Enable JIT on a VM in ASC
1. Open the Azure portal using this <a href="https://ms.portal.azure.com/?feature.canmodifystamps=true&feature.jitconnect=true" target="_blank">link </a>, or copy and paste this URL:
```powershell
https://ms.portal.azure.com/?feature.canmodifystamps=true&feature.jitconnect=true
```

2. Navigate to **ASC>Just in time VM access** (under Advanced Cloud Defense)
3. Under **Recommended** select a VM which you have deployed earlier and click on the button **Enable JIT on**..
4. Optionally: add/delete ports by clicking on the 3 dots (...) on the right
5. Click **Save**
6. In the Azure portal (using the same session), navigate to **Virtual Machines**
7. Select the VM you have enabled for JIT and in the Overview blade, click on Connect
8. On the opened blade at the right, notice the banner saying "*This VM has a just-in-time access policy*..."<br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/05%20-%20VM%20Protection%20with%20JIT/Screenshots/ConnectVM_JIT_Enabled.png
)
9. Click on the button **Request access**
10. When you have the proper permission, access will be granted and you can now connect to the VM

### 2 - Enable JIT on a VM from the Virtual Machine blade
1. In the same browser session, navigate to the **Virtual Machine** blade
2. Select a VM for which you have not enabled JIT
3. Click on **Connect** in the Overview blade
4. Notice the banner saying "*To improve security, enable just-in-time access*"
5. 
