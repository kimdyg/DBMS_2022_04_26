SELECT
    * FROM tbl_users;
    DROP TABLE tbl_users;
       
    DESC tbl_users;
    
        commit;
        
        
        
        
        
/*
tbl-books 와 tbl_users 테이블이 있다
만약 사용자가 로그인을 한 상태에서
도서정보를 추가하면
네이버에서 ㄷ서정보를 검색하고
기존에 도서가 tbl_books 에 있으면 update 를 수행하고
없으면 새로 insert 수행한다

그리고, 어떤 사용자가 도서를 추가했는지를 table 에 데이터로 저장하고
로그인한 사용자의 mypage에서 자신이 추가한 도서목록을 볼 수 있도록

도서정보와 사용자간의 "도서구입" 정보를 저장할 Relation 을 설계하기
tbl_buybook
isbn 칼럼, username 칼럼, 구입일자 칼럼

isbn 칼럼은 tbl_books 와 FK
username 칼럼은 tbl_users 와 FK
*/

drop TABLE tbl_buybooks;
CREATE TABLE tbl_buybooks (
    b_isbn VARCHAR2(13) NOT NULL,
    b_username VARCHAR2(20)NOT NULL,
    b_date VARCHAR2(10),
    PRIMARY KEY(b_isbn, b_username)
);

--tbl_books 테이블과 FK 설정
ALTER TABLE tbl_buybooks
ADD CONSTRAINT FK_BOOK_USER
FOREIGN KEY (b_isbn) REFERENCES tbl_books(isbn);

ALTER TABLE tbl_buybooks
ADD CONSTRAINT FK_BUYER_USER
FOREIGN KEY (b_username) REFERENCES tbl_users(username);

SELECT
    * FROM tbl_buybooks;
    SELECT
    * FROM tbl_books;






