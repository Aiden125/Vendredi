--MAPPERS
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
delete from member where mid = 'maxed';
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
    
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY QRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 3;    
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
INSERT INTO QNA (QNO, QID, QSUBJECT, QCONTENT,QGROUP,QSTEP )
    VALUES (QNA_SQ.NEXTVAL, '관리자','1번글 답변','연락 드리겠습니다',1,1);
--(4) id = qnaReplyAfter (답변이 완료되면 제목에 답변완료 추가)
select qno, qid, qsubject, qcontent,qhit, qgroup, qstep, qrdate, qsecret,
    (select count(*) from qna where qno=q.qno and qstep>0 ) replyok
  from qna Q order by qgroup; -- <c:if test="${replyok eq 1 and qstep eq 0 }"> 답변완료</c:if>
  
-- id= qnaList (문의글 목록 paiging처리, 최신글 순, 답변완료 여부  )
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY QRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 3;
 
--(5) id = qnaReplyDelete (문의글 삭제)
DELETE FROM QNA WHERE QNO= 1;
COMMIT;
