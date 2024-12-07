package Objects::Model::DBIC;

use base qw/Catalyst::Model::DBIC::Schema/;

__PACKAGE__->config(
	schema_class => 'Objects::Schema::KundenDB',
	connect_info => [ "dbi:Oracle:Test", "pfistera", "andreas", { AutoCommit => 1 } ]
	#connect_info => [ "dbi:mysql:objects", "pfistera", "andreas" ]
);    
