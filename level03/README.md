We used the "ls" command to list the files in the directory and found a program named "level03." When We used "cat" to view its contents, We realized it was in binary format. To gain a better understanding of how it works, we attempted to disassemble it using 'objdump -d level03,' which provided an assembly program. However, We found the assembly code difficult to comprehend.

We decided to look for a tool to assist us in understanding the program and came across Ghidra, which can translate assembly code into C. After running the code through Ghidra, We found the following "main" function in the program:

int main(int argc, char **argv, char **envp)
{
**gid_t **rgid;
**uid_t **ruid;
int iVar1;
gid_t gid;
uid_t uid;

**rgid = getegid();
**ruid = geteuid();
setresgid(**rgid, **rgid, **rgid);
setresuid(**ruid, **ruid, **ruid);
iVar1 = system("/usr/bin/env echo Exploit me");
return iVar1;
}

The line that caught our attention was: iVar1 = system("/usr/bin/env echo Exploit me");. It indicated that the program was calling the "echo" built-in, which reminded us of the Minishell project we worked on earlier. In Minishell, built-in commands were called using the 'PATH=' environment variable. This led me to believe that We might be able to manipulate the program to call "getflag" instead of "echo."

To achieve this, We created a small program launching a new shell, since the executable level03 uses setuid and setgid, and got the two "s" bits set when doing ls -la:
=> -rwsr-sr-x 1 flag03 level03 8627 Mar 5 2016 level03

It means that the code is gonna run being flag03, and execute commands being flag03.
Then, We exported the new PATH environment variable as follows: export PATH=/test:$PATH.
And it worked we are now in a new shell as flag03.

/*********************************************************\

flag03@SnowCrash:~$ getflag
Check flag.Here is your token : qi0maab88jeaj46qoumi7maus

\*********************************************************/
