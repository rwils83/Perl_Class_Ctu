package MY::UsefulCommands

use strict;
use warnings;
use Exporter qw(import);

our @EXPORT_OK = qw(average memory diskusage);
# AVERAGE
# Find the average memory usage for all servers.
sub average {
    $run_query = $dbh->prepare("SELECT avg(memory) as average FROM $tablename");
# AVGerage (of all rows in the column)
    $run_query->execute();
#looping and displaying the results
    while($result=$run_query->fetchrow_hashref()) {
        print "<b>Server_Name:</b> $result->{Server_Name}\n";
        print "<b>IP :</b> $result->{IP}\n";
        print "<b>Status:</b> $result->{Status}\n";
        print "<b>Average memory usage:</b> $result->{average}\n";} 
}


# MEMORY
# Show the server with the most memory utilization.

sub memory{
    $run_query = $dbh->prepare("SELECT memory FROM $tablename ORDER BY memory DESC LIMIT 1");
    # sort by DESCending order Limit to 1 result
    $run_query->execute();
    #looping and displaying the results
    while($result=$run_query->fetchrow_hashref()) {
        print "<b>Server_Name:</b> $result->{Server_Name}\n";
        print "<b>IP :</b> $result->{IP}\n";
        print "<b>Status:</b> $result->{Status}\n";
        print "<b>most memory utilization:</b> $result->{memory}\n";}
}  

# DISKUSAGE
# Show the server with the least amount of disk free.
sub diskusage{
    $run_query = $dbh->prepare("SELECT diskfree FROM $tablename ORDER BY diskfree ASC LIMIT 1");
    #Order by column diskfree ASCending Limit to 1 result
    $run_query->execute();
    #looping and displaying the resulet
    while($result=$run_query->fetchrow_hashref()) {
        print "<b>Server_Name:</b> $result->{Server_Name}\n";
        print "<b>IP :</b> $result->{IP}\n";
        print "<b>Status:</b> $result->{Status}\n";
        print "<b>most memory utilization:</b> $result->{memory}\n";}
}
1; 
