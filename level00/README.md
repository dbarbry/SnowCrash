# level00

For this first level, we were a bit lost without knowing exactly what to do, so we searched everything that could be related to flag00 and level00. After a bit of searching, we started using the 'find' command to locate flag00 files and level00 files, by name and user owner. 
However, the result of the command 'find / -user flag00' was unclear and full of 'permission denied' errors.

We looked for a solution, and in the end, it was quite simple: redirecting the error output to /dev/null, which seems to act as some sort of 'trash can.' Here's the command: 'find / -user flag00 2> /dev/null'.

With this, we found two files that provided some kind of password, a file called john in /bin files containing: 'cdiiddwpgswtgy.'
However, this password didn't seem to work to advance to the next level, so we started looking into how to decrypt it.

We passed this password to a description website which mentioned a letter substitution ([Cesar](https://www.dcode.fr/chiffre-cesar)). And we found the following result: 'nottohardhere.' That's the password!

```
/*********************************************************\

flag00@SnowCrash:~$ getflag
Check flag.Here is your token : nottohardhere

\*********************************************************/
```