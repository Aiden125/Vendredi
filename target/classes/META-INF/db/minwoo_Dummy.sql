--member Dummy
INSERT INTO MEMBER VALUES('aaa', '지코','1', '010-1234-1234','zico@naver.com','서울시 강남구 역삼동','남자','1992/09/14','zico.jpg');
INSERT INTO MEMBER VALUES('kang', '강동원','1', '010-4321-4321','kang@naver.com','서울시 강남구 신사동','남자','1981/01/18','kang.jpg');

--Q&A Dummy
INSERT INTO QNA VALUES(QNA_SQ.NEXTVAL, 'kang','질문이 있습니다','광고 가능한가요?',NULL,0,QNA_SQ.CURRVAL,0,SYSDATE,'N');