# level02

ls in /home/user/level02 : we found level02.pcap
After some research we fond that level02.pcap could be open in Wireshark a network packet analyzer.
Then we tried to understand how we could find some informations to get the flag.

We tried to follow the TCP Stream and we fond some informations (there are way more informations but those are not relevant for this exercice): 

```
Linux 2.6.38-8-generic-pae (::ffff:10.1.1.2) (pts/10)

..wwwbugs login: l.le.ev.ve.el.lX.X
..
Password: ft_wandr...NDRel.L0L
.
..
Login incorrect
wwwbugs login:
```

The dots present after the ft_wandr are deletion characters, which mean the user typed ft_wandr then deleted 3 characters wrote NDRel, deleted another character, and ended with L0L. Which leads to this result: ft_waNDReL0L.

```
/*********************************************************\

flag02@SnowCrash:~$ getflag
Check flag.Here is your token : kooda2puivaav1idi4f57q8iq

\*********************************************************/
```