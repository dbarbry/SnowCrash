# level03

We only have one file in the directory and there is an executable "level03". To get a better understanding on how it works, we attempted to disassemble it using 'objdump -d level03,' which provided an assembly program. Because we never coded in assembly and are way more comfortable with C, we have to find a way to reverse-engineer this executable.

We decided to look for a tool to assist us in understanding the program and came across Ghidra, which can translate assembly code into C. After running the code through Ghidra, We found the following "main" function which is stored in the resources folder, level03.c. (The code is obviously not working on this file, it's just a part of translation of the assembly code in level03).

The line that caught our attention was: 

```
iVar1 = system("/usr/bin/env echo Exploit me");. It indicated that the program was 
```

Calling the "echo" built-in, is using the 'PATH=' environment variable. This represent a risk for this program, cause if we update the PATH= and add a echo file to another location, it could find our echo before the built-in present normally in Linux. With that we can make it execute a file that contains anything we want.

To achieve this, we created a small program launching a new shell, since the executable level03 uses setuid and setgid, and got the two "s" bits set when doing ls -la:
-rwsr-sr-x 1 flag03 level03 8627 Mar 5 2016 level03

It means that the code is gonna be executed by flag03, and commands will be executed with flag03 privileges.
Then, we exported the new PATH environment variable as follows: export PATH=/test:$PATH.
And it worked. We are now in a new shell as flag03.

```
/*********************************************************\

flag03@SnowCrash:~$ getflag
Check flag.Here is your token : qi0maab88jeaj46qoumi7maus

\*********************************************************/
```