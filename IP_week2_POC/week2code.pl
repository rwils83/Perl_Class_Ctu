#! /usr/bin/env perl
# Application requirements: Pick 3 system commands and provide the 
#following:

# A brief description of the command and why you might use it
# How you will invoke the commands through Perl and why (System, Exec or Backtick)
# Sample code showing how you would use the command 

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
#with 15 second delay. Use system
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
#permissions. Use system.

elsif ($menuSelection == 3){
    my @cmd = ('/bin/chmod');
    print "Enter filename here: ";
    my $file = <STDIN>;
    chomp $file;
    push @cmd, ('+x', $file);
    system(@cmd);}
    
