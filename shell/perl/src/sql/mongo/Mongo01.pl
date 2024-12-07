use MongoDB;
use MongoDB::OID;

my $client = MongoDB::MongoClient->new;

my $db = $client->get_database( 'tutorial' );

my $users = $db->get_collection( 'users' );

$users->insert({"name" => "Joe",
    "age" => 52,
    "likes" => [qw/skiing math ponies/]});