use Data::Dumper;
use JSON qw( decode_json );
use REST::Client;

#The basic use case
my $client = REST::Client->new();
$client->GET('http://localhost:8080/author/show/1.json');
#print $client->responseContent();
#print Dumper($client);

$next = "http://localhost:8080/author/show/1.json";
$client->GET($next);
$json = $client->responseContent();

my $perl_ref = decode_json($json); #decode the response
#print Dumper( $perl_ref );
print "birtday=".$perl_ref->{'birthday'};

#foreach my $item( @$perl_ref )
#{
#	print "item=".$item;
#$email = $item->{'profile'}->{'email'}; #deference email value from user object
#Update the email attribute value for referenced user object
#re-encode as JSON, and PUT the entire record to update it
#}
