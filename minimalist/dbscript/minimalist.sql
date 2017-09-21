--삭제
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE RENT_LIST CASCADE CONSTRAINTS;
DROP TABLE RENTAL_RESERVE CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
DROP TABLE AUCTION CASCADE CONSTRAINTS;
DROP TABLE ALERT CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_IMAGE CASCADE CONSTRAINTS;
DROP TABLE INCOME CASCADE CONSTRAINTS;



------------------------------------------------생성

--회원 테이블
CREATE TABLE MEMBER(
MEMBER_ID VARCHAR2(50) PRIMARY KEY,
MEMBER_PWD VARCHAR2(50),
MEMBER_NAME VARCHAR2(12),
BIRTH DATE,
REGIST_DATE DATE DEFAULT SYSDATE,
PHONE VARCHAR2(20),
POST VARCHAR2(30),
ADDRESS1 VARCHAR2(200),
ADDRESS2 VARCHAR2(200),
POINT NUMBER,
GRADE NUMBER,
DORMANT_YN CHAR(1) DEFAULT 'n' CONSTRAINT CHK_DOR CHECK (DORMANT_YN IN('y', 'n')),
EMAIL VARCHAR2(100));




--대여 아이템(상품)
CREATE TABLE PRODUCT(
PRODUCT_CODE NUMBER PRIMARY KEY, /* 제품 코드 */
PRODUCT_NAME VARCHAR2(100), /* 제품 이름 */
PRODUCT_CATEGORY VARCHAR2(20), /* 제품 카테고리 */
PRODUCT_BRAND VARCHAR2(50), /* 제품 브랜드 */
PRODUCT_DESCRIPT VARCHAR2(1000), /* 제품 설명 */
PRODUCT_ORIGINAL_PRICE NUMBER, /* 제품 본래 가격 */
RENT_PRICE NUMBER, /* 제품 대여 비용 */
PRODUCT_SIZE33 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE33 CHECK (PRODUCT_SIZE33 IN('0', '1')), /* 사이즈 유무 */
PRODUCT_SIZE44 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE44 CHECK (PRODUCT_SIZE44 IN('0', '1')),
PRODUCT_SIZE55 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE55 CHECK (PRODUCT_SIZE55 IN('0', '1')),
PRODUCT_SIZE66 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE66 CHECK (PRODUCT_SIZE66 IN('0', '1')),
PRODUCT_SIZE77 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE77 CHECK (PRODUCT_SIZE77 IN('0', '1')),
PRODUCT_COLOR VARCHAR2(50), /* 색상 */
RECEIVE_DATE DATE /* 올린 날짜 */
);

--대여기록
CREATE TABLE RENT_LIST(
RENT_CODE NUMBER PRIMARY KEY,
PRODUCT_CODE NUMBER,
MEMBER_ID VARCHAR2(20),
RENT_DATE DATE,
RETURN_DATE DATE,
CONSTRAINT RENT_LIST_FK1 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
CONSTRAINT  RENT_LIST_FK2 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL);



--대여예약
CREATE TABLE RENTAL_RESERVE(
PRODUCT_CODE NUMBER,
MEMBER_ID VARCHAR2(20),
RESERVE_DATE DATE,
RETURN_DATE DATE,
CONSTRAINT RESERVE_RENT_FK1 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
CONSTRAINT  RESERVE_RENT_FK2 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE);


--찜목록
CREATE TABLE CART(
MEMBER_ID VARCHAR2(20),
PRODUCT_CODE NUMBER,
CONSTRAINT CART_FK1 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
CONSTRAINT  CART_FK2 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE);


--쪽지
CREATE TABLE MESSAGE(
MESSAGE_NUMBER NUMBER PRIMARY KEY,
MEMBER_ID VARCHAR2(20),
MESSAGE_TITLE VARCHAR2(50),
MESSAGE_CONTENT VARCHAR2(500),
SEND_DATE DATE,
CHECK_YN CHAR(1) DEFAULT 'n' CONSTRAINT CHK_MSG CHECK (CHECK_YN IN('y', 'n')),
CONSTRAINT MESSAGE_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE);


-- 경매
CREATE TABLE AUCTION(
AUCTION_CODE NUMBER PRIMARY KEY,
PRODUCT_NAME VARCHAR2(30),
PRODUCT_CATEGORY VARCHAR2(20),
PRODUCT_BRAND VARCHAR2(50),
PRODUCT_DESCRIPT VARCHAR2(1000),
MEMBER_ID VARCHAR2(20),
BID_PRICE NUMBER,
START_DATE DATE,
END_DATE DATE,
PRODUCT_SIZE VARCHAR2(20),
PRODUCT_COLOR VARCHAR2(15),
IMAGE_PATH VARCHAR2(100),
PAYMENT_YN  CHAR(1) DEFAULT 'n' CONSTRAINT CHK_PAY CHECK (PAYMENT_YN IN('y', 'n')),
CONSTRAINT AUCTION_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID));

--경매 알림 예약
CREATE TABLE ALERT(
MEMBER_ID VARCHAR2(20),
PRODUCT_CODE NUMBER,
ALERT_DATE DATE,
CONSTRAINT ALERT_FK1 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
CONSTRAINT  ALERT_FK2 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE);


--공지사항
CREATE TABLE NOTICE(
NOTICE_NO NUMBER PRIMARY KEY,
NOTICE_TITLE VARCHAR2(100),
NOTICE_CONTENT VARCHAR2(1000),
NOTICE_DATE DATE);


--후기게시판
<<<<<<< HEAD
create table review(
review_no number primary key,
product_code number,
member_id varchar2(20),
review_title varchar2(50),
review_content varchar2(1000),
review_rating number,
image_path varchar2(1000),
review_date date,
constraint review_fk1 foreign key (member_id) references member (member_id),
constraint review_fk2 foreign key (product_code) references product (product_code) on delete cascade);
=======
CREATE TABLE REVIEW(
REVIEW_NO NUMBER PRIMARY KEY,
PRODUCT_CODE NUMBER,
MEMBER_ID VARCHAR2(20),
REVIEW_TITLE VARCHAR2(50),
REVIEW_CONTENT VARCHAR2(1000),
REVIEW_RATING NUMBER,
ORIGINAL_IMG_NAME VARCHAR2(1000),
RENAME_IMG_NAME VARCHAR2(100),
REVIEW_DATE DATE,
CONSTRAINT REVIEW_FK1 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID),
CONSTRAINT REVIEW_FK2 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE) ON DELETE CASCADE);
>>>>>>> refs/remotes/origin/branch_lintogi


--문의 게시판
CREATE TABLE QNA(
QNA_NO NUMBER PRIMARY KEY,
MEMBER_ID VARCHAR2(20),
QNA_TITLE VARCHAR2(50),
QNA_CONTENT VARCHAR2(1000),
QNA_CATEGORY VARCHAR2(30),
QNA_COMMENT VARCHAR2(500),
QNA_DATE DATE,
IMG_PATH VARCHAR2(100),
CONSTRAINT QNA_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID));

CREATE TABLE PRODUCT_IMAGE(
PRODUCT_CODE NUMBER,
PRODUCT_IMAGE_PATH VARCHAR2(100),
CONSTRAINT IMAGE_FK FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE));

--수입
CREATE TABLE INCOME (
PRODUCT_CODE NUMBER,
AUCTION_CODE NUMBER UNIQUE,
INCOME NUMBER,
INCOME_DATE DATE,
CONSTRAINT INCO_FK1 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
CONSTRAINT INCO_FK2 FOREIGN KEY (AUCTION_CODE) REFERENCES AUCTION (AUCTION_CODE),
CONSTRAINT INCO_UNI UNIQUE (PRODUCT_CODE, INCOME_DATE));


------------------------------- 샘플데이터 ------------------------------------

INSERT INTO MEMBER VALUES(
'admin', 'admin', '관리자', TO_DATE('19891002', 'yymmdd'), SYSDATE,
'010-6482-6959', '69-74', '역삼동','고시원', 0, 0, 'n', 'wlsrb8993@gmail.com');

CREATE TABLE PRODUCT_IMAGE(
    IMAGE_CODE VARCHAR2(200),
    PRODUCT_CODE NUMBER,
    CONSTRAINT FK_PRODUCT_CODE FOREIGN KEY(PRODUCT_CODE) REFERENCES PRODUCT(PRODUCT_CODE)
);

/* OUTER 15 */
INSERT INTO PRODUCT VALUES(1500000001, '브리애니 자켓', 'outer', 'JOIE', '임시설명', 790000, 49000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000002, '니티드 미니멀 베스트', 'outer', 'CHRISTIAN WIJNANTS', '임시설명', 760000, 38000, '0', '1', '1', '0', '0', '라임 엘로우', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000003, '더블 버튼 라이트 자켓', 'outer', 'ERIKA CAVALLINI', '임시설명', 763000, 38150, '0', '1', '1', '1', '1', '카키', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000004, '러플 트리밍 코트', 'outer', 'PIECE', '임시설명', 860000, 43000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000005, '자카드 패브릭 자켓', 'outer', 'JUCCA', '임시설명', 882000, 44100, '0', '0', '1', '1', '1', '베이지', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000006, '프린티드 코튼 자켓', 'outer', 'JUCCA', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000007, '스트라이프 실키 자켓', 'outer', 'JUCCA', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000008, '더블버튼 자켓', 'outer', 'TRUE NYC', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170908', 'RRMMDD'));

/* OUTER 15  - ■ 임시 데이터이고 나중에 삭제하기*/
INSERT INTO PRODUCT VALUES(1500000009, '브리애니 자켓', 'outer', 'JOIE', '임시설명', 790000, 49000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000010, '니티드 미니멀 베스트', 'outer', 'CHRISTIAN WIJNANTS', '임시설명', 760000, 38000, '0', '1', '1', '0', '0', '라임 엘로우', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000011, '더블 버튼 라이트 자켓', 'outer', 'ERIKA CAVALLINI', '임시설명', 763000, 38150, '0', '1', '1', '1', '1', '카키', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000012, '러플 트리밍 코트', 'outer', 'PIECE', '임시설명', 860000, 43000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000013, '자카드 패브릭 자켓', 'outer', 'JUCCA', '임시설명', 882000, 44100, '0', '0', '1', '1', '1', '베이지', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000014, '프린티드 코튼 자켓', 'outer', 'JUCCA', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000015, '스트라이프 실키 자켓', 'outer', 'JUCCA', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000016, '더블버튼 자켓', 'outer', 'TRUE NYC', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170908', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000017, '브리애니 자켓', 'outer', 'JOIE', '임시설명', 790000, 49000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170901', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000018, '니티드 미니멀 베스트', 'outer', 'CHRISTIAN WIJNANTS', '임시설명', 760000, 38000, '0', '1', '1', '0', '0', '라임 엘로우', TO_DATE('170902', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000019, '더블 버튼 라이트 자켓', 'outer', 'ERIKA CAVALLINI', '임시설명', 763000, 38150, '0', '1', '1', '1', '1', '카키', TO_DATE('170903', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000020, '러플 트리밍 코트', 'outer', 'PIECE', '임시설명', 860000, 43000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170904', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000021, '자카드 패브릭 자켓', 'outer', 'JUCCA', '임시설명', 882000, 44100, '0', '0', '1', '1', '1', '베이지', TO_DATE('170905', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000022, '프린티드 코튼 자켓', 'outer', 'JUCCA', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170906', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000023, '스트라이프 실키 자켓', 'outer', 'JUCCA', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170907', 'RRMMDD'));
INSERT INTO PRODUCT VALUES(1500000024`, '더블버튼 자켓', 'outer', 'TRUE NYC', '임시설명', 1, 1, '0', '0', '0', '0', '0', '색상', TO_DATE('170908', 'RRMMDD'));


/* DRESS 62 */
/* TOP */
INSERT INTO PRODUCT_IMAGE VALUES(1500000001, '1500000001_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000001, '1500000001_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000001, '1500000001_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000002, '1500000002_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000002, '1500000002_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000002, '1500000002_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000003, '1500000003_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000003, '1500000003_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000003, '1500000003_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000004, '1500000004_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000004, '1500000004_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000004, '1500000004_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000005, '1500000005_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000005, '1500000005_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000005, '1500000005_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000006, '1500000006_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000006, '1500000006_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000006, '1500000006_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000007, '1500000007_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000007, '1500000007_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000007, '1500000007_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000008, '1500000008_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000008, '1500000008_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000008, '1500000008_3.jpg');



INSERT INTO RENT_LIST VALUES(
1, 2, 'admin', TO_DATE('20170808', 'yymmdd'), TO_DATE('20170815', 'yymmdd'));

INSERT INTO RENTAL_RESERVE VALUES(
2, 'admin', SYSDATE, SYSDATE);

INSERT INTO CART VALUES(
'admin', 1);

INSERT INTO MESSAGE VALUES(
1, 'admin', '안녕', '나는 관리자야', SYSDATE, 'n');

INSERT INTO AUCTION VALUES(
1, '블라우스', '의류', 'LAP', '실크 소재의 고급 원단', 'admin', '10000', TO_DATE('20170909', 'yymmdd'), TO_DATE('20171025', 'yymmdd'), 's', 'green', 'dress1.jpg,dress2.jpg,dress3.jpg', DEFAULT);

INSERT INTO AUCTION VALUES(
2, '토드백', '잡화', 'TOMASINI', '고급 가죽으로 만든 가방', 'admin', '10000', TO_DATE('20170909', 'yymmdd'), TO_DATE('20171028', 'yymmdd'), '25x11x19', 'brown', 'bag1.jpg,bag2.jpg,bag3.jpg', DEFAULT);
INSERT INTO AUCTION VALUES(
3, '비바팔찌', '악세사리', 'studio 61x', '18k 도금', 'admin', '10000', TO_DATE('20170909', 'yymmdd'), TO_DATE('20171030', 'yymmdd'), '21cm', 'pink', 'acc1.jpg,acc2.jpg,acc3.jpg', DEFAULT);
INSERT INTO AUCTION VALUES(
4, '옷(끝)', '의류', '보세', '화려함', 'admin', '10000', TO_DATE('20170901', 'yymmdd'), TO_DATE('20170909', 'yymmdd'), '끝', '끝', 'end1.jpg,end2.jpg,end3.jpg', DEFAULT);
INSERT INTO AUCTION VALUES(
5, '슬리브셔츠', '의류', 'FLEAMADONNA', '언발라스함이 포인또', 'admin', '10000', TO_DATE('20170901', 'yymmdd'), TO_DATE('20171021', 'yymmdd'), 'm', 'navy', 'top1.jpg,top2.jpg,top3.jpg', DEFAULT);



INSERT INTO ALERT VALUES(
'admin', 3, TO_DATE('20170901', 'yymmdd'));


INSERT INTO NOTICE VALUES(
1, '공지사항', '상품 대여 및 구매시 적립금을 드려요.', SYSDATE);


   

INSERT INTO REVIEW VALUES(
1, 1, 'admin', '좋네요', '은 뻥', '1', NULL, NULL, SYSDATE);
INSERT INTO REVIEW VALUES(
2, 1500000001, 'admin', '좋네요', '은 뻥', '1', NULL, NULL, SYSDATE);



INSERT INTO QNA VALUES(
1, 'admin', '란희백 얼마', '냉무', '상품질문', '비싸',
SYSDATE, NULL);




COMMIT;
