---------------------------------- 민우 시작 ---------------------------------------------
----------------------------------------------------------------------
--                          MEMBER.Xml                              --
----------------------------------------------------------------------
--(1)  id = memberLogin (로그인)
SELECT * FROM MEMBER WHERE MID ='aaa' and mpw='1';
--(2)  id = memberJoin (회원가입) 
INSERT INTO MEMBER VALUES('son', '손흥민','1', '010-6789-6789','son@naver.com','서울시 강남구 청담동','남자','1992/07/08','1.jpg');
--(3)  id = memberSearchId(아이디 찾기)
SELECT MID FROM MEMBER WHERE MNAME = '손흥민' AND MEMAIL ='son@naver.com' ;
--(4)  id = memberSearchPw(비밀번호 찾기)
SELECT Mpw FROM MEMBER WHERE MID = 'son' AND Mname ='손흥민' ;
--(5)  id = memberGetDetail (mid로 dto가져오기)
SELECT * FROM MEMBER WHERE MID='son';
--(6)  id = memberModify(회원정보 수정)
UPDATE MEMBER SET MPW = '111',
                  MNAME = '손흥민',
                  mtel = '010-0000-1111',
                  memail = 'sony@naver.com',
                  maddress = '서울시 강남구 대치동',   
                  mprofile = 'son.jpg'
                 where mid = 'son';
--(7) id= memberTotCnt( 회원수)                 
select count(*)cnt from member;
commit;
--(8) id=memberWithdrawal (회원탈퇴)
delete from member where mid = 'carlos';
rollback;
select * from qna;

----------------------------------------------------------------------
--                           QnA.xml                              --
----------------------------------------------------------------------
-- id = qnaTotCnt (글 갯수)   
SELECT COUNT(*)CNT FROM QNA;
--(1) id= qnaList (문의글 목록 paiging처리, 최신글 순  )
SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
    (select qno, qid, qsubject, qcontent, qhit, qgroup, qstep, qrdate, qsecret,
    (select count(*) from qna where qno=q.qno and qstep>0 ) replyok
    from qna Q order by qgroup)A)
    WHERE RN BETWEEN 1 AND 3;



-- 답변완료 여부 나타내는 페이징 리스트(질문글만 보이게) - 희석 추가
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE QSTEP=0 ORDER BY QRDATE DESC) A)
    WHERE RN BETWEEN 1 AND 10;

-- 질문글 총 갯수 for paging - 희석 추가
SELECT COUNT(*) FROM QNA WHERE QSTEP=0;

-- 답변안된 질문만 보기 - 희석 추가
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE QSTEP=0 AND QREPLYCHECK=0 ORDER BY QRDATE DESC) A)
    WHERE RN BETWEEN 2 AND 3;

-- 답변안된 질문글 총 갯수 for paging - 희석 추가
SELECT COUNT(*) FROM QNA WHERE QSTEP=0 AND QREPLYCHECK=0;

-- 답변만 보기 - 희석 추가
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE QSTEP!=0 ORDER BY QRDATE DESC) A)
    WHERE RN BETWEEN 2 AND 3;

-- 답변들 총 갯수 - 희석 추가
SELECT COUNT(*) FROM QNA WHERE QSTEP!=0;

-- 원글 상세보기
SELECT * FROM QNA WHERE QGROUP=1 AND QSTEP=0;
-- 답글 상세보기
SELECT * FROM QNA WHERE QGROUP=1 AND QSTEP!=0;

    
--(2) id = qnaWrite (문의글 작성)
INSERT INTO QNA (qno,qid,qsubject,qcontent,qhit,qgroup,qstep,qrdate)VALUES(QNA_SQ.NEXTVAL, 'son','질문이 있습니다1','광고 가능한가요3?',0,QNA_SQ.CURRVAL,0,SYSDATE);
SELECT * FROM QNA;
--(3) id = qnaModify (문의글 수정) 제목, 내용 
update qna set 
    qsubject = '질문',
    qcontent = '업체문의는 어디서 해야하나요'   
    where qno = 1;
--(4) id = qnaDetail (문의글 상세보기) 
select * from qna where qno=1;
--() id = qnaHitup(조회수 증가)
update qna set qhit = qhit +1 where qno=2;
--(4) id = qnaReplyPre (답변글 쓰기 전 step A)
UPDATE  QNA SET QSTEP=QSTEP +1 WHERE QGROUP = 1 ;
SELECT * FROM QNA  ORDER BY QGROUP ;
--(4) id = qnaReplyWrite (문의글 답변)
INSERT INTO QNA (QNO, QID, QSUBJECT, QCONTENT,QGROUP,QSTEP, QREPLYCHECK)
    VALUES (QNA_SQ.NEXTVAL, '관리자','1번글 답변','연락 드리겠습니다',1,1, 1);
--(4) id = qnaReplyAfter (답변이 완료되면 제목에 답변완료 추가)
select qno, qid, qsubject, qcontent,qhit, qgroup, qstep, qrdate, qsecret,
    (select count(*) from qna where qno=q.qno and qstep>0 ) replyok
  from qna Q order by qgroup; -- <c:if test="${replyok eq 1 and qstep eq 0 }"> 답변완료</c:if>
  
-- id= qnaList (문의글 목록 paiging처리, 최신글 순, 답변완료 여부  )
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY QRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 3;
 
--(5) id = qnaReplyDelete (문의글 삭제)
DELETE FROM QNA WHERE QNO= 11;
COMMIT;


----------------------------------- 민우 끝 ---------------------------------------------

---------------------------------- 진우 시작 ---------------------------------------------
-------------OWNER
-- OWNER 회원가입시 ID 중복체크
SELECT COUNT(*) FROM OWNER WHERE OID = 'dlwlsdn';
-- OWNER 회원가입
INSERT INTO OWNER (OID, ONAME, OPW, OPROFILE, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner1', '김사장', 1, '010-5555-5555', 'owner@naver.com', '서울시', '19880808', '남자');
SELECT * FROM OWNER;
-- OWNER 로그인
SELECT * FROM OWNER WHERE OID='owner1' AND OPW='1';

-- OID로 DTO가져오기(정보 가져오기)
SELECT * FROM OWNER WHERE OID='owner1';

-- 사장님 회원정보 수정
UPDATE OWNER SET ONAME='이사장',
                    OPW='1',
                    OTEL='010-1111-1111',
                    OEMAIL='owner@daum.net',
                    OADDRESS='제주도',
                    OBIRTH='19880809'
                WHERE OID='owner1';

-- 사장님 회원탈퇴
DELETE FROM OWNER WHERE OID='owner1';

-- 사장님 ID찾기
SELECT OID FROM OWNER WHERE ONAME='김사장' AND OEMAIL='owner@naver.com';
-- 사장님 PW찾기
SELECT OPW FROM OWNER WHERE OID='owner1' AND ONAME='김사장';

-------------OWNERBOARD
-- 등록된 글수
SELECT COUNT(*) FROM OWNERBOARD;

-- 글 목록
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM (SELECT * FROM OWNERBOARD ORDER BY BNO DESC) A)
         WHERE RN BETWEEN 1 AND 3;
-- 글작성
INSERT INTO OWNERBOARD (BNO, OID, SNAME, BLOC, BTITLE, BCONTENT, BPHOTO1, BPHOTO2, BPHOTO3, BPHOTO4, BPHOTO5, BHIT, BDATE) 
    VALUES (SEQ_OB.NEXTVAL , 'owner1', '오미라식당', '강남', '장사 안돼요', '장사가 진짜 안됩니다 요즘', 'img1.jpg', NULL, NULL, NULL, NULL, 0, SYSDATE);
-- 글상세보기
SELECT * FROM OWNERBOARD WHERE BNO = 3;
-- 글수정
UPDATE OWNERBOARD SET BTITLE = '장사 잘돼요',
                        BCONTENT = '갑자기 장사 잘돼요',
                        BPHOTO1 = 'img2.png',
                        BPHOTO2 = 'img5.png',
                        BPHOTO3 = 'img4.png',
                        BPHOTO4 = 'img1.png',
                        BPHOTO5 = NULL
                    WHERE BNO=2;
-- 글삭제
DELETE FROM OWNERBOARD WHERE BNO = 1;

-- 조회수 올리기
UPDATE OWNERBOARD SET BHIT = BHIT +1
    WHERE BNO =2;
-------------BOARD_COMMENT
select * from owner;
-- 댓글 갯수
SELECT COUNT(*) FROM BOARD_COMMENT WHERE BNO=1;

-- 댓글 목록
SELECT * FROM BOARD_COMMENT WHERE BNO=3 ORDER BY CNO;

-- 댓글 작성
INSERT INTO BOARD_COMMENT (CNO, BNO, OID, CCONTENT, CDATE)
    VALUES (SEQ_BC.NEXTVAL, 3, 'owner1', '요즘 경기어렵죠', SYSDATE);

-- 댓글 삭제
DELETE FROM BOARD_COMMENT WHERE CNO=1;

-- 댓글 수정
UPDATE BOARD_COMMENT SET CCONTENT = '요즘 경기좋죠';

commit;

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

---------------------------------- 지환 시작 ---------------------------------------------
-- ryu DML store / storereview / request queries

-- table store
-- 1. storeRegister / 가게 등록하기
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sstart, sEnd) 
values (store_sq.nextval, 'aaa', 'noimg.jpg', '군옥각2', '리월시 취헌부', '강남', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-20:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '10000원',
        '#강남#강남역#강남역맛집#중국집#중화요리#중국요리', 11, 20);
        
-- 2. storeModify / 가게 정보 수정하기
update store set sImage = 'modify.jpg',
                 sName = '청진각',
                 sAddress = '리월시 칠성부 옥형성면',
                 sTel = '010-9998-8888',
                 sType = '중식', 
                 sPrice = '1만원-2만원대',
                 sTime = '24시간' ,
                 sStart = 9,
                 sEnd = 22,
                 sHoliday = '설날, 추석, 공휴일',
                 sMenu1 = '황금새우볼튀김',
                 sMenu1cost = '15000원',
                 sMenu2 = '리월두부',
                 sMenu2cost = '11500원',
                 sMenu3 = '용수면',
                 sMenu3cost = '9500원', 
                 sSearchtag = '#리월#리월맛집#옥형성#각청'
                 where sNo = 3 and oId = 'aaa'; 
                 
-- 3. storeDetail / 가게 정보 상세보기 (sNo로 DTO 불러오기)
SELECT * FROM STORE WHERE SNO = 1;


-- 4. storeDelete / 가게 정보 삭제 (해당 가게 사장님 아이디 / 관리자 사용 가능)
DELETE Store where sNo = 5 and oId = 'aaa';
commit;

-- 5. storeScore 해당 가게 평점 출력하기 (메인 페이지에 이와 같이 출력)
                 
SELECT SIMAGE, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) STSCORE FROM STORE where sNo = 1 order by stscore;

-- 5. 0. storeCnt 등록 완료된 가게 숫자세기

select count(*) cnt from store where sConfirm = 'Y';

-- 5. 0. storeSearchCnt 가게 숫자세기
select count(*) cnt from store where ssearchtag like '%'||'강남'||'%'  and sConfirm = 'Y'; 

-- 5 - 1. storeList / 가게 리스트 페이징하기
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
    (SELECT SNO, SIMAGE, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) STSCORE 
     FROM STORE order by STSCORE desc)A)
     WHERE RN BETWEEN 1 AND 50;
     
-- 5 - 2. storeListSearch / 가게 리스트 페이징하기
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
    (SELECT SNO, SIMAGE, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) STSCORE 
     FROM STORE where sSearchtag like '%'||'강남역'||'%' and sConfirm = 'Y' order by STSCORE desc)A)
     WHERE RN BETWEEN 1 AND 50;
     
     
-- 5 - 3. storeListNew / 가게 리스트 페이징하기
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
    (SELECT SNO, SIMAGE, SNAME, SLOCATION, STYPE, Round((sScore/sReplycnt), 1) STSCORE 
     FROM STORE where sConfirm = 'Y' order by sno desc)A)
     WHERE RN BETWEEN 1 AND 50;

-- 5 - 4. myStoreList / 가게 리스트 페이징하기
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
    (SELECT SNO, SIMAGE, SNAME, SLOCATION, STYPE 
     FROM STORE where oid = 'bbb' order by sno desc)A)
     WHERE RN BETWEEN 1 AND 50; 
commit;     

-- 6. 1. storeScoreUp     
UPDATE STORE SET   sReplycnt = sReplycnt +1 ,
                   sScore = sScore + 5
                   WHERE SNo = 2;     

-- table storereview

-- 1. reviewWrite / 가게의 리뷰 쓰기
insert into storereview (srNo, sNo, mId, mProfile, srContent, 
    srImage1, srImage2, srImage3, srImage4, srImage5, srScore, srDate ) 
VALUES (storereview_sq.NEXTVAL, 3, 'aaa', 'noImg.jpg', '여기 너무 맛있어요',
        'noImg.png', 'noImg.png', 'noImg.png', 'noImg.png', 'noImg.png',
         4 , sysdate); 
               
         
-- 1. - 1. addScore / 가게의 평점 등록 (reviewWrite와 동시에 이뤄지며 score + 숫자에는 srScore 가 들어갈 예정)         
UPDATE STORE SET   sReplycnt = sReplycnt + 1 ,
                   sScore = sScore + 3
                   WHERE SNO = 6; 

-- 2. 0. reviewCnt / 리뷰 숫자 세기 (페이징용)

select count(*) cnt from storereview where sno = 3;

-- 2. reviewList / 해당 가게의 리뷰 목록 조회하기

select * from storereview where sno = 1 order by srno desc;
select * from
    (select rownum RN, A.* from
    (select * from storereview where sno = 3 order by srno desc)A)
    where RN BETWEEN 1 and 5;
        
-- 3. reviewModify / 특정 리뷰 수정
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

-- 5.reviewDetail (srno로 dto)
select * from storereview where srno = 1;
 
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
select rno, oid, sno, sname, rdate from request where oid = 'ccc' order by rno desc;
    
-- 3. requestDone / 확인 후 업체 등록 (관리자용) sno(가게번호)로 두 테이블에 update 진행
 
update request set sname = CONCAT( sname, ' - 처리 완료 ') where sno = 1; 
update request set sname = '카즈하스시' where sno = 9;

update store set sConfirm = 'Y' where sno = 9;

commit; 

----------------------------------- 지환 끝 ---------------------------------------------






