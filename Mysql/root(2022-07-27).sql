DROP DATABASE schooldb;
-- export 된 DataBase import
-- export 된 DataBase 와 같은 이름으로
-- database 생성
CREATE DATABASE schooldb;
use schoolDB;
DESC tbl_student;
SELECT * FROM tbl_student;


--------------------------
CREATE DATABASE firstDB;
USE firstDB;
CREATE USER dbuser@'localhost' IDENTIFIED BY '!Korea8080';
GRANT ALL PRIVILEGES ON firstDB.* TO dbuser@'localhost';



-- MySQL 의 BOOLEAN TYPE
-- 실제 테이블 상에는 BOOLEAN TYPE 이 없고
-- tinyint type 으로 칼럼이 생성된다
-- 이 값은 0 과 1의 값을 가지며 Java 에서 SELECT 를 하면
-- 1은 true 로 0은 false 로 자동 형 변환 된다
CREATE TABLE tbl_users (
	username	VARCHAR(20) PRIMARY KEY,
	password	VARCHAR(20) NOT NULL,
	isEnabled	BOOLEAN DEFAULT FALSE,
	isAccountNonExpired	BOOLEAN DEFAULT TRUE,
	isAccountNonLocked	BOOLEAN DEFAULT TRUE,
	isCredentialsNonExpired	BOOLEAN DEFAULT TRUE,
	
	email	VARCHAR(30),
	tel		VARCHAR(15),
	realname	VARCHAR(20),
	nickname	VARCHAR(20)
);
-- Spring Security 에서 사용하는 권한 테이블
-- 한 user 에게 여러가지 복합적인 권한을 부여하기 위하여
-- 사용하는 보조 테이블
CREATE TABLE tbl_authorities (
	seq BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20),
    authority VARCHAR(20)
);

DESC tbl_users;
SELECT * FROM tbl_users;
DROP TABLE tbl_users;
DROP TABLE tbl_authorities;

SELECT * FROM tbl_authorities;
SELECT * FROM tbl_users;
-- INSERT INTO tbl_authorities(username, authority) VALUE ('kimdy,'ROLE_USER'), ('kimdy','ROLE_ADMIN');

USE schoolDB;

DELETE FROM tbl_authorities WHERE seq = 4;
UPDATE tbl_users
	SET realname='홍홍홍',
    nickname ='용기사',
    tel = '010-010-010',
    email = '1@1'
WHERE username = 'kimdy';