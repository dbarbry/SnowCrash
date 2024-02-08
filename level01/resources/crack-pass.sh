#! /bin/bash

line=$(cat ~/Desktop/Snwocrash/level01/ressources/passwd | grep "flag01")
Password=$(echo "$line" | awk -F ':' '{print $2}')
echo "$Password" > crypted-password.txt
john crypted-password.txt
decryptedpassword=$(john --show crypted-password.txt | grep "?" | awk -F ':' '{print $2}')
echo "$decryptedpassword" > decrypted-password.txt
echo "Result of the decryption : $decryptedpassword"
