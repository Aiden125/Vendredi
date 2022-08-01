-------------OWNER
-- OWNER 회원가입시 ID 중복체크
SELECT * FROM OWNER WHERE OID = 'owner1';

-- OWNER 회원가입
INSERT INTO OWNER (OID, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner1', '김사장', 1, '010-5555-5555', 'owner@naver.com', '서울시', '19880808', '남자');

-- OWNER 로그인
SELECT * FROM OWNER WHERE OID='owner1' AND OPW=1;

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

<<<<<<< HEAD
<<<<<<< HEAD
-- 글작성
INSERT INTO OWNERBOARD (BNO, OID, SNAME, BLOC, BTITLE, BCONTENT, BPHOTO1, BPHOTO2, BPHOTO3, BPHOTO4, BPHOTO5, BHIT, BDATE) 
    VALUES (SEQ_OB.NEXTVAL , 'owner1', '오미라식당', '강남', '장사 안돼요', '장사가 진짜 안됩니다 요즘', 'img1.jpg', NULL, NULL, NULL, NULL, 0, SYSDATE);

-- 글수정
=======
=======
>>>>>>> 6812274bf540651451d796ec0e6fb9eadb36011d
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
                        BPHOTO1 = 'img2.jpg',
                        BPHOTO2 = NULL,
                        BPHOTO3 = NULL,
                        BPHOTO4 = NULL,
                        BPHOTO5 = NULL;
-- 글삭제
DELETE FROM OWNERBOARD WHERE BNO = 1;

-------------BOARD_COMMENT

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
<<<<<<< HEAD
>>>>>>> d6d4de82dce3f62a47d5858e36fa16aa03b5874d
=======
=======
-- 글작성
INSERT INTO OWNERBOARD (BNO, OID, SNAME, BLOC, BTITLE, BCONTENT, BPHOTO1, BPHOTO2, BPHOTO3, BPHOTO4, BPHOTO5, BHIT, BDATE) 
    VALUES (SEQ_OB.NEXTVAL , 'owner1', '오미라식당', '강남', '장사 안돼요', '장사가 진짜 안됩니다 요즘', 'img1.jpg', NULL, NULL, NULL, NULL, 0, SYSDATE);

-- 글수정
>>>>>>> 1a9829511aa58fe41f738e5d7529b66a665df05d
>>>>>>> 6812274bf540651451d796ec0e6fb9eadb36011d
