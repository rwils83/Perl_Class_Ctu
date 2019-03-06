#! /usr/bin/env perl
# code references:
#https://www.cyberciti.biz/tips/howto-write-perl-script-to-monitor-disk-space.html   
use strict;

# System command 1: top – d 15 
# System command 2: df
# System command 3: chmod

print "Enter 1 for CPU and Memory usage(TOP)\n";
print "Enter 2 for Disk Free Space(DF)\n";
print "Enter 3 to change file permissions(chmod)\n";
my $menuSelection = <STDIN>;



#first system command, display cpu and memory usage on local machine
#with 15 second delay. Use backtick
if ($menuSelection == 1){
    my @cmd = ('/usr/bin/top');
    push @cmd, '-d 15';
    system(@cmd);}

#second system command, show how much disk is free. Use system.

elsif ($menuSelection == 2){
       my @cmd = ('/bin/df');
       system(@cmd);}
#third system command, change user permissions on files so when new Perl
#scripts are written with shebang lines, the system adds execute 
#permissions. Use exec.

elsif ($menuSelection == 3){
    my @cmd = ('/bin/chmod');
    print "Enter filename here: ";
    my $file = <STDIN>;
    chomp $file;
    push @cmd, ('+x', $file);
    system(@cmd);}
    
