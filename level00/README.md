For this first level, We were a bit lost without knowing exactly what to do, so I asked a fellow student who had already done this project, and he told me to look for 'flag00.' After quite a bit of searching, We started using the 'find' command to locate 'flag00.'
However, the result of the command 'find / -user flag00' was unreadable and filled with 'permission denied' errors.

We looked for a solution, and in the end, it was quite simple: redirecting the error output to /dev/null, which seems to act as a kind of 'trash can.' Here's the command: 'find / -user flag00 2> /dev/null'

With this, We found two files that provided some kind of password: 'cdiiddwpgswtgy.'
However, this password didn't seem to work to advance to the next level, so We started looking into how to decrypt it.

https://www.dcode.fr/chiffre-cesar

We passed this password to ChatGPT, which mentioned a letter substitution (Cesar). We then visited a website that allowed decryption using this method, and we found the following result: 'nottohardhere.' That's the password!

/*********************************************************\

flag00@SnowCrash:~$ getflag
Check flag.Here is your token : nottohardhere

\*********************************************************/
