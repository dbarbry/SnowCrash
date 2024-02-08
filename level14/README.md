# level14

Here we have nothing to interact with.
After several minutes of thinking we asked oursleves "Should we analyze Getflag ?"
We analyzed Getflag in Ghidra, and we found that the code to decrypt all the flags were ft_des, so we just put the last encrypted token in our code from the level 13, and we got the flag.

7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ

level14@SnowCrash:/bin$ su flag14
Password: 7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
Congratulation. Type getflag to get the key and send it to me the owner of this livecd :)

```
/*********************************************************\

flag14@SnowCrash:~$ getflag
Check flag.Here is your token : 7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ

\*********************************************************/
```