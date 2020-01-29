# PAM-alert
A utility for mailgun's API to send emails regarding the SSH successful logins
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
4. Edit `pam_alert.sh` using a tool you desire (via nano or Vim) and add your Mailgun's API and Domain, and your email e.g. gmail account.
```bash
API='' #Your Mailgun API
DOMAIN='' #Domain provided by Mailgun
TO='' #The email you want to send the alerts
```
