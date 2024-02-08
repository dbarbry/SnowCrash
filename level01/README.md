In the beginning, we  didn't quite find what needed to be done, so we started looking for where the user passwords we re stored on a Linux machine, and we found the files '/etc/shadow' and '/etc/passwd' (see the files in the resources).
we noticed that the 'flag01' line was different and contained some sort of password.
The password didn't work to move on to the next level.

While researching, we discovered the software JohnTheRipper, which seems to be designed for decrypting passwords, it appears that the string appearing in the /etc/passwd is a hash and not a clear password. That's how password we re stored in the past before being replace by "x" meaning the password is stored in /etc/shadow (we  can't access it obviously). we transferred the passwd file to my machine and used JTR to decrypt it:
It gave me 'abcdefg'.

/*********************************************************\

flag01@SnowCrash:~$ getflag
Check flag.Here is your token : f2av5il02puano7naaf6adaaf

\*********************************************************/
