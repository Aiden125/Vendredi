---------------------------------- 지환 시작 ---------------------------------------------
commit;   
UPDATE STORE SET SCONFIRM = 'Y';
SELECT * FROM STORE;
SELECT * FROM STOREreview;
select * from store where sno = 6;
delete store where sno between 22 and 30;
SELECT SIMAGE, SNAME,  SLOCATION, STYPE, Round((sScore/sReplycnt), 1) STSCORE FROM STORE where sNo = 1; -- 가게 평점 
select STORE_SQ.nextval from dual;
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'noimg.png', '군옥각 본점', '강남구 역삼동 31-1', '강남', '070-8888-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-20:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '11000원',
        '#강남#강남역#강남역맛집#중국집#중화요리', 11, 20);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'noimg.png', '군옥각 종로점', '종로구 관훈동 37-2 2층', '강북', '070-2238-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '11:00-19:00', '금요일', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '11000원',
        '#종각역#인사동#인사동맛집#중국집#중화요리', 11, 19);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'noimg.png', '군옥각 홍대점', '서울 마포구 동교동 22-1 1층', '강북', '070-1138-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '24시간', '없음', '짜장면', '5000원', '짬뽕', '6000원', '탕수육', '11000원',
        '#홍대역#홍대입구#홍대맛집#중국집#중화요리', 9, 24);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'noimg.png', '각청각 본점', '서울 마포구 동교동 35 옥형빌딩 1층', '강북', '070-3318-8888', '중식, 중국요리, 짜장면', '2만원-4만원대',  
        '24시간', '없음', '황금새우볼튀김', '15000원', '리월두부', '11600원', '용수면', '95000원',
        '#홍대역#홍대입구#홍대맛집#중국집#중화요리', 9, 24);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'bts_d.jpg', '방탄백반', '서울시 강남구 역삼1동 101-1', '강남', '010-0888-4351', '한식, 백반', '1만원대',  
        'AM 6:00 ~ PM 9:00', '일요일', '가정식 백반', '7000원', '제육볶음', '8000원', '보쌈정식', '13000원',
        '#강남#역삼역#백반#강남백반#방탄소년단', 6, 21);     
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'noimg.png', '캐슈너트', '종로구 삼청동 150-1', '강북', '070-2288-3388', '양식, 스테이크, 스파게티', '2만원-4만원대',  
        '11:00-19:00', '월요일', '스테이크', '25000원', '스파게티', '16000원', '샐러드', '12000원',
        '#경복궁역#안국역#경복궁역맛집#경복궁맛집', 11, 19);
        
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', '원신등장인물카에데하라 카즈하 (Kaedehara Kazuha).png', '카즈하스시', '서울시 종로구 평창동 451 - 1', '강북', '010-328-3341', '일식, 회, 초밥', 
'2만원 - 5만원대', '오후 12시 - 오후 10시', '월요일, 금요일', '모듬초밥', '21000원', '모듬사시미', '35000원', '카즈하 코스 요리', '50000원',
        '#평창동#경복국역#일식#회#스시#초밥#원신', 12, 22);
         
select * from owner;
insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'faker.png', '페이커등심', '경기도 고양시 일산서구 호수동 155-7', '경기 북부', '010-1557-1557', '한식, 고기, 소고기', 
'3만원 - 10만원', '오전 11시 - 오후 10시', '월요일, 화요일', '한우 등심 1인분', '31000원', '한우 채끝 1인분', '43000원', '한우 모둠 세트', '100000원',
        '#일산#호수공원#소고기#호수공원고기#페이커', 11, 22);

insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'parkbogum.jpg', '보검복지부', '서울시 강남구 청담동 32-2', '강남', '010-1227-3721', '한식, 고기, 소고기', 
'2만원 - 5만원대', '오전 10시 - 오후 10시', '일요일', '육회비빔밥', '21000원', '차돌 된장 정식', '25000원', '한우 등심 정식', '53000원',
        '#강남#강남구청#청담#소고기#밥보검', 10, 22);

insert into store (sNo, oId, sImage, sName, sAddress, sLocation, sTel, sType, sPrice, sTime, sHoliday,
            sMenu1 , sMenu1cost , sMenu2, sMenu2cost, sMenu3, sMenu3cost, sSearchtag, sStart, sEnd) 
values (store_sq.nextval, 'owner2', 'bts.jpg', '뷔스파게티', '서울시 강남구 청담동 11-1' ,'강남', '010-1117-1171', '양식, 파스타, 스파게티', 
'2만원 - 5만원', '오전 11시 - 오후 9시', '월요일', '어란 파스타', '24000원', '봉골레 파스타', '15000원', '해물 모둠 파스타', '47500원',
        '#강남#강남구청#청담동#청담동파스타#파스타', 11, 21);   

UPDATE STORE SET slati = 37.60954605745158, slongti = 126.97386634391374, sconfirm = 'Y' where sno = 9 ; 
       
UPDATE STORE SET   sReplycnt = sReplycnt +1 ,
                   sScore = sScore +3
                   WHERE SNo = 31;
UPDATE STOREREVIEW SET   srimage1 = 'noimg.png' , srimage2 = 'noimg.png' , srimage3 = 'noimg.png' , srimage4 = 'noimg.png' , srimage5 = 'noimg.png' 
                   WHERE SNo = 3;
select * from store;                   
                   
                   

----------------------------------- 지환 끝 ---------------------------------------------




commit;


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
select * from qna;

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
commit;
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






