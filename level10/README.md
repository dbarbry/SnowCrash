# level10

This one was quite difficult (actually the hardest one), we get again a level10 executable and a token file.
We check level10 with ghidra to understand how it works.
After a long moment of discussion we saw that "access()" has some security vulnerabilities as said in the man:

```
Warning: Using access() to check if a user is authorized to, for example, open a file before actually doing so using open(2) creates a security hole, because the user might exploit the short time interval between checking and  opening  the file to manipulate it. For this reason, the use of this system call should be avoided.
```

We found that this exploit is called Time-Of-Check Time-Of-Use attakcs (TOCTOU) :

To explain it briefly, access is gonna check if the user making the request has the correct rights to access the file requested. If yes, then the code continues, then opens the file and reads the informations, if not it stops there and returns an error.
The aim of this attack is to give a file that we have the right to read, so access gives us the authorization to access it, then very quickly change this file for a link to the file we don't have access to, since access accepted, the open works, and we are now reading a file we're not supposed to read.

We made a script present in resources called exploit.sh doing exactly what we explained above.

After a little bit of waiting (it has a loop trying again and again to access the file, until the hardlink is made perfectly between the time of check and the time of access), we have been able to break the code and find the flag : woupa2yuojeeaaed06riuj63c.

```
/*********************************************************\

flag10@SnowCrash:~$ getflag 
Check flag.Here is your token : feulo4b72j7edeahuete3no7c

\*********************************************************/
```