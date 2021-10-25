--사용자 생성

CREATE USER ugly_admin -- 유저 이름
IDENTIFIED BY ugly_admin; -- 유저 비번

SELECT USERNAME FROM DBA_USERS WHERE USERNAME='ugly_admin'; -- 유저 확인

-- 권한 부여

GRANT CONNECT,RESOURCE,DBA TO ugly_admin;

GRANT CREATE TABLE TO ugly_admin;

