-- ryu DML store / storereview / request queries

-- table store
-- 1. storeRegister / 가게 등록하기
insert into store (sNo, oId, sImage, sName, sAddress, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sMenu4, sMenu4cost,
            sMenu5, sMenu5cost, sSearchtag) 
values (store_sq.nextval, 'chinachef', 'noimg.jpg', '군옥각', '리월시 취헌부', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-19:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '10000원', '간짜장', '7500원', '굴짬뽕', '9000원',
        '#강남#강남역#강남역맛집#중국집#중화요리#중국요리');
-- 2. storeModify / 가게 정보 수정하기
update store set sImage = 'modify.jpg',
                 sName = '청진각',
                 sAddress = '리월시 칠성부 옥형성면',
                 sTel = '010-9998-8888',
                 sType = '중식', 
                 sPrice = '1만원-2만원대',
                 sTime = '24시간' ,
                 sHoliday = '설날, 추석, 공휴일',
                 sMenu1 = '황금새우볼튀김',
                 sMenu1cost = '15000원',
                 sMenu2 = '리월두부',
                 sMenu2cost = '11500원',
                 sMenu3 = '용수면',
                 sMenu3cost = '9500원',
                 sMenu4 = '마라전골',
                 sMenu4cost = '13500원',
                 sMenu5 = '훠궈',
                 sMenu5cost = '13400원',
                 sSearchtag = '#리월#리월맛집#옥형성#각청'
                 where sNo = 2 and oId = 'aaa'; 
                 
-- 3. storeDetail / 가게 정보 상세보기 (sNo로 DTO 불러오기)
SELECT * FROM STORE WHERE SNO = 1;


-- 4. storeDelete / 가게 정보 삭제 (해당 가게 사장님 아이디 / 관리자 사용 가능)
DELETE Store where sNo = 2 and oId = 'aaa';

-- 5. 해당 가게 평점 출력하기 (메인 페이지에 이와 같이 출력)
                 
SELECT SNAME, STYPE, (sScore/sReplycnt)STSCORE FROM STORE; 

-- table storereview
insert into storereview (srNo, sNo, mProfile, mId, srContent, 
    srImage1, srImage2, srImage3,  srImage4, srImage5, srScore, srDate )
VALUES (storereview_sq.NEXTVAL, 1, 'noImg.png', 'aaa', '여기 너무 맛있어요',
        'noImg.png', 'noImg.png', 'noImg.png', 'noImg.png', 'noImg.png',
         4 , sysdate);
         
-- table request
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 