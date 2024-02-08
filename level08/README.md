# level08

In this level we have two files : level08 and Token
We used Ghidra to read level08 and we understand that the program is able to print what is in the Token, but apparently the protection the program uses is just checking if the filename contains token, and refuse the access if so as we can see below:

```
  pcVar1 = strstr((char *)in_stack_00000008[1],"token");
  if (pcVar1 != (char *)0x0) {
    printf("You may not access \'%s\'\n",in_stack_00000008[1]);
  }
```

After many discussion and bad solutions, we tried to make a symbolical link of Token just to change its name and read what's inside.

```
ln -s /home/user/level08/token /tmp/test4
```

Then we executed it : 

```
level08@SnowCrash:~$ ./level08 /tmp/test4
quif5eloekouj29ke0vouxean
```

```
/*********************************************************\

flag08@SnowCrash:~$ getflag 
Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f

\*********************************************************/
```