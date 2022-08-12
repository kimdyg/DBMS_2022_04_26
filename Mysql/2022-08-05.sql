use mydb;
use myTodoDB;
CREATE DATABASE myTodoDB;
FLUSH PRIVILEGES;
 	CREATE TABLE tbl_users (
		username VARCHAR(20) PRIMARY KEY,
		password  VARCHAR(255) NOT NULL,
		enabled BOOLEAN DEFAULT FALSE,
		accountNonExpired  BOOLEAN DEFAULT TRUE,
		accountNonLocked  BOOLEAN  DEFAULT TRUE,
		credentialsNonExpired  BOOLEAN  DEFAULT TRUE,
		realname  VARCHAR(20),
		nickname  VARCHAR(20)
	);
CREATE TABLE tbl_authorities (
	seq BIGINT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(20),
	authority VARCHAR(20)
);
    CREATE TABLE tbl_memos (
 			m_seq BIGINT PRIMARY KEY AUTO_INCREMENT,
 			m_author VARCHAR(25) NOT NULL,
 			m_date VARCHAR(10) NOT NULL,
 			m_time VARCHAR(10) NOT NULL,
 			m_memo VARCHAR(40) NOT NULL,
            username VARCHAR(20)
 		);	
DROP TABLE tbl_users;
DROP TABLE tbl_authorities;
DROP TABLE tbl_memos;
DROP TABLE tbl_todolist;

DESC tbl_users;
SELECT * FROM tbl_users;
SELECT * FROM tbl_authorities;
SELECT * FROM tbl_memos;
insert into tbl_memos
value ('fsda','afsd','fads','','','');

INSERT INTO tbl_users(username,password,enabled)
VALUE('callor88','1234',true);

INSERT INTO tbl_authorities(username,authority)
VALUE('callor88','ROLE_USER');
INSERT INTO tbl_authorities(username,authority)
VALUE('callor88','ROLE_ADMIN');

CREATE TABLE tbl_todolist(
 t_seq BIGINT auto_increment primary key,
t_username VARCHAR(20) NOT NULL,
t_sdate VARCHAR(20) NOT NULL,
t_stime VARCHAR(20) NOT NULL,
t_content VARCHAR(20) NOT NULL,
t_edate VARCHAR(20),
t_etime VARCHAR(20)
);

USE mytododb;
SELECT * FROM tbl_authorities;
SELECT * FROM tbl_users;
SELECT * FROM tbl_todolist;
show tables;
