#!/bin/bash
wget http://www.lappsgrid.org/keys/secring.gpg.enc
wget http://www.lappsgrid.org/keys/pubring.gpg.enc
openssl aes-256-cbc -d -pass pass:"$ENCRYPTION_PASSWORD" -in secring.gpg.enc -out secring.gpg
openssl aes-256-cbc -d -pass pass:"$ENCRYPTION_PASSWORD" -in pubring.gpg.enc -out pubring.gpg
mvn -DskipTests=true -P release package javadoc:jar source:jar mvn:sign deploy -Dgpg.passphrase="$PGP_PASSPHRASE" --settings settings.xml
mvn site --settings settings.xml
