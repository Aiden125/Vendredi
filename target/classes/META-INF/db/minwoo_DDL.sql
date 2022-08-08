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

--로그인 log
create table MEMBER_LOG (
    MID VARCHAR2(50) REFERENCES MEMBER(MID),
    LOGIN_DATE DATE,
    LOGIN_STATUS VARCHAR2(45)
);
--네이버 
create table sns (
    mid varchar2(50) references member (mid),
    sid varchar2(50) primary key, --네이버 아이디
    sname varchar2(255), 
    sphone varchar2(50), --전화번호
    semail varchar2(50),
    sprofile varchar2(255), --네이버 프로필
    sdate Date --생일
);
ALTER TABLE SNS add (semail varchar2(50));
CREATE SEQUENCE SNS_SQ MAXVALUE 999999 NOCYCLE NOCACHE;

--사용자 연동 처리 및 로그인 처리
SELECT M.MNAME,M.MEMAIL, S.sID,S.STYPE,S.SNAME,S.sprofile,S.SDATE 
    from member m , sns s where m.mname = s.sname and m.memail = s.semail;  --and s.sid = 
--네이버 간편 회원가입
insert into sns(mid,sid,sname,sprofile,sdate)
    values('aaa','asdasdsa','우지호','010-4567-8764','zico.jpg','1992/09-14');
    
CREATE TABLE QNA(
    QNO VARCHAR2(50) PRIMARY KEY, --글 번호
    qID VARCHAR2(50) , --글쓴이 사용자 or 관리자
    QSUBJECT VARCHAR2(250) NOT NULL, --글 제목
    QCONTENT VARCHAR2(4000) NOT NULL, --글 내용
    QHIT NUMBER(8) DEFAULT 0, -- 조회수
    QGROUP NUMBER(8), --글 그룹
    QSTEP NUMBER(8), -- 그룹내 출력 순서
    QRDATE DATE DEFAULT SYSDATE, -- 등록 시점
    QSECRET VARCHAR2(10) default 'N',-- 비밀글 여부 
    QREPLYCHECK VARCHAR2(10) DEFAULT 0 -- 답변 없음 0, 답변 있음 1
);
CREATE SEQUENCE QNA_SQ MAXVALUE 999999 NOCYCLE NOCACHE;

--member Dummy
INSERT INTO MEMBER VALUES('aaa', '지코','1', '010-1234-1234','zico@naver.com','서울시 강남구 역삼동','남자','1992/09/14','zico.jpg');
INSERT INTO MEMBER VALUES('kang', '강동원','1', '010-4321-4321','kang@naver.com','서울시 강남구 역삼동','남자','1992/09/14','kang.jpg');

select * from member;
select * from qna;
