--MAPPERS
----------------------------------------------------------------------
--                          MEMBER.Xml                              --
----------------------------------------------------------------------
--(1)  id = memberLogin (로그인)
SELECT * FROM MEMBER WHERE MID ='aaa' and mpw='1';
--(2)  id = memberJoin (회원가입) 
INSERT INTO MEMBER VALUES('son', '손흥민','1', '010-6789-6789','son@naver.com','서울시 강남구 청담동','남자','1992/07/08','son.jpg');
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
                  mProfile= 'son1.jpg'
                 where mid = 'son';
--(7) id= memberTotCnt( 회원수)                 
select count(*)cnt from member;
commit;
--(8) id=memberWithdrawal (회원탈퇴)
delete from member where mid = 'son';
rollback;
select * from member;

----------------------------------------------------------------------
--                           QnA.xml                              --
----------------------------------------------------------------------
--(1) id= qnaList (문의글 목록 paiging처리, 최신글 순  )
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY QRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 3;
--(2) id = qnaWrite (문의글 작성)
INSERT INTO QNA VALUES(QNA_SQ.NEXTVAL, 'son','질문이 있습니다4','광고 가능한가요3?',NULL,0,QNA_SQ.CURRVAL,0,SYSDATE,'N');
SELECT * FROM QNA;
--(3) id = qnaModify (문의글 수정) 제목, 내용, 파일첨부만 수정가능 
update qna set 
    qsubject = '질문',
    qcontent = '업체문의는 어디서 해야하나요',
    qfile = '1.jpg'
    where qno = 1;
    