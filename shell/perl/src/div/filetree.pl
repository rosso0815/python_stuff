use File::Find;

find(\&wanted, '/foo', '/bar');

sub wanted { ... }


