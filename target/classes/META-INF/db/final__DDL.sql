---------------------------------- 민우 시작 ---------------------------------------------
--SEQUENCE & TABLE  DROP/CREATE
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
select * from member;
DROP SEQUENCE MEMBER_SQ;
DROP SEQUENCE QNA_SQ;

CREATE TABLE MEMBER (
    MID VARCHAR2(50) PRIMARY KEY, --고객 ID
    MNAME VARCHAR2(50) NOT NULL,  -- 고객 이름
    MPW VARCHAR2(50) NOT NULL,  --비밀번호
    MTEL VARCHAR2(50) NOT NULL, -- 전화번호
    MEMAIL VARCHAR2(50) NOT NULL, --고객 이메일
    MADDRESS VARCHAR2(250), -- 고객 주소 
    MGENDER VARCHAR2(10), -- 고객 성별
    MBIRTH DATE,  --생일   
    mprofile varchar2(50)  DEFAULT 'noImg.png' NOT NULL --프로필
);

CREATE SEQUENCE MEMBER_SQ MAXVALUE 999999 NOCYCLE NOCACHE;

CREATE TABLE QNA(
    QNO VARCHAR2(50) PRIMARY KEY, --글 번호
    qID VARCHAR2(50) , --글쓴이 사용자 or 관리자
    QSUBJECT VARCHAR2(250) NOT NULL, --글 제목
    QCONTENT VARCHAR2(4000) NOT NULL, --글 내용
    QHIT NUMBER(8), -- 조회수
    QGROUP NUMBER(8), --글 그룹
    QSTEP NUMBER(8), -- 그룹내 출력 순서
    QRDATE DATE, -- 등록 시점
    QSECRET VARCHAR2(10) default 'N'-- 비밀글 여부 
);
CREATE SEQUENCE QNA_SQ MAXVALUE 999999 NOCYCLE NOCACHE;

----------------------------------- 민우 끝 ---------------------------------------------



---------------------------------- 진우 시작 ---------------------------------------------
DROP TABLE BOARD_COMMENT;
DROP TABLE OWNERBOARD;
DROP TABLE OWNER;
DROP SEQUENCE SEQ_OB;
DROP SEQUENCE SEQ_BC;
-- OWNERBOARD 시퀀스
CREATE SEQUENCE SEQ_OB
    MAXVALUE 99999999
    NOCACHE
    NOCYCLE;
-- BOARD_COMMENT 시퀀스
CREATE SEQUENCE SEQ_BC
    MAXVALUE 99999999
    NOCACHE
    NOCYCLE;
-- OWNER 테이블 생성
CREATE TABLE OWNER(
    OID VARCHAR2(50) PRIMARY KEY,
    ONAME VARCHAR2(50),
    OPW VARCHAR2(50),
    OTEL VARCHAR2(50),
    OEMAIL VARCHAR2(50),
    OADDRESS VARCHAR2(250),
    OBIRTH DATE,
    OGENDER VARCHAR2(10)
);

-- OWNERBOARD 테이블 생성
CREATE TABLE OWNERBOARD(
    BNO NUMBER(8) PRIMARY KEY,
    OID VARCHAR2(50) REFERENCES OWNER(OID),
    SNAME VARCHAR2(50),
    BLOC VARCHAR2(50),
    BTITLE VARCHAR2(50),
    BCONTENT VARCHAR2(4000),
    BPHOTO1 VARCHAR2(250),
    BPHOTO2 VARCHAR2(250),
    BPHOTO3 VARCHAR2(250),
    BPHOTO4 VARCHAR2(250),
    BPHOTO5 VARCHAR2(250),
    BHIT NUMBER(8),
    BDATE DATE DEFAULT SYSDATE
);
-- BOARD_COMMENT 테이블 생성
CREATE TABLE BOARD_COMMENT(
    CNO NUMBER(8) PRIMARY KEY,
    BNO NUMBER(8) REFERENCES OWNERBOARD(BNO),
    OID VARCHAR2(50) REFERENCES OWNER(OID),
    CCONTENT VARCHAR2(2000),
    CDATE DATE
);

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
            sSearchtag  varchar2(100),
            sConfirm    char(1) default 'N',
            sReplycnt   number(8) default 1,
            sScore      number(8) default 5,
            sStart     number(2) NOT NULL,
            sEnd       number(2) NOT NULL
            );

                  
                   
drop table storereview;
drop SEQUENCE storereview_sq;
create SEQUENCE storereview_sq MAXVALUE 999999 NOCACHE NOCYCLE;
create table storereview (
            srNo         number(8) PRIMARY KEY,
            sNo          number(8) REFERENCES store(sNo),
            mId            varchar2(100) not null,
            mProfile      varchar2(1000) not null,
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
SELECT * FROM request;
----------------------------------- 지환 끝 ---------------------------------------------





