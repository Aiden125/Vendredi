---------------------------------- 지환 시작 ---------------------------------------------


----------------------------------- 지환 끝 ---------------------------------------------







---------------------------------- 민우 시작 ---------------------------------------------


----------------------------------- 민우 끝 ---------------------------------------------









---------------------------------- 진우 시작 ---------------------------------------------


----------------------------------- 진우 끝 ---------------------------------------------













----------------------------------- 희석 시작 ---------------------------------------------
-- Admin
DROP TABLE ADMIN_L;
DROP TABLE ADMIN;

CREATE TABLE ADMIN(
    aID VARCHAR2(50) PRIMARY KEY NOT NULL,
    aPW VARCHAR2(50) NOT NULL,
    aEMAIL VARCHAR2(50) NOT NULL,
    aNAME VARCHAR2(50) NOT NULL,
    aTEL VARCHAR2(50) NOT NULL,
    aLEVEL VARCHAR2(50) DEFAULT 0 REFERENCES ADMIN_L(aLEVEL) 
);

-- ADMIN LEVEL
CREATE TABLE ADMIN_L(
    aLEVEL VARCHAR2(10) PRIMARY KEY,
    aLEVEL_NAME VARCHAR2(50)
);

-- ADMIN LELVE DATA
INSERT INTO ADMIN_L VALUES(0, 'MANAGER');
INSERT INTO ADMIN_L VALUES(1, 'HEAD_MANAGER');
INSERT INTO ADMIN_L VALUES(2, 'MASTER');
----------------------------------- 희석 끝 ---------------------------------------------






