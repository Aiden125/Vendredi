-- ----------OWNER DATA
INSERT INTO owner (oid, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner2', '박사장', 1, '010-1111-1111', 'ownerPARK@naver.com', '서울시', '19900708', '여자');
INSERT INTO OWNER (OID, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner3', '이사장', 1, '010-7777-7777', 'ownerLEE@naver.com', '전주시', '19991010', '남자');
INSERT INTO OWNER (OID, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner4', '최사장', 1, '010-3333-3333', 'ownerCHOI@naver.com', '광명시', '19670812', '남자');
INSERT INTO OWNER (OID, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner5', '윤사장', 1, '010-9999-9999', 'ownerYOON@naver.com', '천안시', '19910427', '여자');

-- ----------OWNERBOARD DATA
INSERT INTO OWNERBOARD (BNO, OID, SNAME, BLOC, BTITLE, BCONTENT, BPHOTO1, BPHOTO2, BPHOTO3, BPHOTO4, BPHOTO5, BHIT, BDATE) 
    VALUES (SEQ_OB.NEXTVAL , 'owner2', '보승회관', '강남', '진상손님', '진상손님 많아요', 'img1.jpg', NULL, NULL, NULL, NULL, 0, SYSDATE);
INSERT INTO OWNERBOARD (BNO, OID, SNAME, BLOC, BTITLE, BCONTENT, BPHOTO1, BPHOTO2, BPHOTO3, BPHOTO4, BPHOTO5, BHIT, BDATE) 
    VALUES (SEQ_OB.NEXTVAL , 'owner3', '보배반점', '제주', '짜장면짱', '짬뽕도짱', 'img1.jpg', NULL, NULL, NULL, NULL, 0, SYSDATE);
INSERT INTO OWNERBOARD (BNO, OID, SNAME, BLOC, BTITLE, BCONTENT, BPHOTO1, BPHOTO2, BPHOTO3, BPHOTO4, BPHOTO5, BHIT, BDATE) 
    VALUES (SEQ_OB.NEXTVAL , 'dlwlsdn', '강식당', '건대', '내가게는', '음식내용', NULL, NULL, NULL, NULL, NULL, 0, SYSDATE);
INSERT INTO OWNERBOARD (BNO, OID, SNAME, BLOC, BTITLE, BCONTENT, BPHOTO1, BPHOTO2, BPHOTO3, BPHOTO4, BPHOTO5, BHIT, BDATE) 
    VALUES (SEQ_OB.NEXTVAL , 'dlwlsdn', '윤식당', '건대', '내가게는', '음식내용', NULL, NULL, NULL, NULL, NULL, 0, SYSDATE);

-- 페이징을 위한 나머지 DATA는 JAVA로 삽입
SELECT * FROM OWNER WHERE ONAME='이진우' AND OID='dlwlsdn11';
------------OWNERBOARD DATA
INSERT INTO BOARD_COMMENT (CNO, BNO, OID, CCONTENT, CDATE)
    VALUES (SEQ_BC.NEXTVAL, 3, 'owner5', '못살겠어요', SYSDATE);
INSERT INTO BOARD_COMMENT (CNO, BNO, OID, CCONTENT, CDATE)
    VALUES (SEQ_BC.NEXTVAL, 4, 'owner2', '맞죠맞죠~', SYSDATE);
INSERT INTO BOARD_COMMENT (CNO, BNO, OID, CCONTENT, CDATE)
    VALUES (SEQ_BC.NEXTVAL, 5, 'owner4', '볶음밥도 짱', SYSDATE);

insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'aaa', 'noimg.jpg', '군옥각', '리월시 취헌부', '강남', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-19:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '10000원', '#강남#강남역#강남역맛집#중국집#중화요리#중국요리',
        11, 19);
commit;