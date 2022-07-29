-- ryu ddl store / storere /request table create and drop
drop table store;

drop SEQUENCE store_sq;
drop table store;
create SEQUENCE store_sq MAXVALUE 999999 NOCACHE NOCYCLE; 
create table store (
            sNum       number(8) PRIMARY KEY, 
            sName       varchar2(100) not null, 
            sAddress    varchar2(250) not null, 
            sTel        varchar2(100) not null, 
            sType       varchar2(100) not null, 
            sPrice      varchar2(100) not null, 
            sTime       varchar2(100) not null, 
            sHoliday    varchar2(100) not null, 
            sMenu1      varchar2(100) not null, 
            sMenu1cost  varchar2(100) not null, 
            sMenu2      varchar2(100), 
            sMenu2cost  varchar2(100), 
            sMenu3      varchar2(100), 
            sMenu3cost  varchar2(100),
            sMenu4      varchar2(100),
            sMenu4cost  varchar2(100),
            sMenu5      varchar2(100),
            sMenu5cost  varchar2(100),
            sSearchtag  varchar2(100),
            sConfirm    char(1) default 'N',
            sReplycnt   number(8) default 0,
            sScore      number(8) default 0,
            sLike number(1) default 0 
            );

SELECT * FROM STORE;

SELECT STORENAME, STORETYPE, (sScore/sReplycnt)STSCORE FROM STORE; -- 가게 평점

    

    

insert into store (sNum, sImage, sName, sAddress, sTel, sType, sPrice, sTime, sHoliday,

            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sMenu4, sMenu4cost,

            sMenu5, sMenu5cost, sSearchtag) 

values (store_sq.nextval, 'noimg.jpg', '군옥각', '리월시 취헌부', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  

        '11:00-19:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '10000원', '간짜장', '7500원', '굴짬뽕', '9000원',

        '#강남#강남역#강남역맛집#중국집#중화요리#중국요리');

        

UPDATE STORE SET   storereplycnt = storereplycnt +1 ,

                   storescore = storescore +2

                   WHERE STORENUM = 1;

                   

drop table storereview;

drop SEQUENCE storereview_sq;

create SEQUENCE storereview_sq MAXVALUE 999999 NOCACHE NOCYCLE;

create table storereview (

            reviewnum         number(8) PRIMARY KEY,

            storenum          number(8) REFERENCES store(storenum),

            userprofile       varchar2(1000) not null,

            userid            varchar2(100),

            reviewcontent     varchar2(2000) not null,

            reviewimage1      varchar2(500),

            reviewimage2      varchar2(500),

            reviewimage3      varchar2(500),

            reviewimage4      varchar2(500),

            reviewimage5      varchar2(500),

            reviewscore       number(3) default 0,

            reviewdate        date default sysdate

    );    

