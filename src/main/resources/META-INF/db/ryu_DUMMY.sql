-- ryu DUMMY
commit;
select * from storelike;
UPDATE STORE SET oid = 'owner2' where sno =7 ;
UPDATE STORE SET SCONFIRM = 'Y' ;
SELECT * FROM STORE;
SELECT * FROM STOREreview;
SELECT * FROM Request;
select * from store where sno = 6;
delete store where sno between 22 and 30;
SELECT SIMAGE, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) STSCORE FROM STORE where sNo = 1; -- 가게 평점 
select STORE_SQ.nextval from dual;



UPDATE STORE SET slati = 37.60954605745158, slongti = 126.97386634391374, sconfirm = 'Y' where sno = 9 ; 
       
UPDATE STORE SET   sReplycnt = sReplycnt +1 ,
                   sScore = sScore +3
                   WHERE SNo = 31;
UPDATE STOREREVIEW SET   srimage1 = 'noimg.png' , srimage2 = 'noimg.png' , srimage3 = 'noimg.png' , srimage4 = 'noimg.png' , srimage5 = 'noimg.png' 
                   WHERE SNo = 3;
                   
-- 1. ReqeustList Dummy / 사업자가 가게 등록과 동시에 등록 요청
insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 1, 'owner2', '미라이'); 

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 2, 'owner2', '상진식당');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 3, 'owner2', '인딕 슬로우');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 4, 'owner2', '빼아프');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 5, 'owner2', '콴안다오');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 6, 'owner2', '농민백암왕순대');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 7, 'owner2', '로리스더프라임립');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 8, 'owner2', '정돈');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 9, 'owner2', '강남명전');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 10, 'owner2', '장꼬방');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 11, 'owner2', '시라카와');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 12, 'owner2', '비스트로 드 윤뜨빌');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 13, 'owner2', '소이연남마오');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 14, 'owner2', '키겐');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 15, 'owner2', '세시셀라');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 16, 'owner2', '스시카나에');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 17, 'owner2', '권숙수');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 18, 'owner2', '밍글스');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 19, 'owner2', '리사르커피');

insert into request (rNo, sNo, oid, sName)
values (REQUEST_SQ.nextval, 20, 'owner2', '라 티지');
                   
                   
                   