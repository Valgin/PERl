#!/usr/bin/env perl
use v5.30;
use DBI;
use strict;

my $source = ("DBI:mysql:sakila:localhost");
my $username = "root";
my $password = "12345";

my $dbh = DBI->connect($source, $username, $password);

my $sql = $dbh->prepare("
	SELECT `table_name`, `table_rows`
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA = 'sakila'
");

	$sql->execute();

while (my ($name,$rows) = $sql->fetchrow_array()) {
	print "table_name: $name | table_rows: $rows\n";
}
