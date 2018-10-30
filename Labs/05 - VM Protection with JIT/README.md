# VM Protection with Just in Time (JIT) access
In this lab we will protect your VMs with Just-In-Time (JIT) access.<br>
*Note: the steps below are showcasing a preview feature which needs to be executed using a feature flag*

1. Open the Azure portal using this <a href="https://ms.portal.azure.com/?feature.canmodifystamps=true&feature.jitconnect=true" target="_blank">link </a>, or copy and paste this URL:
```powershell
https://ms.portal.azure.com/?feature.canmodifystamps=true&feature.jitconnect=true
```

2. Navigate to **ASC>Just in time VM access** (under Advanced Cloud Defense)
3. Under **Recommended** select a VM which you have deployed earlier and click on the button **Enable JIT on**..
4. Optionally: add/delete ports by clicking on the 3 dots (...) on the right
5. Click **Save**
5. In the Azure portal (using the same session), navigate to **Virtual Machines**
6. Select the VM you have enabled for JIT and in the Overview blade, click on Connect
7. On the opened blade at the right, notice the banner saying "This VM has a just-in-time access policy..."
8. 
