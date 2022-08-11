-- ryu ddl store / storere /request table create and drop
commit;
-- STORE TABLE
drop table store;
drop SEQUENCE store_sq;
create SEQUENCE store_sq MAXVALUE 999999 NOCACHE NOCYCLE;
create table store (
            sNo        number(8) PRIMARY KEY, -- 가게 고유 번호
            oId         varchar2(50) REFERENCES OWNER(oid), -- 사업자 아이디
            sImage1      varchar2(250) not null, -- 가게 사진
            sImage2      varchar2(250) not null, -- 가게 사진
            sImage3      varchar2(250) not null, -- 가게 사진
            sName       varchar2(100) not null, -- 가게 이름
            sAddress    varchar2(250) not null, -- 가게 주소
            sLocation   varchar2(50) not null, -- 가게 위치
            sTel        varchar2(100) not null, -- 가게 전화번호
            sType       varchar2(100) not null, -- 가게 종류
            sPrice      varchar2(100) not null, -- 가게 가격대
            sTime       varchar2(100) not null, -- 가게 시간대
            sHoliday    varchar2(100) not null, -- 가게 휴일
            sMenu1      varchar2(100) not null, -- 가게 대표메뉴 1
            sMenu1cost  varchar2(100) not null, -- 가게 대표메뉴 1 가격
            sMenu2      varchar2(100), -- 가게 대표메뉴 2
            sMenu2cost  varchar2(100), -- 가게 대표메뉴 2 가격
            sMenu3      varchar2(100), -- 가게 대표메뉴 3
            sMenu3cost  varchar2(100),  -- 가게 대표메뉴 3 가격
            sSearchtag  varchar2(100), -- 가게 검색용 태그
            sConfirm    char(1) default 'N', -- 가게 등록 여부
            sReplycnt   number(8) default 1, -- 가게 리뷰 갯수
            sScore      number(8) default 5, -- 가게 평점
            sStart     number(2) NOT NULL, -- 가게 여는 시간 (예약용)
            sEnd       number(2) NOT NULL, -- 가게 닫는 시간 (예약용)
            sLati number(20, 6) Default 37.57595770501166, -- 가게 위도 (지도용)
            sLongti number(20, 6) Default 126.97686668256979 -- 가게 경도 (지도용)
            );

                  
-- STOREREVIEW TABLE                   
drop table storereview;
drop SEQUENCE storereview_sq;
create SEQUENCE storereview_sq MAXVALUE 999999 NOCACHE NOCYCLE;
create table storereview (
            srNo         number(8) PRIMARY KEY, -- 댓글 고유 번호
            sNo          number(8) REFERENCES store(sNo), -- 가게 번호
            mId            varchar2(100) REFERENCES MEMBER (MID), -- 사용자 아이디
            mProfile      varchar2(1000) not null, -- 사용자 프로필 사진
            srContent     varchar2(2000) not null, -- 리뷰 내용
            srImage1      varchar2(500), -- 리뷰 이미지 1
            srScore       number(3) default 0, -- 리뷰 별점
            srDate        date default sysdate -- 리뷰 등록 일시
    );  

select * from storereview;
    
-- REQUEST TABLE    
drop table request;
drop SEQUENCE request_sq;
create SEQUENCE request_sq MAXVALUE 999999 NOCACHE NOCYCLE;
create table request (
            rNo           number(8) PRIMARY KEY,--  요청 글 번호
            sNo           number(8) REFERENCES store(sNo), -- 요청한 가게 번호
            oid           varchar2(50) REFERENCES OWNER(oid), -- 요청한 사장님 아이디
            aId           varchar2(50), -- 관리자 아이디
            sName         varchar2(100) not null, -- 요청한 가게 이름
            rDate         date default sysdate -- 요청 등록된 일시
    );     
SELECT * FROM request;
select * from store; 
SELECT * FROM request; 

-- STORELIKE TABLE 

drop table StoreLike;
drop SEQUENCE StoreLike_sq;
create SEQUENCE StoreLike_sq MAXVALUE 999999 NOCACHE NOCYCLE;
create Table StoreLike (
            slNo number(8) PRIMARY KEY, -- 좋아요 번호
            mid  varchar2(50) REFERENCES member(mid), -- 사용자 아이디
            sNo  number(8) REFERENCES store(sNo), -- 요청한 가게 번호
            sName varchar2(100) not null -- 요청한 가게 이름 
            );






















 
>>>>>>> 5bcc09c422a2d0e970c5bdc15849db709ccf5b75
