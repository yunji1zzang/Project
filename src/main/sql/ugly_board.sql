-- 게시판 테이블 생성
create table ugly_board(
	id int primary key,		    -- 게시글 번호
	title varchar2(100) not null,	    -- 제목
	writer varchar2(20) not null,	    -- 작성자
	content varchar2(4000) not null,  -- 내용
	regdate date default sysdate,	    -- 작성일자
	view_cnt int not null		    -- 조회수
	content_img varchar2(500) -- 이미지 경로
);    

-- idx_seq 시퀀스 생성 
CREATE SEQUENCE idx_seq	
	START WITH 0	-- 시작 값 
	INCREMENT BY 1	-- 시퀀스 증가 값
	MAXVALUE 999	-- 최댓값
	MINVALUE 0	-- 최솟값
	NOCACHE	-- 캐시값
	NOCYCLE;	-- 순환 여부