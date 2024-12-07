
CREATE DATABASE fab;

CREATE USER 'fab'@'localhost' IDENTIFIED BY 'fab';

select user from mysql.user;

GRANT ALL PRIVILEGES ON fab . * TO 'fab'@'localhost';

FLUSH PRIVILEGES;