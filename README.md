# Introduction
A utility for mailgun's API to send emails regarding the SSH successful login
# How does it work?
Linux-PAM short for Pluggable Authentication Module is the core of user's dynamic authentication support for applications and services in a Linux system. 

tl;dr PAM handles authentication for multiple services on Linux OS.

This utility requires mailgun's API to allow scripting in use of their SMTP. Therefore, when attempting to connect your server via SSH, it will process ``/etc/pam.d/sshd`` in regards to the shell script's location `pam_alert.sh`.
# Installation
Be aware! The following steps were tested with `Ubuntu 18.04`
1. You will be required to sign up to [mailgun's website](https://www.mailgun.com/) to acquire the API.
2. Create an directory `/etc/pam.alert` 
```bash 
sudo mkdir /etc/pam.alert; sudo chmod 0755 /etc/pam.alert; cd /etc/pam.alert
```
3. Install the bash script
```bash
wget https://github.com/JustRLC/pam-alert/pam_alert.sh
```
4. For security purposes, allow only the root user to have full privileges over the file.
```bash
sudo chmod 0700 /etc/pam.alert/ssh_alert.sh
sudo chown root:root /etc/pam.alert/ssh_alert.sh
```
5. Edit `pam_alert.sh` using a tool you desire (via nano or Vim) and add your Mailgun's `API` and `DOMAIN`, and `TO` (your email) e.g. gmail account. Then, save the file.
```bash
API='' #Your Mailgun API
DOMAIN='' #Domain provided by Mailgun
TO='' #The email you want to send the alerts
```
6. Locate to `/etc/pam.d/` and edit `sshd` within the directory. Add the following line and save it:
```
# SSH Alert script
session optional pam_exec.so /etc/pam.scripts/ssh_alert.sh
```
7. Ta-dah! Now, you can exit the server and login again. 
### Note  
For testing purposes, the module is included as `optional`, so that you can still log in if the execution fails. After you made sure that it works, you can change optional to required. Then login won't be possible unless the execution of your hook script is successful (Not essential, but I would recommend doing so.).


