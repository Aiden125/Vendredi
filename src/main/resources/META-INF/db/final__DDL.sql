---------------------------------- 지환 시작 ---------------------------------------------
-- ryu ddl store / storere /request table create and drop
drop table store;
drop SEQUENCE store_sq;
create SEQUENCE store_sq MAXVALUE 999999 NOCACHE NOCYCLE;
create table store (
            sNo        number(8) PRIMARY KEY,
            oId         varchar2(50),
            sImage      varchar2(250) not null,
            sName       varchar2(100) not null,
            sAddress    varchar2(250) not null,
            sLocation   varchar2(50) not null,
            sTel        varchar2(100) not null,
            sType       varchar2(100) not null,
            sPrice      varchar2(100) not null,
            sTime       varchar2(100) not null,
            sHoliday    varchar2(100) not null,
            sMenu1      varchar2(100) not null,
            sMenu1cost  varchar2(100) not null,
            sMenu2      varchar2(100),
            sMenu2cost  varchar2(100),
            sMenu3      varchar2(100),
            sMenu3cost  varchar2(100),
            sMenu4      varchar2(100),
            sMenu4cost  varchar2(100),
            sMenu5      varchar2(100),
            sMenu5cost  varchar2(100),
            sSearchtag  varchar2(100),
            sConfirm    char(1) default 'N',
            sReplycnt   number(8) default 0,
            sScore      number(8) default 0,
            sLike       number(1) default 0
            );
SELECT * FROM STORE; 
SELECT SIMAGE, SNAME,  SLOCATION, STYPE, (sScore/sReplycnt)STSCORE FROM STORE where sNo = 1; -- 가게 평점
    
    
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sMenu4, sMenu4cost,
            sMenu5, sMenu5cost, sSearchtag) 
values (store_sq.nextval, 'aaa', 'noimg.jpg', '군옥각', '리월시 취헌부', '강남', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-19:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '10000원', '간짜장', '7500원', '굴짬뽕', '9000원',
        '#강남#강남역#강남역맛집#중국집#중화요리#중국요리');
commit;        
        
UPDATE STORE SET   sReplycnt = sReplycnt +2 ,
                   sScore = sScore +7
                   WHERE SNo = 2;
                   
                   
drop table storereview;
drop SEQUENCE storereview_sq;
create SEQUENCE storereview_sq MAXVALUE 999999 NOCACHE NOCYCLE;
create table storereview (
            srNo         number(8) PRIMARY KEY,
            sNo          number(8) REFERENCES store(sNo),
            mProfile       varchar2(1000) not null,
            mId            varchar2(100),
            srContent     varchar2(2000) not null,
            srImage1      varchar2(500),
            srImage2      varchar2(500),
            srImage3      varchar2(500),
            srImage4      varchar2(500),
            srImage5      varchar2(500),
            srScore       number(3) default 0,
            srDate        date default sysdate
    );  

select * from storereview;
    
drop table request;
drop SEQUENCE request_sq;
create SEQUENCE request_sq MAXVALUE 999999 NOCACHE NOCYCLE;
create table request (
            rNo           number(8) PRIMARY KEY,--  요청 글 번호
            sNo           number(8) REFERENCES store(sNo), -- 요청한 가게 번호
            oid           varchar2(50) not null, -- 요청한 사장님 아이디
            aId           varchar2(50), -- 관리자 아이디
            sName         varchar2(100) not null, -- 요청한 가게 이름
            rDate         date default sysdate -- 요청 등록된 일시
    ); 

----------------------------------- 지환 끝 ---------------------------------------------







---------------------------------- 민우 시작 ---------------------------------------------


----------------------------------- 민우 끝 ---------------------------------------------









---------------------------------- 진우 시작 ---------------------------------------------


----------------------------------- 진우 끝 ---------------------------------------------













----------------------------------- 희석 시작 ---------------------------------------------
-- Admin
DROP TABLE ADMIN_L;
DROP TABLE ADMIN;

CREATE TABLE ADMIN(
    aID VARCHAR2(50) PRIMARY KEY NOT NULL,
    aPW VARCHAR2(50) NOT NULL,
    aEMAIL VARCHAR2(50) NOT NULL,
    aNAME VARCHAR2(50) NOT NULL,
    aTEL VARCHAR2(50) NOT NULL,
    aLEVEL VARCHAR2(50) DEFAULT 0 REFERENCES ADMIN_L(aLEVEL) 
);

-- ADMIN LEVEL
CREATE TABLE ADMIN_L(
    aLEVEL VARCHAR2(10) PRIMARY KEY,
    aLEVEL_NAME VARCHAR2(50)
);

-- ADMIN LELVE DATA
INSERT INTO ADMIN_L VALUES(0, 'MANAGER');
INSERT INTO ADMIN_L VALUES(1, 'HEAD_MANAGER');
INSERT INTO ADMIN_L VALUES(2, 'MASTER');
----------------------------------- 희석 끝 ---------------------------------------------






