-- ryu DUMMY
commit;   
UPDATE STORE SET SCONFIRM = 'Y';
SELECT * FROM STORE;
SELECT * FROM STOREreview;
select * from store where sno = 6;
delete store where sno between 22 and 30;
SELECT SIMAGE, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) STSCORE FROM STORE where sNo = 1; -- 가게 평점 
select STORE_SQ.nextval from dual;
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'aaa', 'noimg.png', '군옥각 본점', '강남구 역삼동 31-1', '강남', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-20:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '11000원',
        '#강남#강남역#강남역맛집#중국집#중화요리', 11, 20);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'aaa', 'noimg.png', '군옥각 종로점', '종로구 관훈동 37-2 2층', '강북', '070-2238-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-19:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '11000원',
        '#종각역#인사동#인사동맛집#중국집#중화요리', 11, 19);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'aaa', 'noimg.png', '군옥각 홍대점', '서울 마포구 동교동 22-1 1층', '강북', '070-1138-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '24시간', '없음', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '11000원',
        '#홍대역#홍대입구#홍대맛집#중국집#중화요리', 9, 24);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'aaa', 'noimg.png', '각청각 본점', '서울 마포구 동교동 35 옥형빌딩 1층', '강북', '070-3318-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '24시간', '없음', '황금새우볼튀김', '15000원', '리월두부', '11600원', '용수면', '95000원',
        '#홍대역#홍대입구#홍대맛집#중국집#중화요리', 9, 24);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'aaa', 'bts_d.jpg', '방탄백반', '서울시 강남구 역삼1동 101-1', '강남', '010-0888-4351', '한식, 백반', '1만원대',  
        'AM 6:00 ~ PM 9:00', '일요일', '가정식 백반', '7000원', '제육볶음', '8000원', '보쌈정식', '13000원',
        '#강남#역삼역#백반#강남백반#방탄소년단', 6, 21);     
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'bbb', 'noimg.png', '캐슈너트', '종로구 삼청동 150-1', '강북', '070-2288-3388', '양식, 스테이크, 스파게티', '2만원-4만원대',  
        '11:00-19:00', '월요일', '스테이크', '25000원', '스파게티', '16000원', '샐러드', '12000원',
        '#경복궁역#안국역#경복궁역맛집#경복궁맛집', 11, 19);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'bbb', '원신등장인물카에데하라 카즈하 (Kaedehara Kazuha).png', '카즈하스시', '서울시 종로구 평창동 451 - 1', '강북', '010-328-3341', '일식, 회, 초밥', 
'2만원 - 5만원대', '오후 12시 - 오후 10시', '월요일, 금요일', '모듬초밥', '21000원', '모듬사시미', '35000원', '카즈하 코스 요리', '50000원',
        '#평창동#경복국역#일식#회#스시#초밥#원신', 12, 22);
         

insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'bbb', 'faker.png', '페이커등심', '경기도 고양시 일산서구 호수동 155-7', '경기 북부', '010-1557-1557', '한식, 고기, 소고기', 
'3만원 - 10만원', '오전 11시 - 오후 10시', '월요일, 화요일', '한우 등심 1인분', '31000원', '한우 채끝 1인분', '43000원', '한우 모둠 세트', '100000원',
        '#일산#호수공원#소고기#호수공원고기#페이커', 11, 22);

insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'bbb', 'parkbogum.jpg', '보검복지부', '서울시 강남구 청담동 32-2', '강남', '010-1227-3721', '한식, 고기, 소고기', 
'2만원 - 5만원대', '오전 10시 - 오후 10시', '일요일', '육회비빔밥', '21000원', '차돌 된장 정식', '25000원', '한우 등심 정식', '53000원',
        '#강남#강남구청#청담#소고기#밥보검', 10, 22);

insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'bbb', 'bts.jpg', '뷔스파게티', '서울시 강남구 청담동 11-1' ,'강남', '010-1117-1171', '양식, 파스타, 스파게티', 
'2만원 - 5만원', '오전 11시 - 오후 9시', '월요일', '어란 파스타', '24000원', '봉골레 파스타', '15000원', '해물 모둠 파스타', '47500원',
        '#강남#강남구청#청담동#청담동파스타#파스타', 11, 21);  
        
    commit;

UPDATE STORE SET slati = 37.60954605745158, slongti = 126.97386634391374, sconfirm = 'Y' where sno = 9 ; 
       
UPDATE STORE SET   sReplycnt = sReplycnt +1 ,
                   sScore = sScore +3
                   WHERE SNo = 31;
UPDATE STOREREVIEW SET   srimage1 = 'noimg.png' , srimage2 = 'noimg.png' , srimage3 = 'noimg.png' , srimage4 = 'noimg.png' , srimage5 = 'noimg.png' 
                   WHERE SNo = 3;