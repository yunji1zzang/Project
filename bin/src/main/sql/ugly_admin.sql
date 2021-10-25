drop table user_account;
create table user_account(
	user_id varchar2(50) primary key, 	-- ���̵�
	user_password varchar2(50) not null,	-- ��й�ȣ
	user_email varchar2(50) not null,	-- �̸���
	user_name varchar2(50) not null,	-- �̸�
	user_birth varchar2(50) not null,	-- �������
	user_phone varchar2(50) not null,	-- ��ȭ��ȣ 
	user_basic_address varchar2(50) not null,	-- �⺻�ּ� 
	user_detail_address varchar2(50),		-- ���ּ� 
	user_img varchar2(100),		-- �����̹��� 
	user_admin varchar2(50)			-- �����ڼ���
);

desc user_account;

select * from user_account;
SELECT * FROM USER_ACCOUNT WHERE USER_ID = 'jangnara';
INSERT INTO USER_ACCOUNT VALUES('jangnara','123','jang@gmail.com','�峪��','81/03/18','01011112222','��������63��32','�޺����323ȣ','����','�Ϲ�' );
UPDATE USER_ACCOUNT SET
   USER_EMAIL ='jang@naver.com',
   USER_NAME ='������',
   USER_BIRTH ='91/03/18',
   USER_PHONE ='01033334444',
   USER_BASIC_ADDRESS ='��⵵ �����',
   USER_DETAIL_ADDRESS ='�ɰ��',
   USER_IMG ='����2'
   WHERE USER_ID = 'jangnara';
DELETE FROM USER_ACCOUNT WHERE USER_ID = 'jangnara';
    
