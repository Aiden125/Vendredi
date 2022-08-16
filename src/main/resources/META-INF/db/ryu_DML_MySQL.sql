-- ryu DML store / storereview / request queries

-- table store
-- 1. storeRegister / 가게 등록하기
INSERT INTO STORE (sno, oid, simage1, simage2, simage3, sname, saddress, slocation, stel, stype, sprice, stime, sholiday,
            smenu1 , smenu1cost , smenu2, smenu2cost, smenu3, smenu3cost, ssearchtag, sstart, send) 
VALUES ((SELECT GET_STORE_SEQ('sno')), 'owner2', 'noimg.jpg', 'noimg.jpg', 'noimg.jpg', '군옥각2', '리월시 취헌부', '강남', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-20:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '10000원',
        '#강남#강남역#강남역맛집#중국집#중화요리#중국요리', 11, 20);
        
-- 2. storeModify / 가게 정보 수정하기
UPDATE STORE SET simage1 = 'modify.jpg',
                 simage2 = 'modify.jpg',
                 simage3 = 'modify.jpg',
                 sname = '청진각',
                 saddress = '리월시 칠성부 옥형성면',
                 stel = '010-9998-8888',
                 stype = '중식', 
                 sprice = '1만원-2만원대',
                 stime = '24시간' ,
                 sstart = 9,
                 send = 22,
                 sholiday = '설날, 추석, 공휴일',
                 smenu1 = '황금새우볼튀김',
                 smenu1cost = '15000원',
                 smenu2 = '리월두부',
                 smenu2cost = '11500원',
                 smenu3 = '용수면',
                 smenu3cost = '9500원', 
                 ssearchtag = '#리월#리월맛집#옥형성#각청'
                 where sNo = 3 and oId = 'aaa'; 
                 
-- 3. storeDetail / 가게 정보 상세보기 (sNo로 DTO 불러오기)
SELECT * FROM STORE WHERE sno = 1;


-- 4. storeDelete / 가게 정보 삭제 (해당 가게 사장님 아이디 / 관리자 사용 가능)
DELETE FROM STORE WHERE sno = 5 and oid = 'aaa'; 

-- 5. storeScore 해당 가게 평점 출력하기 (메인 페이지에 이와 같이 출력)
                 
SELECT simage1, sname, slocation, stype, Round((sscore/sreplycnt), 1) stscore FROM STORE WHERE sno = 1 ORDER BY stscore;

-- 5. 0. storeCnt 등록 완료된 가게 숫자세기

SELECT COUNT(*) cnt FROM STORE WHERE sconfirm = 'Y';

-- 5. 0. storeSearchCnt 가게 숫자세기
SELECT COUNT(*) cnt FROM STORE WHERE ssearchtag like '%'||'강남'||'%'  and sconfirm = 'Y'; 

-- 5 - 1. storeList / 가게 리스트 페이징하기
SELECT sno, simage1, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) stscore 
     FROM store ORDER BY stscore DESC LIMIT 1, 3;
     
-- 5 - 2. storeListSearch / 가게 리스트 페이징하기  
SELECT sno, simage1, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) stscore 
     FROM store WHERE ssearchtag LIKE '%'||'강남역'||'%' AND sconfirm = 'Y' ORDER BY stscore DESC LIMIT 1, 3;     
     
-- 5 - 3. storeListNew / 가게 리스트 페이징하기
SELECT sno, simage1, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) stscore  
     FROM store where sConfirm = 'Y' order by sno desc limit 1, 5;
-- 5 - 4. myStoreList / 가게 리스트 페이징하기
SELECT sno, simage1, SNAME, SLOCATION, STYPE 
     FROM STORE WHERE oid = 'owner2' ORDER BY sno DESC LIMIT 1, 3;   

-- 6. 1. storeScoreUp     
UPDATE STORE SET   sreplycnt = sreplycnt +1 ,
                   sscore = sscore + 5
                   WHERE sno = 2;     

-- table storereview

-- 1. reviewWrite / 가게의 리뷰 쓰기
INSERT INTO storereview (srno, sno, mid, mprofile, srcontent, 
    srimage1, srscore) 
VALUES ((SELECT GET_STOREREVIEW_SEQ('srno')), 2, 'aaa', 'noImg.jpg', '여기 너무 맛있어요',
        'noImg.png', 4); 

SELECT * FROM STORE;
         
-- 1. - 1. addScore / 가게의 평점 등록 (reviewWrite와 동시에 이뤄지며 score + 숫자에는 srScore 가 들어갈 예정)         
UPDATE STORE SET   sreplycnt = sreplycnt + 1 ,
                   sscore = sscore + 3
                   WHERE sno = 6; 

-- 2. 0. reviewCnt / 리뷰 숫자 세기 (페이징용)

SELECT COUNT(*) cnt FROM STOREREVIEW WHERE sno = 3;

-- 2. reviewList / 해당 가게의 리뷰 목록 조회하기
 
SELECT * FROM STOREREVIEW WHERE sno = 3 ORDER BY srno DESC LIMIT 1, 3;
        
-- 3. reviewModify / 특정 리뷰 수정
UPDATE STOREREVIEW SET 
            srcontent = '이거 진짜 맛있어요!',
            srimage1 ='review1.png'
            WHERE srno = 18;

-- 4. reviewDelete / 해당 리뷰 삭제
DELETE FROM STOREREVIEW WHERE srno = 18;  
commit;

-- 5.reviewDetail (srno로 dto)
SELECT * FROM STOREREVIEW WHERE srno = 1;
 
-- table request

-- 1. writeRequest / 사업자가 가게 등록과 동시에 등록 요청
INSERT INTO REQUEST (rno, sno, oid, sname)
values ((SELECT get_request_seq('rno')), 3, 'owner2', '청진각');

-- 2. 0. requestCnt / 리퀘스트 수 (페이징용)

SELECT COUNT(*) cnt FROM REQUEST;

-- 2. requestList / 전체 리퀘스트 목록 조회 (페이징)
SELECT * FROM REQUEST order by rno desc limit 1, 3;
    
-- 2 - 1. myRequestList / 사업자 개인 리퀘스트 조회
SELECT rno, oid, sno, sname, rdate FROM REQUEST WHERE oid = 'ccc' ORDER BY rno DESC;
    
-- 3. requestDone / 확인 후 업체 등록 (관리자용) sno(가게번호)로 두 테이블에 update 진행
 
UPDATE REQUEST SET sname = CONCAT( sname, ' - 처리 완료 ') where sno = 1; 
UPDATE REQUEST SET sname = '카즈하스시' where sno = 9;

UPDATE REQUEST SET sconfirm = 'Y' where sno = 9;

commit;

SELECT * FROM OWNER;
                 
-- STORELIKE TABLE

-- 1. 0. 내 찜한 목록 갯수 세기 myLikeCnt
SELECT * FROM StoreLike;
SELECT COUNT(*) cnt FROM STORELIKE WHERE mid = 'aaa'; 

-- 1. 1. 내 찜한 목록 출력하기 myLikeList
SELECT * FROM STORELIKE WHERE mid = 'aaa'
    ORDER BY slno DESC LIMIT 1, 3;
    
-- 2. 해당 가게 찜하기 insertLike

INSERT INTO STORELIKE (slno, sno, mid, sname) VALUES ((SELECT get_storeLike_seq('slno')), 2, 'aaa', '카즈하스시');
                 
-- 3. 해당 가게 찜 삭제하기 deleteLike

DELETE FROM STORELIKE WHERE mid = 'aaa' and sno = 7;

-- 4. 해당 가게 찜 여부 likeCnt
                 
SELECT COUNT(*) cnt FROM STORELIKE WHERE mid = 'aaa' and sno = 7;                 
                 
 -- 5. likeDetail

SELECT * FROM STORELIKE WHERE sno= 2;
       
                 