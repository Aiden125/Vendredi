---------------------------------- 지환 시작 ---------------------------------------------
-- dummy는 추후 작성예정

-- store storeRegister dummy
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sMenu4, sMenu4cost,
            sMenu5, sMenu5cost, sSearchtag) 
values (store_sq.nextval, 'aaa', 'noimg.jpg', '군옥각', '리월시 취헌부', '강남', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-19:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '10000원', '간짜장', '7500원', '굴짬뽕', '9000원',
        '#강남#강남역#강남역맛집#중국집#중화요리#중국요리');

-- storereview writeReview dummy
insert into storereview (srNo, sNo, mProfile, mId, srContent, 
    srImage1, srImage2, srImage3,  srImage4, srImage5, srScore, srDate ) 
VALUES (storereview_sq.NEXTVAL, 3, 'noImg.png', 'aaa', '여기 너무 맛있어요',
        'noImg.png', 'noImg.png', 'noImg.png', 'noImg.png', 'noImg.png',
         4 , sysdate); 

----------------------------------- 지환 끝 ---------------------------------------------







---------------------------------- 민우 시작 ---------------------------------------------


----------------------------------- 민우 끝 ---------------------------------------------









---------------------------------- 진우 시작 ---------------------------------------------


----------------------------------- 진우 끝 ---------------------------------------------













----------------------------------- 희석 시작 ---------------------------------------------
-- 관리자 데이터 입력

INSERT INTO ADMIN
    VALUES('aaa', '1234', 'lee@naver.com', '이진우', '010-1111-1234', 1);
INSERT INTO ADMIN
    VALUES('bbb', '1234', 'kim@naver.com', '김민우', '010-2222-1234', 1);
INSERT INTO ADMIN
    VALUES('ccc', '1234', 'ryu@naver.com', '류지환', '010-3333-1234', 1);
INSERT INTO ADMIN
    VALUES('ddd', '1234', 'hong@naver.com', '홍길동', '010-4444-1234', 0);
----------------------------------- 희석 끝 ---------------------------------------------






