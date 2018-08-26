#!/usr/bin/perl -w

#use lib "/usr/share/perl5/";
use CGI;
use JSON;
my $q = CGI->new; 
print $q->header(),
$q->start_html('Hello World!'),
$q->h1('Hello World again!'),
$q->end_html;

system "touch /var/log/apache2/sequence.txt";

open (out, ">/var/log/apache2/test_log.txt");
open (in, "</var/log/apache2/sequence.txt");
my $seq = <in>;
chomp $seq;
if ( $seq eq "" ) {
    $seq = 0;
}

print "seq = $seq<br>";
print out "seq = $seq\n";
$seq++;
system "echo $seq > /var/log/apache2/sequence.txt";
close in;
 
close out;
