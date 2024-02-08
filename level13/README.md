For this stage we get a level13 that we can exec.
we put it on Ghidra to get the program in C, we see that : 
  if (_Var1 != 0x1092) {
    _Var1 = getuid();
    printf("UID %d started us but we we expect %d\n",_Var1,0x1092);
                    /* WARNING: Subroutine does not return */
    exit(1);
  }
  uVar2 = ft_des("boe]!ai0FB@.:|L6l@A?>qJ}I");
  printf("your token is %s\n",uVar2);

So, if our Uid is 4242 we got the token. So we just copy/past the code, erase the if condition, and get this program that do the same encryption (exploit.c).

/*********************************************************\

flag13@SnowCrash:~$ ./exploit
Check flag.Here is your token : 2A31L79asukciNyi8uppkEuSx

\*********************************************************/
