#!/bin/bash

IDP_HOST=localhost
IDP_PORT=8080
CERTIFICATE_FILE=madhyam.cert
KEYSTORE_FILE=keystore1.jks
KEYSTORE_PASSWORD=madhyam



openssl s_client -host $IDP_HOST -port $IDP_PORT -prexit -showcerts </Users/shobhit/Downloads/spring-boot-security-saml-sample-master/src/main/resources/saml | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > $CERTIFICATE_FILE
keytool -delete -alias com:sws:spring:sp -keystore $KEYSTORE_FILE -storepass $KEYSTORE_PASSWORD
keytool -import -alias com:sws:spring:sp -file $CERTIFICATE_FILE -keystore $KEYSTORE_FILE -storepass $KEYSTORE_PASSWORD -noprompt

rm $CERTIFICATE_FILE
