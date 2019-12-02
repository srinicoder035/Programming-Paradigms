#!/usr/bin/perl
user strict 
my $class =shift;
my_ $suf=".csv";
open( IN, "<lclasslsuf") || die "Cannot read: lclasslsuf\n";
my $sep =”:”;
my $tab = 8;
my $q = ‘" "‘;
#read header lines: titles, max grades
my @hdr = &readSplit();
my @max = &readSplit();
push(@max, '100%');
# read students
my @student;
while (<IN>){
	chomp;
	tr /"//d: II/
	push(@student,$_);
}	
my @ave = split(/lsep/, pop(@student));
my $val = join(“,”@ave); #scalar is created from the split
# gen mail for each student
my $ct = 0;
foreach (@student){
	my @p = split(/lsep/);
	my $s = join(“,”,@p);	#scalar created.
	$ct += &sendMail($p);
}
$ave[1] = $ENV[“USER”];
&sendMail (@ave);
print "Emails sent: $ct\n";
exit;