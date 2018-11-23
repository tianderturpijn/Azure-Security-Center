# 10 - Additional Labs
This lab contains additional exercises. <br><br>

### File Integrity Monitoring (FIM)
1. Navigate to the Security Center blade in the Azure Portal
2. Under Advanced Cloud Defense, click on File Integrity Monitoring: <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//10%20-%20Additional/Screenshots/fim.png
) <br><br>
3. Click on Enable on the line where it lists your workspace
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//10%20-%20Additional/Screenshots/fim_enable.png
) <br><br>
4. Keep the default values and click on **Enable File Integrity Monitoring**
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//10%20-%20Additional/Screenshots/fim_settings.png
) <br><br>
5. Click on Settings: <br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//10%20-%20Additional/Screenshots/fim_settings1.png
) <br><br>
6. Under Windows Files, add folder to be recursively monitored (e.g. c:\ASC-Labs): <br><br>
![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs//10%20-%20Additional/Screenshots/windows_file_tracking.png
) <br><br>
6. Login to either your Windows or Linux VM and make some changes (e.g. for Windows, create the c:\asc-labs folder and create a file in that folder)
6. Check back later to see the changes made on your system