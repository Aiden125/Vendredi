---------------------------------- 지환 시작 ---------------------------------------------

-- table store
-- 1. storeRegister / 가게 등록하기
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sMenu4, sMenu4cost,
            sMenu5, sMenu5cost, sSearchtag) 
values (store_sq.nextval, 'aaa', 'noimg.jpg', '군옥각2', '리월시 취헌부', '강남', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
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
                 where sNo = 3 and oId = 'aaa'; 
                 
-- 3. storeDetail / 가게 정보 상세보기 (sNo로 DTO 불러오기)
SELECT * FROM STORE WHERE SNO = 1;


-- 4. storeDelete / 가게 정보 삭제 (해당 가게 사장님 아이디 / 관리자 사용 가능)
DELETE Store where sNo = 2 and oId = 'aaa';

-- 5. 해당 가게 평점 출력하기 (메인 페이지에 이와 같이 출력)
                 
SELECT SIMAGE, SNAME, SLOCATION, STYPE, (sScore/sReplycnt)STSCORE FROM STORE WHERE SNO = 1 order by stscore;

-- 5 - 1. storeList / 가게 리스트 페이징하기
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
    (SELECT SNAME, SIMAGE,  SLOCATION, STYPE, (sScore/sReplycnt)STSCORE 
     FROM STORE order by STSCORE desc)A)
     WHERE RN BETWEEN 1 AND 50;



-- table storereview

-- 1. reviewWrite / 가게의 리뷰 쓰기
insert into storereview (srNo, sNo, mProfile, mId, srContent, 
    srImage1, srImage2, srImage3,  srImage4, srImage5, srScore, srDate ) 
VALUES (storereview_sq.NEXTVAL, 3, 'noImg.png', 'aaa', '여기 너무 맛있어요',
        'noImg.png', 'noImg.png', 'noImg.png', 'noImg.png', 'noImg.png',
         4 , sysdate); 
               
         
-- 1. - 1. addScore / 가게의 평점 등록 (reviewWrite와 동시에 이뤄지며 score + 숫자에는 srScore 가 들어갈 예정)         
UPDATE STORE SET   sReplycnt = sReplycnt + 1 ,
                   sScore = sScore + 3
                   WHERE SNO = 1;

-- 2. 0. reveiwCnt / 리뷰 숫자 세기 (페이징용)

select count(*) cnt from storereview where sno = 1;

-- 2. reviewList / 해당 가게의 리뷰 목록 조회하기

select * from storereview where sno = 1 order by srno desc;
select * from
    (select rownum RN, A.* from
    (select * from storereview where sno = 1 order by srno desc)A)
    where RN BETWEEN 1 and 5;
        
-- 3. modifyDelete / 특정 리뷰 수정
update storereview set 
            srcontent = '이거 진짜 맛있어요!',
            srimage1 ='review1.png',
            srimage2 ='review2.png',
            srimage3 ='review3.png',
            srimage4 ='review4.png',
            srimage5 ='review5.png'
            where srno = 18;

-- 4. reviewDelete / 해당 리뷰 삭제
delete storereview where srno = 18;  
commit;
 
-- table request

-- 1. writeRequest / 사업자가 가게 등록과 동시에 등록 요청
insert into request (rNo, sNo, oid, sName, rdate)
values (REQUEST_SQ.nextval, 3, 'aaa', '청진각', sysdate );

-- 2. 0. requestCnt / 리퀘스트 수 (페이징용)

select count(*) cnt from request;

-- 2. requestList / 전체 리퀘스트 목록 조회 (페이징)
select * from
    (select rownum RN, A.* from
    (select * from request order by rno desc)A)
    where RN BETWEEN 1 and 5;
-- 2 - 1. myRequestList / 사업자 개인 리퀘스트 조회
select rno, sno, sname from request where oid = 'aaa' order by rno desc;
    
-- 3. requestDone / 확인 후 업체 등록 (관리자용) sno(가게번호)로 두 테이블에 update 진행

update request set sname = CONCAT( sname, ' - 처리 완료 ') where sno = 1; 
update store set sConfirm = 'Y' where sno = 1;


----------------------------------- 지환 끝 ---------------------------------------------







---------------------------------- 민우 시작 ---------------------------------------------


----------------------------------- 민우 끝 ---------------------------------------------









---------------------------------- 진우 시작 ---------------------------------------------


----------------------------------- 진우 끝 ---------------------------------------------

















----------------------------------- 희석 시작 ---------------------------------------------
-- 관리자 등록(adminJoin)
INSERT INTO ADMIN
    VALUES('moan125', '1234', 'moan125@naver.com', '문희석', '010-9284-3694', 2);
    

-- 관리자 로그인(adminLogin)
SELECT * FROM ADMIN WHERE aID='moan125' AND aPW='1234';


-- 관리자 정보수정(adminModify)
UPDATE ADMIN SET aPW='1234',
                aEMAIL='moan125@naver.com',
                aNAME='문희석',
                aTEL='010-9284-3694',
                aLEVEL='MASTER'
    WHERE aID='moan125';


-- 관리자 리스트(adminList)
SELECT aID, aPW, aEMAIL, aNAME, aTEL, L.aLEVEL_NAME
    FROM ADMIN A, ADMIN_L L
    WHERE A.aLEVEL=L.aLEVEL
    ORDER BY A.aLEVEL;
    
    
-- 관리자 삭제(adminDelete)
DELETE ADMIN WHERE aID='ddd';
----------------------------------- 희석 끝 ---------------------------------------------







