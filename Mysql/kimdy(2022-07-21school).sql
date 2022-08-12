USE schoolDB;

CREATE TABLE tbl_student(
		st_num	VARCHAR(5)		PRIMARY KEY,
		st_name	VARCHAR(20)	NOT NULL,
		st_dept	VARCHAR(20)	,
		st_grade	INT,
		st_tel	VARCHAR(15)	NOT NULL,
		st_addr	VARCHAR(125)
);
SELECT * FROM tbl_student;

SELECT COUNT(*) FROM tbl_student;

CREATE TABLE tbl_subject(
sb_code	VARCHAR(5)	NOT NULL	PRIMARY KEY,
sb_name	VARCHAR(25)	NOT NULL	
);
INSERT INTO tbl_subject (sb_code,sb_name) 
values("SB001", "국어");
INSERT INTO tbl_subject (sb_code,sb_name) 
values("SB002", "데이터베이스");
INSERT INTO tbl_subject (sb_code,sb_name) 
values("SB003", "미술");
INSERT INTO tbl_subject (sb_code,sb_name) 
values("SB004", "소프트웨어공학");
INSERT INTO tbl_subject (sb_code,sb_name) 
values("SB005", "수학");
INSERT INTO tbl_subject (sb_code,sb_name) 
values("SB006", "영어영문");
INSERT INTO tbl_subject (sb_code,sb_name) 
values("SB007", "음악");

/*
 -- MySQL 다중 insert
 INSERT INTO tbl_subject(sb_code, sb_name)
 VALUES
 ("SB001", "국어"),
 ("SB002", "데이터베이스"),
 ("SB003", "미술"),
 ("SB004", "소프트웨어공학"),
 ("SB005", "수학"),
 ("SB006", "영어영문"),
 ("SB007", "음악");
*/
SELECT * FROM tbl_subject;

-- 성적이 저장될 table
-- 학생정보와 과목정보가 함께 연동되어 점수를 관리
-- sc_seq 임의 칼럼을 만들어 PK 로 삼고
-- 학번 + 과목코드가 동시에 같은 코드가 중복되지 않도록
-- UNIQUE(학번, 과목코드) 설정
CREATE TABLE tbl_score(
	sc_seq		BIGINT		PRIMARY KEY AUTO_INCREMENT,
	sc_stnum	VARCHAR(5)	NOT NULL,
	sc_sbcode	VARCHAR(5)	NOT NULL,	
	sc_score	INT		,
    UNIQUE(sc_stnum,sc_sbcode)
);
SELECT * FROM tbl_score;
SELECT COUNT(*) FROM tbl_score;



-- tbl_score table 의 데이터를 참조하여
-- 과목별 전체 총점을 구하시오

SELECT SUM(sc_score)
FROM tbl_score;

-- tbl_score table 데이터에서 점수가 70점 이하인 데이터만 추출
-- SELECTion : 조건절()WHERE 을 추가하여 조건에 맞는 데이터만 추출하기
SELECT * FROM tbl_score
WHERE sc_sbcode <= 70
ORDER BY sc_stnum; 


-- tbl_score 데이터에서 전체데이터를 표시하되
-- 과목코드, 점수 칼럼만 표시되도록
-- table 많은 칼럼(속성 Attribute, 필드 field)이 있을경우
-- 필요한 칼럼만 나열하여 리스트를 보고자 할때
SELECT sc_sbcode AS 과목코드, sc_score AS 점수 FROM tbl_score;

-- tbl_secor 데이터에서 점수가 50점 이상 70점 이하인 데이터
-- 과목코드와 점수만 보이도록
SELECT sc_sbcode AS 과목코드, sc_score AS 점수
FROM tbl_score
WHERE sc_score BETWEEN 50 AND 70;

-- WHERE 50<= sc_score <=70 x

-- 점수가 50 이상 70 이하인 데이터
-- tbl_subject table 과 연결하여
-- 과목코드, 과목명, 점수 칼럼이 보이도록

-- 하나만 제외하고 보이게 하는건 없나봄
SELECT *
FROM tbl_score
WHERE sc_score BETWEEN 50 AND 70
not in ('70');


SELECT sc_sbcode AS 과목코드, sc_score AS 점수
FROM tbl_score, tbl_subject
WHERE sc_score BETWEEN 50 AND 70;

 -- SELECT * except sc_seq FROM tbl_score;
 
 -- 점수가 50~70 인 데이터를 Selection
 -- 과목코드, 과목명, 점수를 표현
 -- tbl_student table 을 JOIN 하고
 --
 
 SELECT 
 SC.sc_stnum AS 학번,
 ST.st_name AS 이름,
 SC.sc_sbcode AS 과목,
 SB.sb_name AS 과목명, 
 SC.sc_score AS 점수
FROM tbl_score
		ON SC.sc
WHERE SC.sc_core BETWEEN 50 AND 70;


-- tbl_score 테이블에서 과목별 총점 구하기
SELECT sb_sbcode AS 과목코드, SUM(sc_score) AS 총점, AVG(sc_score) AS 평균
FROM tbl_score
GROUP BY sc_sbcode;
-- GROUP BY SUM, AVG 등 통계함수를 사용하여 Selection
-- 과목명을 함께
SELECT sb_code AS 과목코드, SUM(sc_score) AS 총점, AVG(sc_score) AS 평균, sb_name AS 과목명
FROM tbl_score,tbl_subject
GROUP BY sc_sbcode;

SELECT sb_code AS 과목코드, sb_name AS 과목명, SUM(sc_score) AS 총점, AVG(sc_score) AS 평균
FROM tbl_score LEFT JOIN tbl_subject ON sc_sbcode = sb_code 
GROUP BY sc_sbcode, sb_name;

SELECT sb_code AS 과목코드, sb_name AS 과목명, SUM(sc_score) AS 총점, AVG(sc_score) AS 평균
FROM tbl_student LEFT JOIN tbl_subject ON sc_sbcode = sb_code 
GROUP BY sc_sbcode, sb_name;


-- 학생별로 총점, 평균 구하기
-- 학번, 이름, 총점, 평균
-- 학번 순으로 정렬
SELECT sc_stnum AS 학번, st_name AS 학생이름, SUM(sc_score), AVG(sc_score)
FROM tbl_score
	LEFT JOIN tbl_student
		ON sc_stnum = st_num
GROUP BY sc_stnum;

SELECT st_num, st_name,sc_sbcode,sc_score
FROM tbl_student ST
	LEFT JOIN tbl_score SC
		ON ST.st_num = SC.sc_stnum;
        
        
SELECT st_num, st_name,sc_sbcode,sc_score
FROM tbl_student ST
	LEFT JOIN tbl_score SC
		ON ST.st_num = SC.sc_stnum
WHERE sc_sbcode IN("SB001");
-- WHERE sc_sbcode = 'SB001' 과 동일

-- tbl_score table 에서 각 학생들의 SB002(데이터베이스) 과목 점수만
-- 학번		데이터베이스점수
-- S0001 SB0002

SELECT sc_stnum,
	SUM(IF(sc_sbcode = 'SB001', sc_score,0)) AS 국어,
    SUM(IF(sc_sbcode = 'SB002',sc_score,0)) AS DB,
    SUM(IF(sc_sbcode = 'SB003',sc_score,0)) AS 미술,
    SUM(IF(sc_sbcode = 'SB004',sc_score,0)) AS 소프트웨어공학,
    SUM(IF(sc_sbcodE = 'SB005',sc_score,0)) AS 수학,
    SUM(IF(sc_sbcodE = 'SB006',sc_score,0)) AS 영어영문,
    SUM(IF(sc_sbcodE = 'SB007',sc_score,0)) AS 음악
FROM tbl_score
	LEFT JOIN tbl_student
		ON sc_stnum = st_num
GROUP BY sc_stnum;


SELECT sc_stnum,
	SUM(CASE WHEN sc_sbcode = 'SB001' THEN sc_score ELSE 0 END) AS 국어,
    SUM(CASE WHEN sc_sbcode = 'SB002' THEN sc_score ELSE 0 END) AS DB,
    SUM(CASE WHEN sc_sbcode = 'SB003' THEN sc_score ELSE 0 END) AS 미술,
    SUM(CASE WHEN sc_sbcode = 'SB004' THEN sc_score ELSE 0 END) AS 소트프웨어공학,
    SUM(CASE WHEN sc_sbcode = 'SB005' THEN sc_score ELSE 0 END) AS 수학,
    SUM(CASE WHEN sc_sbcode = 'SB006' THEN sc_score ELSE 0 END) AS 영어영문,
    SUM(CASE WHEN sc_sbcode = 'SB007' THEN sc_score ELSE 0 END) AS 음악
FROM tbl_score
	LEFT JOIN tbl_student
		ON sc_stnum = st_num
GROUP BY sc_stnum;

/*
-- 제 2 정규화가 되어있는 데이터를 view 할때는 PIVOT 으로 데이터를
 펼쳐서 보는 것이 편리할 때가 많다
 제2정규화가 된 데이터는 기준이 되는 키값을 중심으로 Row 방향으로
 데이터가 저장되어 있다alter이 데이터를 쉽게 보고서 등으로 만들때는 PIVOT 을 하여
 Column 방향으로 펼쳐서 보는것이편리하다
*/