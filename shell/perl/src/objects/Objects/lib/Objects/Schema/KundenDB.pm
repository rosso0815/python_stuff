package Objects::Schema::KundenDB;

use base qw/DBIx::Class::Schema/;

__PACKAGE__->load_classes(qw/ Users Kunden /);

1;
