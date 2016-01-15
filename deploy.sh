#!/bin/bash
wget http://www.lappsgrid.org/keys/secring.gpg.enc
wget http://www.lappsgrid.org/keys/pubring.gpg.enc
echo "Contents of the .gnupg directory:"
ls -halt ~/.gnupg
openssl aes-256-cbc -d -pass pass:"$ENCRYPTION_PASSWORD" -in secring.gpg.enc -out ~/.gnupg/secring.gpg
openssl aes-256-cbc -d -pass pass:"$ENCRYPTION_PASSWORD" -in pubring.gpg.enc -out ~/.gnupg/pubring.gpg
echo "Contents of the .gnupg directory:"
ls -halt ~/.gnupg
gpg2 --list-keys
#mvn -DskipTests=true -P release package javadoc:jar source:jar gpg:sign deploy -Dgpg.passphrase="$PGP_PASSPHRASE" --settings settings.xml
mvn -DskipTests=true -P release package gpg:sign deploy -Dgpg.passphrase="$PGP_PASSPHRASE" --settings settings.xml
3mvn site --settings settings.xml
