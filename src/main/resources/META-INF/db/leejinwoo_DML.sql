-------------OWNER
-- OWNER 회원가입시 ID 중복체크
SELECT COUNT(*) FROM OWNER WHERE OID = 'dlwlsdn';

-- OWNER 회원가입
INSERT INTO OWNER (OID, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner2', '김사장', 1, '010-5555-5555', 'owner@naver.com', '서울시', '19880808', '남자');
    
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
                
-- 사장님 본인가게 리스트
SELECT * FROM OWNERBOARD WHERE OID = 'dlwlsdn';

-- 사장님 회원탈퇴
DELETE FROM OWNER WHERE OID='owner1';

-- 사장님 ID찾기
SELECT OID FROM OWNER WHERE ONAME='김사장' AND OEMAIL='owner@naver.com';

-- 사장님 PW찾기
SELECT OPW FROM OWNER WHERE OID='owner1' AND ONAME='김사장';

-- 내 가게 LIST
SELECT * FROM STORE WHERE OID = 'aaa';

-- 내 가게 상세보기
SELECT * FROM STORE WHERE SNO = 1;

-- 예약현황
SELECT R.SNO, R.SNAME, R.MID, MTEL, RDATE, RTIME, RMEMBER
    FROM RESERVATION R, MEMBER M, STORE S, OWNER O 
    WHERE R.MID = M.MID AND S.OID = O.OID AND S.SNO = R.SNO 
    AND O.OID =(SELECT OID FROM OWNER WHERE OID ='aaa')
    ORDER BY RDATE DESC, RTIME DESC;
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
DELETE FROM OWNERBOARD WHERE BNO = 97 ;
DELETE FROM BOARD_COMMENT WHERE BNO = 97;

-- 조회수 올리기
UPDATE OWNERBOARD SET BHIT = BHIT +1
    WHERE BNO =2;
    
-------------BOARD_COMMENT

-- 댓글 갯수
SELECT COUNT(*) FROM BOARD_COMMENT WHERE BNO=1;

-- 댓글 목록
SELECT * FROM BOARD_COMMENT WHERE BNO=2 ORDER BY CNO;

-- 댓글 작성
INSERT INTO BOARD_COMMENT (CNO, BNO, OID, CCONTENT, CDATE)
    VALUES (SEQ_BC.NEXTVAL, 3, 'owner1', '요즘 경기어렵죠', SYSDATE);

-- 댓글 삭제
DELETE FROM BOARD_COMMENT WHERE CNO=1;

-- 댓글 수정
UPDATE BOARD_COMMENT SET CCONTENT = '요즘 경기좋죠';

-------------RESERVATION

-- 예약날짜 확인
SELECT RDATE, RTIME FROM RESERVATION WHERE SNO = 11 AND RDATE > SYSDATE -1; 

-- 예약하기
INSERT INTO RESERVATION (RNO, MID, SNO, SNAME, RDATE, RTIME, RMEMBER)
    VALUES (SEQ_R.NEXTVAL, 'aaa', 1, '군옥각', SYSDATE, 15, 4);

commit;