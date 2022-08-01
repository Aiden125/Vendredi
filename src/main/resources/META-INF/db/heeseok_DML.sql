-- 관리자 등록(adminJoin)
INSERT INTO ADMIN (aID, aPW, aEMAIL, aNAME, aTEL)
    VALUES('moan125', '1234', 'moan125@naver.com', '문희석', '010-9284-3694', 2);
    

-- 관리자 로그인(adminLogin)
SELECT * FROM ADMIN WHERE aID='moan125' AND aPW='1234';


-- 관리자 정보수정(adminModify)
UPDATE ADMIN SET aPW='1234',
                aEMAIL='moan125@naver.com',
                aNAME='문희석',
                aTEL='010-9284-3694',
                aLEVEL='MASTER'
    WHERE aID='moan125';


-- 관리자 리스트(adminList)
SELECT aID, aPW, aEMAIL, aNAME, aTEL, L.aLEVEL_NAME
    FROM ADMIN A, ADMIN_L L
    WHERE A.aLEVEL=L.aLEVEL
    ORDER BY A.aLEVEL;
    
    
-- 관리자 삭제(adminDelete)
DELETE ADMIN WHERE aID='ddd';

COMMIT;