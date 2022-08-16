-- USE FOURMAN;

-- DROP
COMMIT;
-- STORE TABLE AND STORE_SEQ
DROP TABLE STORELIKE_SEQ;
DROP TABLE STORE_SEQ;
DROP TABLE STOREREVIEW_SEQ;
DROP TABLE REQUEST_SEQ;

DROP TABLE STORELIKE; 
DROP TABLE STOREREVIEW;
DROP TABLE REQUEST;
DROP TABLE STORE;

-- CREATE

CREATE TABLE STORE_SEQ (
			ID INT NOT NULL,
            SEQ_NAME VARCHAR(50)
		);
        
-- 함수제작

DROP FUNCTION IF EXISTS GET_STORE_SEQ;
DELIMITER $$
CREATE FUNCTION GET_STORE_SEQ(P_SEQ_NAME VARCHAR(45))
RETURNS INT READS SQL DATA
BEGIN
DECLARE RESULT_ID INT;
UPDATE STORE_SEQ SET ID = LAST_INSERT_ID(ID+1)
WHERE SEQ_NAME = P_SEQ_NAME;
SET RESULT_ID = (SELECT LAST_INSERT_ID());
RETURN RESULT_ID;
END $$
DELIMITER ;

-- 시퀀스 생성
SET SQL_SAFE_UPDATES = 0;
INSERT INTO STORE_SEQ VALUES (0, 'SNO');

-- 시퀀스 호출
SELECT GET_STORE_SEQ('SNO');

CREATE TABLE STORE (
            sno        INT(8) PRIMARY KEY, -- 가게 고유 번호
            oid        VARCHAR(50),
            simage1     VARCHAR(250) NOT NULL, -- 가게 사진
            simage2     VARCHAR(250) NOT NULL, -- 가게 사진
            simage3     VARCHAR(250) NOT NULL, -- 가게 사진
            sname       VARCHAR(100) NOT NULL, -- 가게 이름
            saddress    VARCHAR(250) NOT NULL, -- 가게 주소
            slocation   VARCHAR(50) NOT NULL, -- 가게 위치
            stel        VARCHAR(100) NOT NULL, -- 가게 전화번호
            stype      VARCHAR(100) NOT NULL, -- 가게 종류
            sprice      VARCHAR(100) NOT NULL, -- 가게 가격대
            stime       VARCHAR(100) NOT NULL, -- 가게 시간대
            sholiday    VARCHAR(100) NOT NULL, -- 가게 휴일
            smenu1     VARCHAR(100) NOT NULL, -- 가게 대표메뉴 1
            smenu1cost  VARCHAR(100) NOT NULL, -- 가게 대표메뉴 1 가격
            smenu2      VARCHAR(100), -- 가게 대표메뉴 2
            smenu2cost  VARCHAR(100), -- 가게 대표메뉴 2 가격
            smenu3      VARCHAR(100), -- 가게 대표메뉴 3
            smenu3cost  VARCHAR(100),  -- 가게 대표메뉴 3 가격
            ssearchtag  VARCHAR(100), -- 가게 검색용 태그
            sconfirm    CHAR(1) DEFAULT 'N', -- 가게 등록 여부
            sreplycnt   INT(8) DEFAULT 1,  -- 가게 리뷰 갯수
            sscore      INT(8) DEFAULT 5, -- 가게 평점
            sstart     INT(2) NOT NULL, -- 가게 여는 시간 (예약용)
            send       INT(2) NOT NULL, -- 가게 닫는 시간 (예약용)
            slati DOUBLE(20, 6) DEFAULT 37.57595770501166, -- 가게 위도 (지도용)
            slongti DOUBLE(20, 6) DEFAULT 126.97686668256979, -- 가게 경도 (지도용)
            FOREIGN KEY (oid) REFERENCES OWNER(oid) -- 사업자 아이디
            );
            

                  
-- STOREREVIEW TABLE 


CREATE TABLE STOREREVIEW_SEQ (
			id INT NOT NULL,
            SEQ_NAME VARCHAR(50)
		);
        
-- 함수제작
DROP FUNCTION IF EXISTS GET_STOREREVIEW_SEQ;
DELIMITER $$
CREATE FUNCTION GET_STOREREVIEW_SEQ(P_SEQ_NAME VARCHAR(45))
RETURNS INT READS SQL DATA
BEGIN
DECLARE RESULT_ID INT;
UPDATE STOREREVIEW_SEQ SET ID = LAST_INSERT_ID(ID+1)
WHERE SEQ_NAME = P_SEQ_NAME;
SET RESULT_ID = (SELECT LAST_INSERT_ID());
RETURN RESULT_ID;
END $$
DELIMITER ;

-- 시퀀스 생성
SET SQL_SAFE_UPDATES = 0;
INSERT INTO STOREREVIEW_SEQ VALUES (0, 'srno');

-- 시퀀스 호출
SELECT GET_STOREREVIEW_SEQ('srno');
                  
 
CREATE TABLE STOREREVIEW (
            srno         INT(8) PRIMARY KEY, -- 댓글 고유 번호
            sno			 INT(8),
            mid 		  VARCHAR(50) NOT NULL, -- 사용자 아이디
            mprofile     VARCHAR(1000) NOT NULL, -- 사용자 프로필 사진
            srcontent     VARCHAR(2000) NOT NULL, -- 리뷰 내용
            srimage1      VARCHAR(500), -- 리뷰 이미지 1
            srscore       INT(3) DEFAULT 0, -- 리뷰 별점
            srdate        DATETIME DEFAULT CURRENT_TIMESTAMP, -- 리뷰 등록 일시
            FOREIGN KEY (sno) REFERENCES STORE(sno), -- 가게 번호
            FOREIGN KEY (mid) REFERENCES MEMBER(mid) -- 사용자 아이디
    );  

SELECT * FROM STOREREVIEW;
    
-- REQUEST TABLE    


CREATE TABLE REQUEST_SEQ (
			id INT NOT NULL,
            SEQ_NAME VARCHAR(50)
		);
        
-- 함수제작
DROP FUNCTION IF EXISTS GET_REQUEST_SEQ;
DELIMITER $$
CREATE FUNCTION GET_REQUEST_SEQ(P_SEQ_NAME VARCHAR(45))
RETURNS INT READS SQL DATA
BEGIN
DECLARE RESULT_ID INT;
UPDATE REQUEST_SEQ SET ID = LAST_INSERT_ID(ID+1)
WHERE SEQ_NAME = P_SEQ_NAME;
SET RESULT_ID = (SELECT LAST_INSERT_ID());
RETURN RESULT_ID;
END $$
DELIMITER ;

-- 시퀀스 생성
SET SQL_SAFE_UPDATES = 0;
INSERT INTO REQUEST_SEQ VALUES (0, 'rno');

-- 시퀀스 호출
SELECT GET_REQUEST_SEQ('rno');

CREATE TABLE REQUEST (
            rno          INT(8) PRIMARY KEY,--  요청 글 번호
            sno			 INT(8),
            oid			 VARCHAR(50) NOT NULL,
            aid          VARCHAR(50), -- 관리자 아이디
            sname        VARCHAR(100) NOT NULL, -- 요청한 가게 이름
            rdate        DATETIME DEFAULT CURRENT_TIMESTAMP, -- 요청 등록된 일시
            FOREIGN KEY(sno) REFERENCES STORE(sno), -- 요청한 가게 번호
            FOREIGN KEY(oid)  REFERENCES OWNER(oid) -- 요청한 사장님 아이디
    );     

SELECT * FROM REQUEST;
SELECT * FROM STORE; 

SELECT * FROM REQUEST; 

-- STORELIKE TABLE 


CREATE TABLE STORELIKE_SEQ (
			id INT NOT NULL,
            seq_name VARCHAR(50)
		);
        
-- 함수제작
DROP FUNCTION IF EXISTS GET_STORELIKE_SEQ;
DELIMITER $$
CREATE FUNCTION GET_STORELIKE_SEQ(P_SEQ_NAME VARCHAR(45))
RETURNS INT READS SQL DATA
BEGIN
DECLARE RESULT_ID INT;
UPDATE STORELIKE_SEQ SET ID = LAST_INSERT_ID(ID+1)
WHERE SEQ_NAME = P_SEQ_NAME;
SET RESULT_ID = (SELECT LAST_INSERT_ID());
RETURN RESULT_ID;
END $$
DELIMITER ;

-- 시퀀스 생성
SET SQL_SAFE_UPDATES = 0;
INSERT INTO STORELIKE_SEQ VALUES (0, 'slno');

-- 시퀀스 호출
SELECT GET_STORELIKE_SEQ('slno');


CREATE TABLE STORELIKE (
            slno INT(8) PRIMARY KEY, -- 좋아요 번호
            sno INT(8),
            mid VARCHAR(50),
            sname VARCHAR(100) NOT NULL, -- 요청한 가게 이름 
            FOREIGN KEY (sno) REFERENCES STORE(sno), -- 요청한 가게 번호
            FOREIGN KEY(mid)  REFERENCES MEMBER(mid) -- 요청한 사용자 아이디 
            );

COMMIT; 









 

