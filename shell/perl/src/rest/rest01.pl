 
use REST::Client;
 
#The basic use case
my $client = REST::Client->new();
 
$client->GET('http://localhost:9000/api/book');

print $client->responseContent();
