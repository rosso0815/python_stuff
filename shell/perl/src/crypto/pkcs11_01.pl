#!/usr/bin/perl


use Crypt::PKCS11;

# Create the main PKCS #11 object, load a PKCS #11 provider .so library and initialize the module
my $pkcs11 = Crypt::PKCS11->new;

$pkcs11->load( '/usr/local/softhsm/lib/softhsm/libsofthsm2.so' );
$pkcs11->Initialize;

# Create a new session and log in
my $session = $pkcs11->OpenSession( 0 ) 
  or die 'cannot open session';

$session->Login( 'root' );

# Create the public key template
my $publicKeyTemplate = Crypt::PKCS11::Attributes->new->push(
  Crypt::PKCS11::Attribute::Encrypt->new->set(1),
  Crypt::PKCS11::Attribute::Verify->new->set(1),
  Crypt::PKCS11::Attribute::Wrap->new->set(1),
  Crypt::PKCS11::Attribute::PublicExponent->new->set(0x01, 0x00, 0x01),
  Crypt::PKCS11::Attribute::Token->new->set(1),
  Crypt::PKCS11::Attribute::ModulusBits->new->set(768)
);

# Finalize the PKCS #11 module and unload the provider .so library
$pkcs11->Finalize;
$pkcs11->unload;
