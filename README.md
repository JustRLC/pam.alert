# ssh-alert
A utility for mailgun's API to send emails regarding SSH successful logins, with user's information.
# How does it work?
Linux-PAM short for Pluggable Authentication Module is the core of user's dynamic authentication support for applications and services in a Linux system. 

tl;dr PAM handles authentication for multiple services on Linux OS.

This utility requires mailgun's API to allow scripting in use of their SMTP. Therefore, when attempting to connect your server via SSH, it will process ``/etc/pam.d/sshd`` in regards to the shell script's location `pam_alert.sh`.
# Install
`go git` the following packages
```go git github.com/JustRLC/ssh-alert```
# Setup
The following steps were tested with
1. You will be required to sign up to [mailgun's website](https://www.mailgun.com/) to acquire the API.
2. 
