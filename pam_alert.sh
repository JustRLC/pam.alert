#!/bin/bash

if [ "$PAM_TYPE" != "close_session" ]; then

    #Setting
    API='' #Your Mailgun API
    DOMAIN='' #Domain provided by Mailgun
    TO='' #The email you want to send the alerts

    #Don't touch! Grrr.
    FROM="SSH Login Alert <mailgun@$DOMAIN>"
    DATE=$(date) #This line of code is not neccessary.
    SERVER=`uname -a`
    SNAME=`uname -sn` #This line is also not neccessary. I want to look cool, ok?

    SUBJECT="Login: $PAM_USER @ $SNAME from $PAM_RHOST" #Title of the email in regards to the person that has logged into the server successfully

    #Email text format - All the information you want to know
    BODY="
    SSH login was successful, here is the following information:

      	User:           $PAM_USER
    	  User IP:        $PAM_RHOST
    	  Service:        $PAM_SERVICE
    	  Date:           $DATE
    	  Server:         $SERVER
    "

    #This will use the cURL method to interact with Mailgun's API, and it will gather the information from above.
    curl -s --user $API \
     https://api.mailgun.net/v3/$DOMAIN/messages \
     -F from="$FROM" \
     -F to="$TO" \
     -F subject="$SUBJECT" \
     -F text="$BODY"
fi
