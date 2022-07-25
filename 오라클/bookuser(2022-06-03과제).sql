CREATE TABLE TBL_BOOKS (
    isbn	    VARCHAR2(13)		PRIMARY KEY,
    title	    nVARCHAR2(50)	    NOT NULL,
    author  	nVARCHAR2(50)	    NOT NULL,
    publisher	nVARCHAR2(50)	    NOT NULL,	
    price	    NUMBER,	
    discount	NUMBER,		
    description	nVARCHAR2(2000),	
    pubdate	    VARCHAR2(10),		
    link	    VARCHAR2(125),		
    image	    VARCHAR2(125)		
);
