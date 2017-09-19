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
drop table income cascade constraints;


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
CREATE TABLE PRODUCT(
PRODUCT_CODE NUMBER PRIMARY KEY, /*제품 코드*/
PRODUCT_NAME VARCHAR2(100), /*제품 이름*/
PRODUCT_CATEGORY VARCHAR2(20), /*제품 카테고리*/
PRODUCT_BRAND VARCHAR2(50), /*제품 브랜드*/
PRODUCT_DESCRIPT VARCHAR2(1000), /*제품 설명*/
PRODUCT_ORIGINAL_PRICE NUMBER, /*제품 본래 가격*/
RENT_PRICE NUMBER, /*제품 대여 비용*/
PRODUCT_SIZE33 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE33 CHECK (PRODUCT_SIZE33 IN('0', '1')), /*사이즈 유무*/
PRODUCT_SIZE44 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE44 CHECK (PRODUCT_SIZE44 IN('0', '1')),
PRODUCT_SIZE55 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE55 CHECK (PRODUCT_SIZE55 IN('0', '1')),
PRODUCT_SIZE66 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE66 CHECK (PRODUCT_SIZE66 IN('0', '1')),
PRODUCT_SIZE77 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE77 CHECK (PRODUCT_SIZE77 IN('0', '1')),
PRODUCT_COLOR VARCHAR2(15), /*색상*/
RECEIVE_DATE DATE /*올린 날짜*/
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

--수입
create table income (
product_code number,
auction_code number,
income number,
income_date date,
constraint inco_fk1 foreign key (product_code) references product (product_code),
constraint inco_fk2 foreign key (auction_code) references auction (auction_code));



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
INSERT INTO PRODUCT VALUES(1500000001, '브리애니 자켓', 'outer', 'JOIE', '임시설명', 790000, 49000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000002, '니티드 미니멀 베스트', 'outer', 'CHRISTIAN WIJNANTS', '임시설명', 760000, 38000, '0', '1', '1', '0', '0', '라임 엘로우', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000003, '더블 버튼 라이트 자켓', 'outer', 'ERIKA CAVALLINI', '임시설명', 763000, 38150, '0', '1', '1', '1', '1', '카키', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000004, '러플 트리밍 코트', 'outer', 'PIECE', '임시설명', 860000, 43000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000005, '자카드 패브릭 자켓', 'outer', 'JUCCA', '임시설명', 882000, 44100, '0', '0', '1', '1', '1', '베이지', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000006, '프린티드 코튼 자켓', 'outer', 'JUCCA', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000007, '스트라이프 실키 자켓', 'outer', 'JUCCA', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000008, '더블버튼 자켓', 'outer', 'TRUE NYC', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170908', 'RRMMDD'));

/* DRESS 62 */
INSERT INTO PRODUCT VALUES(1600000001, '사바나 타이 프론트 드레스', 'dress', 'TIBI', '임시설명', 10000, 1, 1, '임시사이즈', '임시색상', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1600000002, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1600000003, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1600000004, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1600000005, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1600000006, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1600000007, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1600000008, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1600000009, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170909', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1600000010, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170910', 'RRMMDD'));

/* TOP */
INSERT INTO PRODUCT VALUES(1700000001, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1700000002, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1700000003, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1700000004, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1700000005, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1700000006, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1700000007, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1700000008, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1700000009, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170909', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1700000010, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170910', 'RRMMDD'));

INSERT INTO PRODUCT VALUES(1800000001, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1800000002, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1800000003, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1800000004, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1800000005, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1800000006, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1800000007, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1800000008, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1800000009, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170909', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1800000010, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170910', 'RRMMDD'));

INSERT INTO PRODUCT VALUES(1900000001, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1900000002, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1900000003, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1900000004, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1900000005, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1900000006, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1900000007, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1900000008, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1900000009, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170909', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1900000010, '', '', '', '', 1, 1, 1, '', '', TO_DATE('170910', 'RRMMDD'));

INSERT INTO PRODUCT_IMAGE VALUES('1500000001_1.jpg', '1500000001');
INSERT INTO PRODUCT_IMAGE VALUES('1500000001_2.jpg', '1500000001');
INSERT INTO PRODUCT_IMAGE VALUES('1500000001_3.jpg', '1500000001');
INSERT INTO PRODUCT_IMAGE VALUES('1500000002_1.jpg', '1500000002');
INSERT INTO PRODUCT_IMAGE VALUES('1500000002_2.jpg', '1500000002');
INSERT INTO PRODUCT_IMAGE VALUES('1500000002_3.jpg', '1500000002');
INSERT INTO PRODUCT_IMAGE VALUES('1500000003_1.jpg', '1500000003');
INSERT INTO PRODUCT_IMAGE VALUES('1500000003_2.jpg', '1500000003');
INSERT INTO PRODUCT_IMAGE VALUES('1500000003_3.jpg', '1500000003');
INSERT INTO PRODUCT_IMAGE VALUES('1500000004_1.jpg', '1500000004');
INSERT INTO PRODUCT_IMAGE VALUES('1500000004_2.jpg', '1500000004');
INSERT INTO PRODUCT_IMAGE VALUES('1500000004_3.jpg', '1500000004');
INSERT INTO PRODUCT_IMAGE VALUES('1500000005_1.jpg', '1500000005');
INSERT INTO PRODUCT_IMAGE VALUES('1500000005_2.jpg', '1500000005');
INSERT INTO PRODUCT_IMAGE VALUES('1500000005_3.jpg', '1500000005');
INSERT INTO PRODUCT_IMAGE VALUES('1500000006_1.jpg', '1500000006');
INSERT INTO PRODUCT_IMAGE VALUES('1500000006_2.jpg', '1500000006');
INSERT INTO PRODUCT_IMAGE VALUES('1500000006_3.jpg', '1500000006');
INSERT INTO PRODUCT_IMAGE VALUES('1500000007_1.jpg', '1500000007');
INSERT INTO PRODUCT_IMAGE VALUES('1500000007_2.jpg', '1500000007');
INSERT INTO PRODUCT_IMAGE VALUES('1500000007_3.jpg', '1500000007');
INSERT INTO PRODUCT_IMAGE VALUES('1500000008_1.jpg', '1500000008');
INSERT INTO PRODUCT_IMAGE VALUES('1500000008_2.jpg', '1500000008');
INSERT INTO PRODUCT_IMAGE VALUES('1500000008_3.jpg', '1500000008');



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
2, '토드백', '잡화', 'TOMASINI', '고급 가죽으로 만든 가방', 'admin', '10000', to_date('20170909', 'yymmdd'), to_date('20171028', 'yymmdd'), '25x11x19', 'brown', 'bag1.jpg,bag2.jpg,bag3.jpg', default);
insert into auction values(
3, '비바팔찌', '악세사리', 'studio 61x', '18k 도금', 'admin', '10000', to_date('20170909', 'yymmdd'), to_date('20171030', 'yymmdd'), '21cm', 'pink', 'acc1.jpg,acc2.jpg,acc3.jpg', default);
insert into auction values(
4, '옷(끝)', '의류', '보세', '화려함', 'admin', '10000', to_date('20170901', 'yymmdd'), to_date('20170909', 'yymmdd'), '끝', '끝', 'end1.jpg,end2.jpg,end3.jpg', default);
insert into auction values(
5, '슬리브셔츠', '의류', 'FLEAMADONNA', '언발라스함이 포인또', 'admin', '10000', to_date('20170901', 'yymmdd'), to_date('20171021', 'yymmdd'), 'm', 'navy', 'top1.jpg,top2.jpg,top3.jpg', default);



insert into alert values(
'admin', 3, to_date('20170901', 'yymmdd'));


insert into notice values(
1, '공지사항', '상품 대여 및 구매시 적립금을 드려요.', sysdate);



insert into review values(
1, 1, 'admin', '좋네요', '은 뻥', null, null, sysdate);

insert into qna values(
1, 'admin', '란희백 얼마', '냉무', '상품질문', '비싸',
sysdate, null);

insert into income values (
null, 4, 10000, to_date('20170909', 'yymmdd'));


commit;
