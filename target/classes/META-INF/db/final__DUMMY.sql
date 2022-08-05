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
--member Dummy
INSERT INTO MEMBER VALUES('aaa', '지코','1', '010-1234-1234','zico@naver.com','서울시 강남구 역삼동','남자','1992/09/14','zico.jpg');
INSERT INTO MEMBER VALUES('kang', '강동원','1', '010-4321-4321','kang@naver.com','서울시 강남구 역삼동','남자','1992/09/14','kang.jpg');
INSERT INTO MEMBER (MID, MNAME, MPW, MTEL, MEMAIL, MADDRESS, MGENDER,MBIRTH) VALUES ('carlos','김민우','111','010-9236-6409','max9236@naver.com','서울시 강남구 청담동','남자','1999/03/21');
commit;
--Q&A Dummy
INSERT INTO QNA (qno,qid,qsubject,qcontent,qhit,qgroup,qstep,qrdate)VALUES(QNA_SQ.NEXTVAL, 'son','가게 사장님과 컨택질문','광고 가능한가요3?',0,QNA_SQ.CURRVAL,0,SYSDATE);
INSERT INTO QNA VALUES(QNA_SQ.NEXTVAL, 'kang','질문이 있습니다1','광고 가능한가요1?',0,QNA_SQ.CURRVAL,0,SYSDATE,'N');
INSERT INTO QNA VALUES(QNA_SQ.NEXTVAL, 'son','질문!!','예약 가능한가요?',0,QNA_SQ.CURRVAL,0,SYSDATE,'N');

----------------------------------- 민우 끝 ---------------------------------------------









---------------------------------- 진우 시작 ---------------------------------------------
------------OWNER DATA
INSERT INTO OWNER (OID, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner2', '박사장', 1, '010-1111-1111', 'ownerPARK@naver.com', '서울시', '19900708', '여자');
INSERT INTO OWNER (OID, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner3', '이사장', 1, '010-7777-7777', 'ownerLEE@naver.com', '전주시', '19991010', '남자');
INSERT INTO OWNER (OID, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner4', '최사장', 1, '010-3333-3333', 'ownerCHOI@naver.com', '광명시', '19670812', '남자');
INSERT INTO OWNER (OID, ONAME, OPW, OTEL, OEMAIL, OADDRESS, OBIRTH, OGENDER)
    VALUES ('owner5', '윤사장', 1, '010-9999-9999', 'ownerYOON@naver.com', '천안시', '19910427', '여자');

------------OWNERBOARD DATA
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






