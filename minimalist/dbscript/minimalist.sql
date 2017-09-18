--삭제
drop table member cascade constraints;
drop table product cascade constraints;
drop table rent_list cascade constraints;
drop table rental_reserve cascade constraints;
drop table cart cascade constraints;
drop table message cascade constraints;
drop table auction cascade constraints;
drop table alert cascade constraints;
drop table notice cascade constraints;
drop table faq cascade constraints;
drop table review cascade constraints;
drop table qna cascade constraints;
drop table product_image cascade constraints;


------------------------------------------------생성

--회원 테이블
create table member(
member_id varchar2(50) primary key,
member_pwd varchar2(50),
member_name varchar2(12),
birth date,
regist_date date default sysdate,
phone varchar2(20),
post varchar2(30),
address1 varchar2(200),
address2 varchar2(200),
point number,
grade number,
dormant_yn char(1) default 'n' constraint chk_dor check (dormant_yn in('y', 'n')),
email varchar2(100));




--대여 아이템(상품)
create table product(
product_code number primary key,
product_name varchar2(100),
product_category varchar2(20),
product_brand varchar2(50),
product_descript varchar2(1000),
rent_price number,
product_quantity number,
rent_count number,
product_size varchar2(20),
product_color varchar2(15),
receive_date date
);

--대여기록
create table rent_list(
rent_code number primary key,
product_code number,
member_id varchar2(20),
rent_date date,
return_date date,
constraint rent_list_fk1 foreign key (product_code) references product (product_code),
constraint  rent_list_fk2 foreign key (member_id) references member (member_id) on delete set null);



--대여예약
create table rental_reserve(
product_code number,
member_id varchar2(20),
reserve_date date,
return_date date,
constraint reserve_rent_fk1 foreign key (product_code) references product (product_code),
constraint  reserve_rent_fk2 foreign key (member_id) references member (member_id) on delete cascade);


--찜목록
create table cart(
member_id varchar2(20),
product_code number,
constraint cart_fk1 foreign key (product_code) references product (product_code),
constraint  cart_fk2 foreign key (member_id) references member (member_id) on delete cascade);


--쪽지
create table message(
message_number number primary key,
member_id varchar2(20),
message_title varchar2(50),
message_content varchar2(500),
send_date date,
check_yn char(1) default 'n' constraint chk_msg check (check_yn in('y', 'n')),
constraint message_fk foreign key (member_id) references member (member_id) on delete cascade);


-- 경매
create table auction(
auction_code number primary key,
product_name varchar2(30),
product_category varchar2(20),
product_brand varchar2(50),
product_descript varchar2(1000),
member_id varchar2(20),
bid_price number,
start_date date,
end_date date,
product_size varchar2(20),
product_color varchar2(15),
image_path varchar2(100),
payment_yn  char(1) default 'n' constraint chk_pay check (payment_yn in('y', 'n')),
constraint auction_fk foreign key (member_id) references member (member_id));

--경매 알림 예약
create table alert(
member_id varchar2(20),
product_code number,
alert_date date,
constraint alert_fk1 foreign key (product_code) references product (product_code),
constraint  alert_fk2 foreign key (member_id) references member (member_id) on delete cascade);


--공지사항
create table notice(
notice_no number primary key,
notice_title varchar2(100),
notice_content varchar2(1000),
notice_date date);


--후기게시판
create table review(
review_no number primary key,
product_code number,
member_id varchar2(20),
review_title varchar2(50),
review_content varchar2(1000),
original_img_path varchar2(1000),
rename_img_path varchar2(100),
review_date date,
constraint review_fk1 foreign key (member_id) references member (member_id),
constraint review_fk2 foreign key (product_code) references product (product_code) on delete cascade);


--문의 게시판
create table QNA(
qna_no number primary key,
member_id varchar2(20),
qna_title varchar2(50),
qna_content varchar2(1000),
qna_category varchar2(30),
qna_comment varchar2(500),
qna_date date,
img_path varchar2(100),
constraint qna_fk foreign key (member_id) references member (member_id));

create table product_image(
product_code number,
img_path varchar2(100),
constraint img_fk foreign key (product_code) references product (product_code));


------------------------------- 샘플데이터 ------------------------------------

insert into member values(
'admin', 'admin', '관리자', to_date('19891002', 'yymmdd'), sysdate,
'010-6482-6959', '69-74', '역삼동','고시원', 0, 0, 'n', 'wlsrb8993@gmail.com');


insert into product values(
1, '란희s 백', '가방', '루이비똥', '최고급 가죽, 정란희가 들어서 핫해진 바로 그 가방', '10000',1, 1, '300x300x100',
'red', sysdate);
insert into product values(
2, '재영바지', '의류', '구찌', '유재영이 즐겨입는 그 바지', '10000',1, 1, 'M',
'black', sysdate);
insert into product values(
3, '용준모자', '기타', '일리네어', '용준이가 즐겨입는 그 모자', '10000' ,1, 1, 'M',
'black', sysdate);


CREATE TABLE PRODUCT_IMAGE(
    IMAGE_CODE VARCHAR2(100),
    PRODUCT_CODE NUMBER,
    CONSTRAINT FK_PRODUCT_CODE FOREIGN KEY(PRODUCT_CODE) references PRODUCT(PRODUCT_CODE)
);



/* OUTER 61 */
INSERT INTO PRODUCT VALUES(6100000001, '제이디퀄딩점퍼', '', '', '', 1, 1, 1, '', '', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT_IMAGE VALUES('6100000001_1.jpg', '6100000001');
INSERT INTO PRODUCT_IMAGE VALUES('6100000001_1.jpg', '6100000001');
INSERT INTO PRODUCT_IMAGE VALUES('6100000001_1.jpg', '6100000001');
INSERT INTO PRODUCT_IMAGE VALUES('6100000001_1.jpg', '6100000001');
INSERT INTO PRODUCT_IMAGE VALUES('6100000001_1.jpg', '6100000001');
INSERT INTO PRODUCT_IMAGE VALUES('6100000001_1.jpg', '6100000001');
INSERT INTO PRODUCT_IMAGE VALUES('6100000001_1.jpg', '6100000001');
INSERT INTO PRODUCT_IMAGE VALUES('6100000001_1.jpg', '6100000001');

INSERT INTO PRODUCT VALUES(6100000002, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6100000003, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6100000004, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6100000005, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6100000006, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6100000007, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6100000008, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6100000009, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170909', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6100000010, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170910', 'RRMMDD'));

/* DRESS 62 */
INSERT INTO PRODUCT VALUES(6200000001, '사바나 타이 프론트 드레스', 'dress', 'TIBI', '임시설명', 10000, 1, 1, '임시사이즈', '임시색상', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6200000002, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6200000003, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6200000004, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6200000005, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6200000006, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6200000007, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6200000008, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6200000009, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170909', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6200000010, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170910', 'RRMMDD'));

/* TOP */
INSERT INTO PRODUCT VALUES(6300000001, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6300000002, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6300000003, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6300000004, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6300000005, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6300000006, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6300000007, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6300000008, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6300000009, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170909', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6300000010, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170910', 'RRMMDD'));

INSERT INTO PRODUCT VALUES(6400000001, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6400000002, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6400000003, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6400000004, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6400000005, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6400000006, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6400000007, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6400000008, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6400000009, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170909', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6400000010, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170910', 'RRMMDD'));

INSERT INTO PRODUCT VALUES(6500000001, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6500000002, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6500000003, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6500000004, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6500000005, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6500000006, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6500000007, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6500000008, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6500000009, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170909', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(6500000010, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170910', 'RRMMDD'));


insert into rent_list values(
1, 2, 'admin', to_date('20170808', 'yymmdd'), to_date('20170815', 'yymmdd'));

insert into rental_reserve values(
2, 'admin', sysdate, sysdate);

insert into cart values(
'admin', 1);

insert into message values(
1, 'admin', '안녕', '나는 관리자야', sysdate, 'n');

insert into auction values(
1, '블라우스', '의류', 'LAP', '실크 소재의 고급 원단', 'admin', '10000', to_date('20170909', 'yymmdd'), to_date('20171025', 'yymmdd'), 's', 'green', 'dress1.jpg,dress2.jpg,dress3.jpg', default);

insert into auction values(
2, '토드백', '가방', 'TOMASINI', '고급 가죽으로 만든 가방', 'admin', '10000', to_date('20170909', 'yymmdd'), to_date('20171028', 'yymmdd'), '25x11x19', 'brown', 'dress1.jpg,dress2.jpg,dress3.jpg', default);
insert into auction values(
3, '비바팔찌', '악세사리', 'studio 61x', '18k 도금', 'admin', '10000', to_date('20170909', 'yymmdd'), to_date('20171030', 'yymmdd'), '21cm', 'pink', 'acc1.jpg,acc2.jpg,acc3.jpg', default);
insert into auction values(
4, '옷(끝)', '의류', '보세', '화려함', 'admin', '10000', to_date('20170901', 'yymmdd'), to_date('20170909', 'yymmdd'), '끝', '끝', 'end1.jpg,end2.jpg,end3.jpg', default);



insert into alert values(
'admin', 3, to_date('20170901', 'yymmdd'));


insert into notice values(
1, '공지사항', '상품 대여 및 구매시 적립금을 드려요.', sysdate);



insert into review values(
1, 1, 'admin', '좋네요', '은 뻥', null, null, sysdate);

insert into qna values(
1, 'admin', '란희백 얼마', '냉무', '상품질문', '비싸',
sysdate, null);


commit;
