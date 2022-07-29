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

-- 글작성
INSERT INTO OWNERBOARD (BNO, OID, SNAME, BLOC, BTITLE, BCONTENT, BPHOTO1, BPHOTO2, BPHOTO3, BPHOTO4, BPHOTO5, BHIT, BDATE) 
    VALUES (SEQ_OB.NEXTVAL , 'owner1', '오미라식당', '강남', '장사 안돼요', '장사가 진짜 안됩니다 요즘', 'img1.jpg', NULL, NULL, NULL, NULL, 0, SYSDATE);

-- 글수정