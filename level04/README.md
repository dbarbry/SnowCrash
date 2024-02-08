We started to check where could be some interesting file for this one with the find -iname and find -user, and the regular ls in workdir. There is a level04.pl so aperl script, and some other files in /rofs/var/www/level04 and /var/www/level04, so it's an apache2 server running this perl script on port 4747.

We can send requests using curl "http://192.168.56.102:4747/?x=lala", it will just print lala in the terminal. We tried curl "http://192.168.56.102:4747/?x=ls" and it did not execute ls so it doesn't seem to be the solution. We then tried to make a malicious echo again since it's used in level04.pl, however the script got its own environment variables so that's not the solution neither.

Again, when doing ls:
-rwsr-sr-x  1 flag04  level04  152 Mar  5  2016 level04.pl
The script is running with the two s bits set, so it's running as flag04 and will execute command as flag04.

Finally we had the idea to use special character like so: curl "http://192.168.56.102:4747/?x=lala;getflag" it didn;t work but we quickly replaced the semi colon by its url codem which is %3B and we got:

/*********************************************************\

level04@SnowCrash:~$ curl "http://192.168.56.102:4747/?x=lala%3Bgetflag"
Check flag.Here is your token : ne2searoevaevoem4ov4ar8ap

\*********************************************************/
