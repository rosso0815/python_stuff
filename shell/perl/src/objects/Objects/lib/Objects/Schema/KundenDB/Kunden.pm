package Objects::Schema::KundenDB::Kunden;

use base qw/DBIx::Class/;

#------------------------------------------------------------------------------

__PACKAGE__->load_components(qw/Core PK::Auto::Oracle /);
__PACKAGE__->table('kunden');
__PACKAGE__->add_columns(qw/ id name vorname remark /);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->sequence('KUNDEN_SEQ');

#------------------------------------------------------------------------------

sub getForm {
	return [
		{ title => 'NAME',    id => 'name' },
		{ title => 'VORNAME', id => 'vorname' },
		{ title => 'REMARK',  id => 'remark' },
	];
}

#------------------------------------------------------------------------------

sub getList {
	return [
		{ title => 'NAME',    id => 'name' },
		{ title => 'VORNAME', id => 'vorname' },
		{ title => 'REMARK',  id => 'remark' },
	];
}
#------------------------------------------------------------------------------

1;

#------------------------------------------------------------------------------

=head1 SQL

CREATE SEQUENCE kunden_seq START WITH 1 MAXVALUE 999999 MINVALUE 0;

CREATE TABLE KUNDEN ( 
    ID     	NUMBER(10,0) NOT NULL,
    NAME   	VARCHAR2(50) NOT NULL,
    VORNAME	VARCHAR2(50) NULL,
    REMARK 	VARCHAR2(255) NULL,
    PRIMARY KEY(ID)
);
 
CREATE OR REPLACE TRIGGER kunden_insert_trg
BEFORE INSERT ON kunden
FOR EACH ROW
BEGIN
IF :new.id IS NULL THEN
     SELECT kunden_seq.nextval
    INTO :new.id
     FROM DUAL;
   END IF;
END;
/

=cut

