#!/usr/bin/env perl

use Crypt::OpenSSL::DSA;

# generate keys and write out to PEM files
my $dsa = Crypt::OpenSSL::DSA->generate_parameters( 512 );
$dsa->generate_key;
$dsa->write_pub_key( $filename );
$dsa->write_priv_key( $filename );

# using keys from PEM files
my $dsa_priv = Crypt::OpenSSL::DSA->read_priv_key( $filename );
my $sig      = $dsa_priv->sign($message);
my $dsa_pub  = Crypt::OpenSSL::DSA->read_pub_key( $filename );
my $valid    = $dsa_pub->verify($message, $sig);

# using keys from PEM strings
my $dsa_priv = Crypt::OpenSSL::DSA->read_priv_key_str( $key_string );
my $sig      = $dsa_priv->sign($message);
my $dsa_pub  = Crypt::OpenSSL::DSA->read_pub_key_str( $key_string );
my $valid    = $dsa_pub->verify($message, $sig);
