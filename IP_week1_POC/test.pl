#! /usr/bin/env perl

use strict;
use warnings;
use DBI;
# assign scalar dbh to connect use DBI to connect to mysql database Big_data_Servers_Table
my $dbh = DBI -> connect("DBI:mysql:database=Big_Data_Servers_Table;host=localhost",
"th3gh057","" ,{'RaiseError'=>1});#connects to mysql db Big_Data_Servers_Table @ local host, using local username
#assign scalar sth to use scalar dbh to connect to database, then prepare the command to show rows with status set to production
my $showProductionServers = $dbh->prepare("SELECT * FROM Big_Data_Servers WHERE status ='Production'");
#execute prepared command
$showProductionServers->execute();

while (my $ref = $showProductionServers->fetchrow_hashref()){
  print "Found a row: server_name = $ref->{'server_name'}, IP = $ref->{'IP'}, status = $ref->{'status'}\n";}
$showProductionServers->finish();

my $insertIntoDB = $dbh->prepare("INSERT INTO Big_Data_Servers(server_name, IP, status) VALUES ('PERLDB4', '128.33.23.198', 'Development')");
$insertIntoDB->execute();
$insertIntoDB->finish();

my $check= $dbh->prepare("SELECT * FROM Big_Data_Servers WHERE status='Development'");
$check->execute();
while (my $ref = $check->fetchrow_hashref()){
  print "Found a row: server_name = $ref->{'server_name'}, IP = $ref->{'IP'}, status = $ref->{'status'}\n";}
$check->finish();

my $update = $dbh->prepare("UPDATE Big_Data_Servers SET status = 'Production' WHERE server_name = 'PERLDB2'");
$update->execute();
$update->finish();

my $check2 = $dbh->prepare("SELECT * FROM Big_Data_Servers WHERE server_name='PERLDB2'");
$check2->execute();
while (my $ref = $check2->fetchrow_hashref()){
  print "Found a row: server_name = $ref->{'server_name'}, IP = $ref->{'IP'}, status = $ref->{'status'}\n";}
$check2->finish();

my $deleteFromDB = $dbh->prepare ("DELETE FROM Big_Data_Servers WHERE server_name='PERLDB1'");
$deleteFromDB->execute();
$deleteFromDB->finish();

my $check3 = $dbh->prepare("SELECT * FROM Big_Data_Servers");
$check3->execute();
while (my $ref = $check3->fetchrow_hashref()){
  print "Found a row: server_name = $ref->{'server_name'}, IP = $ref->{'IP'}, status = $ref->{'status'}\n";}
$check3->finish();



$dbh->disconnect();
