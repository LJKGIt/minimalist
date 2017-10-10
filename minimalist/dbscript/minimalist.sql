
------------------------------ 삭제 ------------------------------
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE RENT_LIST CASCADE CONSTRAINTS;
DROP TABLE RENTAL_RESERVE CASCADE CONSTRAINTS;
DROP TABLE WISH CASCADE CONSTRAINTS;
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
DROP TABLE AUCTION CASCADE CONSTRAINTS;
drop table bidinfo cascade constraints;
DROP TABLE ALERT CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_IMAGE CASCADE CONSTRAINTS;
DROP TABLE INCOME CASCADE CONSTRAINTS;
DROP TABLE ORDERINFO CASCADE CONSTRAINTS;


------------------------------ 테이블 생성 ------------------------------

/* 회원 테이블 */
CREATE TABLE MEMBER(
    MEMBER_ID VARCHAR2(50) PRIMARY KEY, /* 회원 아이디 */
    MEMBER_PWD VARCHAR2(500), /* 회원 비밀번호 */
    MEMBER_NAME VARCHAR2(12), /* 회원 이름 */
    BIRTH DATE, /* 생년월일 */
    REGIST_DATE DATE DEFAULT SYSDATE, /* 가입 날짜 */
    PHONE VARCHAR2(20), /* 전화 번호 */
    POST VARCHAR2(30), /* 우편 번호 */
    ADDRESS1 VARCHAR2(200), /* 기본 주소 */
    ADDRESS2 VARCHAR2(200), /* 상세 주소 */
    POINT NUMBER, /* 포인트 */
    GRADE NUMBER, /* 등급 */
    DORMANT_YN CHAR(1) DEFAULT 'n' CONSTRAINT CHK_DOR CHECK (DORMANT_YN IN('y', 'n')), /* 휴면여부 */
    EMAIL VARCHAR2(100), /* 이메일 */
    SALT VARCHAR2 (200) /* SHA-256 */
);

COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원 이름';
COMMENT ON COLUMN MEMBER.BIRTH IS '생년월일';
COMMENT ON COLUMN MEMBER.REGIST_DATE IS '가입 날짜';
COMMENT ON COLUMN MEMBER.PHONE IS '전화 번호';
COMMENT ON COLUMN MEMBER.POST IS '우편 번호';
COMMENT ON COLUMN MEMBER.ADDRESS1 IS '기본 주소';
COMMENT ON COLUMN MEMBER.ADDRESS2 IS '상세 주소';
COMMENT ON COLUMN MEMBER.POINT IS '포인트';
COMMENT ON COLUMN MEMBER.GRADE IS '등급';
COMMENT ON COLUMN MEMBER.DORMANT_YN IS '휴면여부';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.SALT IS 'SHA-256';

/* 대여 */
CREATE TABLE PRODUCT(
    PRODUCT_CODE NUMBER PRIMARY KEY, /* 대여 코드 */
    PRODUCT_NAME VARCHAR2(100), /* 대여 이름 */
    PRODUCT_CATEGORY VARCHAR2(20), /* 대여 카테고리 */
    PRODUCT_BRAND VARCHAR2(50), /* 대여 브랜드 */
    PRODUCT_DESCRIPT VARCHAR2(1000), /* 대여 설명 */
    PRODUCT_ORIGINAL_PRICE NUMBER, /* 원가 */
    RENT_PRICE NUMBER, /* 대여 금액 */
    PRODUCT_SIZE33 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE33 CHECK (PRODUCT_SIZE33 IN('0', '1')), /* 33 사이즈 유무 */
    PRODUCT_SIZE44 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE44 CHECK (PRODUCT_SIZE44 IN('0', '1')), /* 44 사이즈 유무 */
    PRODUCT_SIZE55 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE55 CHECK (PRODUCT_SIZE55 IN('0', '1')), /* 55 사이즈 유무 */
    PRODUCT_SIZE66 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE66 CHECK (PRODUCT_SIZE66 IN('0', '1')), /* 66 사이즈 유무 */
    PRODUCT_SIZE77 CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_SIZE77 CHECK (PRODUCT_SIZE77 IN('0', '1')), /* 77 사이즈 유무 */
    PRODUCT_COLOR VARCHAR2(50), /* 색상 */
    RECEIVE_DATE DATE, /* 올린 날짜 */
    PRODUCT_HIT NUMBER DEFAULT 0, /* 조회수 */
    PRODUCT_DELETE CHAR(1) DEFAULT '0' CONSTRAINT CHK_PRODUCT_DELETE CHECK (PRODUCT_DELETE IN('0', '1')) /* 삭제 여부 */
);

COMMENT ON COLUMN PRODUCT.PRODUCT_CODE IS '대여 코드';
COMMENT ON COLUMN PRODUCT.PRODUCT_NAME IS '대여 이름';
COMMENT ON COLUMN PRODUCT.PRODUCT_CATEGORY IS '대여 카테고리';
COMMENT ON COLUMN PRODUCT.PRODUCT_BRAND IS '대여 브랜드';
COMMENT ON COLUMN PRODUCT.PRODUCT_DESCRIPT IS '대여 설명';
COMMENT ON COLUMN PRODUCT.PRODUCT_ORIGINAL_PRICE IS '원가';
COMMENT ON COLUMN PRODUCT.RENT_PRICE IS '대여 금액';
COMMENT ON COLUMN PRODUCT.PRODUCT_SIZE33 IS '33 사이즈 유무';
COMMENT ON COLUMN PRODUCT.PRODUCT_SIZE44 IS '44 사이즈 유무';
COMMENT ON COLUMN PRODUCT.PRODUCT_SIZE55 IS '55 사이즈 유무';
COMMENT ON COLUMN PRODUCT.PRODUCT_SIZE66 IS '66 사이즈 유무';
COMMENT ON COLUMN PRODUCT.PRODUCT_SIZE77 IS '77 사이즈 유무';
COMMENT ON COLUMN PRODUCT.PRODUCT_COLOR IS '색상';
COMMENT ON COLUMN PRODUCT.RECEIVE_DATE IS '올린 날짜';
COMMENT ON COLUMN PRODUCT.PRODUCT_HIT IS '조회수';
COMMENT ON COLUMN PRODUCT.PRODUCT_DELETE IS '삭제 여부';

/* 대여 이미지 */
CREATE TABLE PRODUCT_IMAGE(
    PRODUCT_CODE NUMBER, /* 대여 코드 */
    PRODUCT_IMAGE_PATH VARCHAR2(100), /* 대여 이미지 */
    CONSTRAINT FK_PRODUCT_IMAGE_PRODUCT_CODE FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
    CONSTRAINT PK_PRODUCT_IMAGE PRIMARY KEY (PRODUCT_CODE, PRODUCT_IMAGE_PATH)
);

COMMENT ON COLUMN PRODUCT_IMAGE.PRODUCT_CODE IS '대여 코드';
COMMENT ON COLUMN PRODUCT_IMAGE.PRODUCT_IMAGE_PATH IS '대여 이미지';



/* 대여 기록 */
CREATE TABLE RENT_LIST(
    RENT_CODE NUMBER PRIMARY KEY, /* 대여 기록 */
    PRODUCT_CODE NUMBER, /* 대여 코드 */
    MEMBER_ID VARCHAR2(20), /* 회원 아이디 */
    RENT_DATE DATE, /* 대여 날짜 */
    RETURN_DATE DATE, /* 반납 날짜 */
    CONSTRAINT RENT_LIST_FK1 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
    CONSTRAINT  RENT_LIST_FK2 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL
);

COMMENT ON COLUMN RENT_LIST.RENT_CODE IS '대여 기록';
COMMENT ON COLUMN RENT_LIST.PRODUCT_CODE IS '대여 코드';
COMMENT ON COLUMN RENT_LIST.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN RENT_LIST.RENT_DATE IS '대여 날짜';
COMMENT ON COLUMN RENT_LIST.RETURN_DATE IS '반납 날짜';

/* 대여 예약 */
CREATE TABLE RENTAL_RESERVE(
    PRODUCT_CODE NUMBER, /* 대여 코드 */
    MEMBER_ID VARCHAR2(20), /* 회원 아이디 */
    RESERVE_DATE DATE, /* 예약 날짜 */
    RETURN_DATE DATE, /* 반납 날짜 */
    CONSTRAINT RESERVE_RENT_FK1 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
    CONSTRAINT  RESERVE_RENT_FK2 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);
COMMENT ON COLUMN RENTAL_RESERVE.PRODUCT_CODE IS '대여 코드';
COMMENT ON COLUMN RENTAL_RESERVE.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN RENTAL_RESERVE.RESERVE_DATE IS '예약 날짜';
COMMENT ON COLUMN RENTAL_RESERVE.RETURN_DATE IS '반납 날짜';

/* 찜 */
CREATE TABLE WISH(
    MEMBER_ID VARCHAR2(20), /* 회원 아이디 */
    PRODUCT_CODE NUMBER, /* 대여 코드 */
    CONSTRAINT WISH_FK1 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
    CONSTRAINT WISH_FK2 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
    CONSTRAINT PK_WISH PRIMARY KEY (MEMBER_ID, PRODUCT_CODE)
);

COMMENT ON COLUMN WISH.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN WISH.PRODUCT_CODE IS '대여 코드';

/* 쪽지 */
CREATE TABLE MESSAGE(
    MESSAGE_NUMBER NUMBER PRIMARY KEY, /* 쪽지 번호 */
    MEMBER_ID VARCHAR2(20), /* 회원 아이디 */
    MESSAGE_TITLE VARCHAR2(100), /* 쪽지 제목 */
    MESSAGE_CONTENT VARCHAR2(500), /* 쪽지 내용 */
    SEND_DATE DATE, /* 보낸 날짜 */
    CHECK_YN CHAR(1) DEFAULT 'n' CONSTRAINT CHK_MSG CHECK (CHECK_YN IN('y', 'n')), /* 확인 여부 */
    CONSTRAINT MESSAGE_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);

COMMENT ON COLUMN MESSAGE.MESSAGE_NUMBER IS '쪽지 번호';
COMMENT ON COLUMN MESSAGE.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN MESSAGE.MESSAGE_TITLE IS '쪽지 제목';
COMMENT ON COLUMN MESSAGE.MESSAGE_CONTENT IS '쪽지 내용';
COMMENT ON COLUMN MESSAGE.SEND_DATE IS '보낸 날짜';
COMMENT ON COLUMN MESSAGE.CHECK_YN IS '확인 여부';

/* 경매 상품 */
CREATE TABLE AUCTION(
    AUCTION_CODE NUMBER PRIMARY KEY, /* 경매 상품 코드 */
    AUCTION_NAME VARCHAR2(30), /* 경매 상품 이름 */
    AUCTION_CATEGORY VARCHAR2(20), /* 경매 상품 카테고리 */
    AUCTION_BRAND VARCHAR2(50), /* 경매 상품 브랜드 */
    AUCTION_DESCRIPT VARCHAR2(1000), /* 경매 상품 설명 */
    start_price number, /* 시작 가격 */
    START_DATE DATE, /* 시작 일자 */
    END_DATE DATE, /* 종료 일자 */
    AUCTION_SIZE VARCHAR2(20), /* 경매 상품 사이즈 */
    AUCTION_COLOR VARCHAR2(15), /* 경매 상품 색상 */
    IMAGE_PATH VARCHAR2(100), /* 경매 상품 이미지 */
    PAYMENT_YN  CHAR(1) DEFAULT 'n' CONSTRAINT CHK_PAY CHECK (PAYMENT_YN IN('y', 'n')) /* 결제유무 */
);

COMMENT ON COLUMN AUCTION.AUCTION_CODE IS '경매 상품 코드';
COMMENT ON COLUMN AUCTION.AUCTION_NAME IS '경매 상품 이름';
COMMENT ON COLUMN AUCTION.AUCTION_CATEGORY IS '경매 상품 카테고리';
COMMENT ON COLUMN AUCTION.AUCTION_BRAND IS '경매 상품 브랜드';
COMMENT ON COLUMN AUCTION.AUCTION_DESCRIPT IS '경매 상품 설명';
COMMENT ON COLUMN AUCTION.start_price IS '시작 가격';
COMMENT ON COLUMN AUCTION.START_DATE IS '시작 일자';
COMMENT ON COLUMN AUCTION.END_DATE IS '종료 일자';
COMMENT ON COLUMN AUCTION.AUCTION_SIZE IS '경매 상품 사이즈';
COMMENT ON COLUMN AUCTION.AUCTION_COLOR IS '경매 상품 색상';
COMMENT ON COLUMN AUCTION.IMAGE_PATH IS '경매 상품 이미지';
COMMENT ON COLUMN AUCTION.PAYMENT_YN IS '결제유무';

/* 주문 */
/* (ORDER는 테이블 이름으로 쓸 수 없으므로 ORDERINFO로 지었습니다.) */
CREATE TABLE ORDERINFO(
    ORDERINFO_CODE NUMBER PRIMARY KEY, /* 주문 코드 */
    MEMBER_ID VARCHAR2(20), /* 회원 아이디 */
    PRODUCT_CODE NUMBER, /* 대여 코드 */
    ORDERINFO_DATE DATE, /* 주문 날짜 */
    ORDER_RECIEVER_NAME VARCHAR2(12), /* 받는이 이름 */
    ORDER_RECIEVER_ADDRESS VARCHAR2(200), /* 받는이 주소 */
    ORDER_RECIEVER_PHONE VARCHAR2(30), /* 받는이 전화번호 */
    ORDER_SIZE VARCHAR2(30), /* 주문한 사이즈 */
    ORDER_INVOICE_NUMBER NUMBER, /* 송장 번호 */
    
    CONSTRAINT  FK_ORDERINFO_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
    CONSTRAINT  FK_ORDERINFO_PRODUCT_CODE FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE)
);

COMMENT ON COLUMN ORDERINFO.ORDERINFO_CODE IS '주문 코드';
COMMENT ON COLUMN ORDERINFO.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN ORDERINFO.PRODUCT_CODE IS '대여 코드';
COMMENT ON COLUMN ORDERINFO.ORDERINFO_DATE IS '주문 날짜';
COMMENT ON COLUMN ORDERINFO.ORDER_RECIEVER_NAME IS '받는이 이름';
COMMENT ON COLUMN ORDERINFO.ORDER_RECIEVER_ADDRESS IS '받는이 주소';
COMMENT ON COLUMN ORDERINFO.ORDER_RECIEVER_PHONE IS '받는이 전화번호';
COMMENT ON COLUMN ORDERINFO.ORDER_SIZE IS '주문한 사이즈';
COMMENT ON COLUMN ORDERINFO.ORDER_SIZE IS '송장 번호';


/* 경매 입찰 정보 */
create table bidinfo (
auction_code number,
member_id varchar2(20),
bid_price number,
CONSTRAINT bid_FK1 FOREIGN KEY (auction_CODE) REFERENCES auction (auction_CODE),
CONSTRAINT  bid_FK2 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE);

COMMENT ON COLUMN bidinfo.auction_code IS '경매 코드';
COMMENT ON COLUMN bidinfo.member_id IS '입찰자 아이디';
COMMENT ON COLUMN bidinfo.bid_price IS '입찰 가격';


/* 경매 알림 예약 */
CREATE TABLE ALERT(
    MEMBER_ID VARCHAR2(20), /* 회원 아이디 */
    PRODUCT_CODE NUMBER, /* 대여 상품 코드 */
    ALERT_DATE DATE, /* 알림 날짜 */
    CONSTRAINT ALERT_FK1 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE),
    CONSTRAINT  ALERT_FK2 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE);

COMMENT ON COLUMN ALERT.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN ALERT.PRODUCT_CODE IS '대여 상품 코드';
COMMENT ON COLUMN ALERT.ALERT_DATE IS '알림 날짜';

/* 공지사항 */
CREATE TABLE NOTICE(
    NOTICE_NO NUMBER PRIMARY KEY, /* 공지사항 번호 */
    NOTICE_TITLE VARCHAR2(100), /* 공지사항 제목 */
    NOTICE_CONTENT VARCHAR2(1000), /* 공지사항 내용 */
    NOTICE_DATE DATE /* 공지사항 작성 날짜 */
);

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항 번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지사항 내용';
COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '공지사항 작성 날짜';


/* 후기 게시판 */
CREATE TABLE REVIEW(
    REVIEW_NO NUMBER PRIMARY KEY, /* 후기 번호 */
    PRODUCT_CODE NUMBER, /* 대여 상품 코드 */
    MEMBER_ID VARCHAR2(20), /* 회원 아이디 */
    REVIEW_TITLE VARCHAR2(50), /* 후기 제목 */
    REVIEW_CONTENT VARCHAR2(1000), /* 후기 내용 */
    REVIEW_RATING NUMBER, /* 별 갯수 */
    IMAGE_PATH varchar2(100), /* 이미지 이름 */
    REVIEW_DATE DATE, /* 후기 작성 날짜 */
    CONSTRAINT REVIEW_FK1 FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID),
    CONSTRAINT REVIEW_FK2 FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT (PRODUCT_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '후기 번호';
COMMENT ON COLUMN REVIEW.PRODUCT_CODE IS '대여 상품 코드';
COMMENT ON COLUMN REVIEW.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN REVIEW.REVIEW_TITLE IS '후기 제목';
COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '후기 내용';
COMMENT ON COLUMN REVIEW.REVIEW_RATING IS '별갯수';
COMMENT ON COLUMN REVIEW.image_path IS '이미지 이름';
COMMENT ON COLUMN REVIEW.REVIEW_DATE IS '후기 작성 날짜';

/* 문의 */
CREATE TABLE QNA(
    QNA_NO NUMBER PRIMARY KEY, /* 문의 번호 */
    MEMBER_ID VARCHAR2(20), /* 회원 아이디 */
    QNA_TITLE VARCHAR2(50), /* 문의 제목 */
    QNA_CONTENT VARCHAR2(1000), /* 문의 내용 */
    QNA_CATEGORY VARCHAR2(30), /* 문의 카테고리 */
    QNA_COMMENT VARCHAR2(500), /* 문의 답변 */
    QNA_DATE DATE, /* 문의 작성 날짜 */
    IMG_PATH VARCHAR2(100), /* 이미지 */
    CONSTRAINT QNA_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID)
);

COMMENT ON COLUMN QNA.QNA_NO IS '문의 번호';
COMMENT ON COLUMN QNA.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN QNA.QNA_TITLE IS '문의 제목';
COMMENT ON COLUMN QNA.QNA_CONTENT IS '문의 내용';
COMMENT ON COLUMN QNA.QNA_CATEGORY IS '문의 카테고리';
COMMENT ON COLUMN QNA.QNA_COMMENT IS '문의 답변';
COMMENT ON COLUMN QNA.QNA_DATE IS '문의 작성 날짜';
COMMENT ON COLUMN QNA.IMG_PATH IS '이미지';


/* 경매수입 */
CREATE TABLE INCOME (
    AUCTION_CODE NUMBER, /* 경매 코드 */
    INCOME NUMBER, /* 수입액 */
    INCOME_DATE DATE, /* 수입일 */
    RECEIVER_NAME varchar2(30), /*받는이*/
	RECEIVER_ADDRESS varchar2(400), /*받는 주소*/
	RECEIVER_PHONE varchar2(20), /*연락처*/
	ORDER_INVOICE_NUMBER number, /*송장번호*/
    CONSTRAINT INCO_FK2 FOREIGN KEY (AUCTION_CODE) REFERENCES AUCTION (AUCTION_CODE)
);

COMMENT ON COLUMN INCOME.AUCTION_CODE IS '경매 코드';
COMMENT ON COLUMN INCOME.INCOME IS '수입액';
COMMENT ON COLUMN INCOME.INCOME_DATE IS '수입일';


------------------------------ 샘플 데이터 ------------------------------
-- admin password : qweqwe
-- usera password : asdasd
-- userb password : zxczxc
INSERT INTO MEMBER VALUES('admin', '9c7f18d8b1ec46ec42373a7503ded3622abb792bba368d24cfd005de73b648cf', '관리자', TO_DATE('19891002', 'YYMMDD'), SYSDATE, '010-6482-6959', '69-74', '역삼동','고시원', 0, 9, 'n', 'wlsrb8993@gmail.com', 'e3144b8e5b42fbbe');
INSERT INTO MEMBER VALUES('usera', '9f482821f08b077d5f4647382642f5b599a4ff19b0232cda531454c07bbee279', '회원1', TO_DATE('19900101', 'YYMMDD'), SYSDATE, '010-1111-1111', '111-11', '가가시 가가구','가가로 11', 0, 3, 'n', 'asdf01@gmail.com', '0c05bcf2fe31be71');
INSERT INTO MEMBER VALUES('userb', '8a0ac72cb8e93e0fd417998673b5c42295b18bb78672757b0ec95ba61f2df0f7', '관리자', TO_DATE('19900102', 'YYMMDD'), SYSDATE, '010-2222-2222', '222-22', '나나시 나나구','나나로 22', 0, 2, 'n', 'asdf02@gmail.com', '8005688f5fbbf608');

/* OUTER 15 */
INSERT INTO PRODUCT VALUES(1500000001, '브리애니 자켓', 'outer', 'JOIE', '임시설명', 790000, 49000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170901', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000002, '니티드 미니멀 베스트', 'outer', 'CHRISTIAN WIJNANTS', '임시설명', 760000, 38000, '0', '1', '1', '0', '0', '라임 엘로우', TO_DATE('170902', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000003, '더블 버튼 라이트 자켓', 'outer', 'ERIKA CAVALLINI', '임시설명', 763000, 38150, '0', '1', '1', '1', '1', '카키', TO_DATE('170903', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000004, '러플 트리밍 코트', 'outer', 'PIECE', '임시설명', 860000, 43000, '0', '0', '1', '1', '0', '블랙', TO_DATE('170904', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000005, '자카드 패브릭 자켓', 'outer', 'JUCCA', '임시설명', 882000, 44100, '0', '0', '1', '1', '1', '베이지', TO_DATE('170905', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000006, '프린티드 코튼 자켓', 'outer', 'JUCCA', '임시설명', 823000, 41150, '0', '0', '1', '1', '1', '색상', TO_DATE('170906', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000007, '스트라이프 실키 자켓', 'outer', 'JUCCA', '임시설명', 654000, 32700, '0', '0', '1', '1', '0', '색상', TO_DATE('170907', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000008, '더블버튼 자켓', 'outer', 'TRUE NYC', '임시설명', 502000, 25100, '0', '0', '1', '1', '1', '색상', TO_DATE('170908', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000009, '사파리 벨티드 베스트', 'outer', 'ERIKA CAVALLINI', '임시설명', 728000, 36400, '0', '0', '1', '1', '1', '베이지', TO_DATE('170909', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000010, '스트라이프 숄카라 자켓', 'outer', 'LUCIO VANOTTI', '임시설명', 893000, 44650, '0', '0', '1', '1', '0', '그레이', TO_DATE('170910', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000011, '플라워 집업 봄버', 'outer', 'THE EDITOR', '임시설명', 921000, 46050, '0', '0', '1', '1', '0', '핑크', TO_DATE('170911', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000012, '러스트 프린트 파자마 자켓', 'outer', 'M. MARTIN', '임시설명', 1070000, 53500, '0', '1', '1', '1', '0', '브라운', TO_DATE('170912', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000013, '올오버 패턴 믹스드 자켓', 'outer', 'BITTE KAI RAND', '임시설명', 620000, 31000, '0', '1', '1', '0', '0', '베이지', TO_DATE('170913', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000014, '플리츠 슬리브 데님 자켓', 'outer', 'EDIT', '임시설명', 655000, 32750, '0', '1', '1', '0', '0', '블루', TO_DATE('170914', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000015, '본딩 울 랜덤 헴 코트', 'outer', 'ENFOLD', '임시설명', 1520000, 76000, '0', '1', '1', '0', '0', '그레이', TO_DATE('170915', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000016, '체크 스쿨 자켓', 'outer', 'TRUE NYC', '임시설명', 525000, 26250, '0', '0', '1', '1', '1', '레드', TO_DATE('170916', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000017, '램스킨 라이더 자켓', 'outer', 'LOOKAST', '임시설명', 338000, 16900, '0', '0', '1', '1', '0', '블랙', TO_DATE('170917', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000018, '에스닉 패치워크 자켓', 'outer', 'SWILDENS', '임시설명', 457000, 22850, '0', '0', '1', '1', '1', '멀티', TO_DATE('170918', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000019, '알레아 볼레로 자켓', 'outer', 'MARIE SIXTINE', '임시설명', 238000, 11900, '0', '1', '1', '1', '0', '핑크', TO_DATE('170919', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000020, '글렌 체크 트렌치 코트', 'outer', 'ENFOLD', '임시설명', 1520000, 76000, '0', '1', '1', '1', '0', '그레이', TO_DATE('170920', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000021, '오버사이즈 튜닉 코트', 'outer', 'TARA JARMON', '임시설명', 635000, 31750, '0', '0', '1', '1', '0', '화이트', TO_DATE('170921', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000022, '플리츠 레이어드 베스트', 'outer', 'RE;CODE', '임시설명', 490000, 24500, '0', '0', '1', '1', '0', '그레이', TO_DATE('170922', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000023, '아닐리 원 버튼 자켓', 'outer', 'MARIE SIXTINE', '임시설명', 198000, 9900, '0', '1', '1', '1', '0', '브라운', TO_DATE('170923', 'RRMMDD'), DEFAULT, DEFAULT);
INSERT INTO PRODUCT VALUES(1500000024, '투 포켓 크롭 자켓', 'outer', 'TARA JARMON', '임시설명', 661000, 33050, '0', '0', '1', '1', '1', '화이트', TO_DATE('170924', 'RRMMDD'), DEFAULT, DEFAULT);

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

INSERT INTO PRODUCT_IMAGE VALUES(1500000009, '1500000009_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000009, '1500000009_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000009, '1500000009_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000010, '1500000010_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000010, '1500000010_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000010, '1500000010_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000011, '1500000011_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000011, '1500000011_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000011, '1500000011_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000012, '1500000012_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000012, '1500000012_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000012, '1500000012_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000013, '1500000013_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000013, '1500000013_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000013, '1500000013_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000014, '1500000014_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000014, '1500000014_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000014, '1500000014_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000015, '1500000015_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000015, '1500000015_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000015, '1500000015_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000016, '1500000016_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000016, '1500000016_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000016, '1500000016_3.jpg');

INSERT INTO PRODUCT_IMAGE VALUES(1500000017, '1500000017_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000017, '1500000017_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000017, '1500000017_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000018, '1500000018_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000018, '1500000018_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000018, '1500000018_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000019, '1500000019_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000019, '1500000019_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000019, '1500000019_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000020, '1500000020_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000020, '1500000020_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000020, '1500000020_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000021, '1500000021_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000021, '1500000021_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000021, '1500000021_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000022, '1500000022_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000022, '1500000022_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000022, '1500000022_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000023, '1500000023_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000023, '1500000023_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000023, '1500000023_3.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000024, '1500000024_1.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000024, '1500000024_2.jpg');
INSERT INTO PRODUCT_IMAGE VALUES(1500000024, '1500000024_3.jpg');

INSERT INTO RENT_LIST VALUES(1, 1500000001, 'admin', TO_DATE('20170808', 'YYMMDD'), TO_DATE('20170815', 'YYMMDD'));

INSERT INTO RENTAL_RESERVE VALUES(1500000001, 'admin', SYSDATE, SYSDATE);

INSERT INTO WISH VALUES('usera', 1500000001);

INSERT INTO MESSAGE VALUES(1, 'admin', '안녕', '나는 관리자야', SYSDATE, 'n');

INSERT INTO AUCTION VALUES(1, '블라우스', '의류', 'LAP', '실크 소재의 고급 원단', 10000, TO_DATE('20170909', 'YYMMDD'), TO_DATE('20171025', 'YYMMDD'), 's', 'green', 'dress1.jpg,dress2.jpg,dress3.jpg', DEFAULT);
INSERT INTO AUCTION VALUES(2, '토드백', '잡화', 'TOMASINI', '고급 가죽으로 만든 가방',  10000, TO_DATE('20170909', 'YYMMDD'), TO_DATE('20171028', 'YYMMDD'), '25x11x19', 'brown', 'bag1.jpg,bag2.jpg,bag3.jpg', DEFAULT);
INSERT INTO AUCTION VALUES(3, '비바팔찌', '악세사리', 'studio 61x', '18k 도금',  10000, TO_DATE('20170909', 'YYMMDD'), TO_DATE('20171030', 'YYMMDD'), '21cm', 'pink', 'acc1.jpg,acc2.jpg,acc3.jpg', DEFAULT);
INSERT INTO AUCTION VALUES(4, '옷(끝)', '의류', '보세', '화려함',  10000, TO_DATE('20170901', 'YYMMDD'), TO_DATE('20170909', 'YYMMDD'), '끝', '끝', 'end1.jpg,end2.jpg,end3.jpg', DEFAULT);
INSERT INTO AUCTION VALUES(5, '슬리브셔츠', '의류', 'FLEAMADONNA', '언발라스함이 포인또',  10000, TO_DATE('20170901', 'YYMMDD'), TO_DATE('20171021', 'YYMMDD'), 'm', 'navy', 'top1.jpg,top2.jpg,top3.jpg', DEFAULT);

insert into bidinfo values(4, 'usera', 10000);
insert into bidinfo values(4, 'userb', 9000);
insert into bidinfo values(1, 'usera', 12000);
insert into bidinfo values(1, 'userb', 13000);

INSERT INTO ALERT VALUES('admin', 1500000001, TO_DATE('170901', 'YYMMDD'));

INSERT INTO NOTICE VALUES(1, '공지사항', '대여 및 구매시 적립금을 드려요.', SYSDATE);

INSERT INTO REVIEW VALUES(1, 1500000001, 'admin', '좋네요', '은 뻥', '1', null, SYSDATE);
INSERT INTO REVIEW VALUES(2, 1500000002, 'admin', '좋네요', '은 뻥', '1', NULL, SYSDATE);

INSERT INTO QNA VALUES(1, 'admin', '란희백 얼마', '냉무', '상품질문', '비싸', SYSDATE, NULL);


COMMIT;