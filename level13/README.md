# level13

For this level we have an executable called level13.
We analyze it on Ghidra to get the program in C, and we get this part:

``` 
if (_Var1 != 0x1092) {
  _Var1 = getuid();
  printf("UID %d started us but we we expect %d\n",_Var1,0x1092);
  exit(1);
}
uVar2 = ft_des("boe]!ai0FB@.:|L6l@A?>qJ}I");
printf("your token is %s\n",uVar2);
```

So, if our Uid is 4242 we get the token. The problem being that no user got 4242 as uid or gid. We then decided to focus on the ft_des function which seems to convert this string into the actual token. We made a similar code as ft_des gathering what ghidra gave us, and placing it in exploit.c (you can find it in the resources folder), when executing it we just got our token.

```
/*********************************************************\

level13@SnowCrash:~$ ./exploit
2A31L79asukciNyi8uppkEuSx

\*********************************************************/
```