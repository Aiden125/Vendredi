-- 관리자 데이터 입력

INSERT INTO ADMIN (aNO, aID, aPW, aEMAIL, aNAME, aTEL, aLEVEL)
    VALUES(ADMIN_SQ.NEXTVAL, 'moan125', '1234', 'moan125@naver.com', '문희석', '010-9999-1234', 2);
INSERT INTO ADMIN (aNO, aID, aPW, aEMAIL, aNAME, aTEL, aLEVEL)
    VALUES(ADMIN_SQ.NEXTVAL, 'aaa', '1234', 'lee@naver.com', '이진우', '010-1111-1234', 1);
INSERT INTO ADMIN (aNO, aID, aPW, aEMAIL, aNAME, aTEL, aLEVEL)
    VALUES(ADMIN_SQ.NEXTVAL, 'bbb', '1234', 'kim@naver.com', '김민우', '010-2222-1234', 1);
INSERT INTO ADMIN (aNO, aID, aPW, aEMAIL, aNAME, aTEL, aLEVEL)
    VALUES(ADMIN_SQ.NEXTVAL, 'ccc', '1234', 'ryu@naver.com', '류지환', '010-3333-1234', 1);
INSERT INTO ADMIN (aNO, aID, aPW, aEMAIL, aNAME, aTEL, aLEVEL)
    VALUES(ADMIN_SQ.NEXTVAL, 'ddd', '1234', 'hong@naver.com', '홍길동', '010-4444-1234', 0);
INSERT INTO ADMIN (aNO, aID, aPW, aEMAIL, aNAME, aTEL, aLEVEL)
    VALUES(ADMIN_SQ.NEXTVAL, 'eee', '1234', 'kimkim@naver.com', '김럭비', '010-4444-1234', 0);
INSERT INTO ADMIN (aNO, aID, aPW, aEMAIL, aNAME, aTEL, aLEVEL)
    VALUES(ADMIN_SQ.NEXTVAL, 'fff', '1234', 'parkpark@naver.com', '박농구', '010-4444-1234', 0);
    
commit;