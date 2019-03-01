use strict;
use warnings;
use DBI;

my $dbh= DBI->connect("DBI:mysql:database=Big_Data_Servers_Table;host=localhost", "th3gh057", "", {'RaiseError'=>1});

my $revertInsert = $dbh->prepare("DELETE FROM Big_Data_Servers WHERE server_name='PERLDB4'");
$revertInsert->execute();
$revertInsert->finish();

my $revertDelete = $dbh->prepare("INSERT INTO Big_Data_Servers(server_name, IP, status) VALUES ('PERLDB1', '127.23.22.129', 'Production')");
$revertDelete->execute();
$revertDelete->finish();

my $revertUpdate = $dbh->prepare("UPDATE Big_Data_Servers SET status = 'Development' WHERE server_name = 'PERLDB2' ");
$revertUpdate->execute();
$revertUpdate->finish();

my $check = $dbh->prepare("SELECT * FROM Big_Data_Servers");
$check->execute();
while (my $ref = $check->fetchrow_hashref()){
  print "Found a row: server_name = $ref->{'server_name'}, IP = $ref->{'IP'}. status = $ref->{'status'}\n";}
$check->finish();

$dbh->disconnect();
