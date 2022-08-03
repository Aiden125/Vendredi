--SEQUENCE & TABLE  DROP/CREATE
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;

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

--member Dummy
INSERT INTO MEMBER VALUES('aaa', '지코','1', '010-1234-1234','zico@naver.com','서울시 강남구 역삼동','남자','1992/09/14','zico.jpg');
INSERT INTO MEMBER VALUES('kang', '강동원','1', '010-4321-4321','kang@naver.com','서울시 강남구 역삼동','남자','1992/09/14','kang.jpg');

select * from member;
select * from qna;