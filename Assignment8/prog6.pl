#! /usr/bin/perl
if(@ARGV < 1) {
    die "Usage mygrep string \n";
}
use strict;
my $string = shift(@ARGV);
my $ct = 0;
my $line;

while ($line = <>) {

    $ct++;
    if ($line =~ m/$string/) {
        print STDOUT $ct, ";\t", $line;
    }
}

exit;

# ANS
# On execution of the code the first string that is given as a command line argument is taken a s regular expression while the following strings are treated as normal strings and are matched to fid the existance of first string as a substring in it.