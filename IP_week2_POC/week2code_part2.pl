$run_query = $dbh->prepare("SELECT * FROM $tablename WHERE CPU > 90");
# Look where CPU is greater than > 90
$run_query->execute();
#looping and displaying the results
while($result=$run_query->fetchrow_hashref()) {
  print "<b>Server_Name:</b> $result->{Server_Name}\n";
  print "<b>IP :</b> $result->{IP}\n";
  print "<b>Status:</b> $result->{Status}\n";
  print "<b>CPU usage above 90%:</b> $result->{CPU}\n";

} 


# AVERAGE
# Find the average memory usage for all servers.
$run_query = $dbh->prepare("SELECT avg(memory) as average FROM $tablename");
# AVGerage (of all rows in the column)
$run_query->execute();
#looping and displaying the results
while($result=$run_query->fetchrow_hashref()) {
  print "<b>Server_Name:</b> $result->{Server_Name}\n";
  print "<b>IP :</b> $result->{IP}\n";
  print "<b>Status:</b> $result->{Status}\n";
  print "<b>Average memory usage:</b> $result->{average}\n";

} 
#   Show the server with the most memory utilization.
$run_query = $dbh->prepare("SELECT memory FROM $tablename ORDER BY memory DESC LIMIT 1");
# sort by DESCending order Limit to 1 result
$run_query->execute();
#looping and displaying the results
while($result=$run_query->fetchrow_hashref()) {
  print "<b>Server_Name:</b> $result->{Server_Name}\n";
  print "<b>IP :</b> $result->{IP}\n";
  print "<b>Status:</b> $result->{Status}\n";
  print "<b>most memory utilization:</b> $result->{memory}\n";

}  


#  Show the server with the least amount of disk free.
$run_query = $dbh->prepare("SELECT diskfree FROM $tablename ORDER BY diskfree ASC LIMIT 1");
#Order by column diskfree ASCending Limit to 1 result
$run_query->execute();
#looping and displaying the resulet

while($result=$run_query->fetchrow_hashref()) {
   print "<b>Server_Name:</b> $result->{Server_Name}\n";
   print "<b>IP :</b> $result->{IP}\n";
   print "<b>Status:</b> $result->{Status}\n";
   print "<b>most memory utilization:</b> $result->{memory}\n";
} 
