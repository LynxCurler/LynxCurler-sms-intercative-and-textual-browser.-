# Envoi de sms , entrée du numéro à la main, texte également et nombre d'envoi 
# Sending sms , number by hand, text and number of the same sms too
#!/bin/bash

read -p "Entrez numéro de phone" PHONE
read -p "Entrez le texte " TEXTE
read -p "Entrez le nombre d'envoi" ENVOI
 
while [ "$ENVOI" -gt 0 ]
		do
#Using API of HUwawei E3372
		DATA=`curl http://192.168.8.1/api/webserver/SesTokInfo`
		SESSION_ID=`echo "$DATA" | grep "SessionID=" | cut -b 10-147`
		TOKEN=`echo "$DATA" | grep "TokInfo" | cut -b 10-41`

		curl http://192.168.8.1/api/sms/send-sms -H "Cookie: $SESSION_ID" -H "__RequestVerificationToken: $TOKEN" --data "<?xml version='1.0' encoding='UTF-8'?><request><Index>-1</Index><Phones><Phone>$PHONE</Phone></Phones><Sca></Sca><Content>$TEXTE</Content><Len
gth>-1</Length><Reserved>1</Reserved><Date>-1</Date></request>"

ENVOI=$(($ENVOI-1))
done
echo "Fin des envois !!! "
exit 0
