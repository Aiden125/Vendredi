-- ryu DUMMY
commit;   
SELECT * FROM STORE;
select * from store where sno = 10;
delete store where sno between 22 and 30;
SELECT SIMAGE, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) STSCORE FROM STORE where sNo = 1; -- 가게 평점 
select STORE_SQ.nextval from dual;
    
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag) 
values (store_sq.nextval, 'bbb', 'noimg.png', '캐슈너트', '종로구 삼청동 150-1', '강북', '070-2288-3388', '양식, 스테이크, 스파게티', '2만원-4만원대',  
        '11:00-19:00', '월요일', '스테이크', '25000원', '스파게티', '16000원', '샐러드', '12000원',
        '#경복궁역#안국역#경복궁역맛집#경복궁맛집'); 
       
UPDATE STORE SET   sReplycnt = sReplycnt +1 ,
                   sScore = sScore +3
                   WHERE SNo = 31;