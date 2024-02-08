# level01

At first, we didn't find what was supposed to be done, so we started looking for where the user passwords were stored on a Linux environment, and we found the files '/etc/shadow' and '/etc/passwd' (see in resources).
We noticed that the 'flag01' line was different and contained some sort of password.
The password didn't work to move on to the next level.

While researching, we discovered the software JohnTheRipper, which seems to be designed for decrypting passwords, it appears that the string in the /etc/passwd is a hash and not a clear password. That's how password were stored in the past before being replaced by "x" meaning the password is stored in /etc/shadow (we can't access it obviously). We transferred the passwd file to a local machine and used JTR to decrypt it:
We got a result which was 'abcdefg'. John the Ripper is gonna search for the most used passwords first and then trying to brute-force the answer. 'abcdefg' is a very easy password so JTR found it in no time.

```
/*********************************************************\

flag01@SnowCrash:~$ getflag
Check flag.Here is your token : f2av5il02puano7naaf6adaaf

\*********************************************************/
```