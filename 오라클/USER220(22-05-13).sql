-- USER2 화면

SELECT * FROM tbl_student
WHERE st_num = 'S0303';

DELETE FROM tbl_student
WHERE st_num = 'S0101';
COMMIT ;