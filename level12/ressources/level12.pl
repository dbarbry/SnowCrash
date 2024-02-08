#!/usr/bin/env perl

use strict;
use warnings;

# Récupérer les paramètres de la ligne de commande
my $x = shift @ARGV || "";
my $y = shift @ARGV || "";

# Votre code ici
# Utilisez les variables $x et $y comme vous le feriez avec les paramètres CGI

print "Contenu-type: text/html\n\n";

sub t {
    my ($nn, $xx) = @_;
    $xx =~ tr/a-z/A-Z/;
    $xx =~ s/\s.*//;
    my @output = `egrep "^$xx" ./xd 2>&1`;
    print $xx;
    print("\n===\n");
    print @output;
    foreach my $line (@output) {
        print("lines\n");
        print $line;
        my ($f, $s) = split(/:/, $line);
        if ($s =~ $nn) {
            return 1;
        }
    }
    return 0;
}

sub n {
    if ($_[0] == 1) {
        print("..");
    } else {
        print(".");
    }
}

n(t($y, $x));
