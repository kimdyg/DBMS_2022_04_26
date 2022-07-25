-- 네이버 사용자 화면

CREATE TABLE tbl_bbs (
        b_seq		NUMBER			PRIMARY KEY,
        b_date		VARCHAR2(10)	NOT NULL,	
        b_time		VARCHAR2(125)	NOT NULL,	
        b_writer	VARCHAR2(125)	NOT NULL,
        b_subject	nVARCHAR2(125)	NOT NULL,	
        b_content	nVARCHAR2(1000)	NOT NULL
);

-- 시작값을 1로 하고, 1씩 자동증가되는 SEQ 생성하기
create sequence seq_bbs
increment by 1 start with 1;

select seq_memo.nextval from dual;
insert into tbl_memo(m_seq, m_date, m_time, m_author, m_memo, m_image)
VALUES(seq_memo.nextval, '2022-06-13', '14:23:00', 'callor', '게시판글쓰기','게시판에 글을 쓰자');
SELECT
    * FROM
    tbl_memo;

		CREATE TABLE tbl_memo (
		m_seq		NUMBER 			PRIMARY KEY,
		m_author 	VARCHAR2(25) 	NOT NULL,
		m_date 		VARCHAR2(10) 	NOT NULL,
		m_time 		VARCHAR2(10) 	NOT NULL,
		m_memo 		nVARCHAR2(40) 	NOT NULL,
		m_image 	nVARCHAR2(125)	NOT NULL
		);


create sequence seq_memo
increment by 1 start with 1;