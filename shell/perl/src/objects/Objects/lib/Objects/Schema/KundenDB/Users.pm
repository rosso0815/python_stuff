package Objects::Schema::KundenDB::Users;

use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw/ id username password /);
__PACKAGE__->set_primary_key('id');

1;

=head1 SQL

CREATE SEQUENCE users_seq START WITH 1 MAXVALUE 999999 MINVALUE 0;

CREATE TABLE users ( 
    ID     	 NUMBER(10,0) NOT NULL,
    USERNAME VARCHAR2(50) NOT NULL,
    PASSWORD VARCHAR2(50) NOT NULL,
    REMARK 	VARCHAR2(255) NULL,
    PRIMARY KEY(ID)
);
 
CREATE OR REPLACE TRIGGER users_insert_trg
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
IF :new.id IS NULL THEN
     SELECT users_seq.nextval
    INTO :new.id
     FROM DUAL;
   END IF;
END;
/

insert into users (username, password) values ('pfistera','andreas');

commit;

=cut