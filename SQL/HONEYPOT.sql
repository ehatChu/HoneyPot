-- DROP
DROP TABLE MEMBER;
DROP TABLE POINT;
DROP TABLE FRIEND;
DROP TABLE NOTICE;
DROP TABLE NOTICE_IMG;
DROP TABLE REPLY;
DROP TABLE BOARD;
DROP TABLE BOARD_CATEGORY;
DROP TABLE FAQ;
DROP TABLE ADMIN;
DROP TABLE NOTICE_CATEGORY;
DROP TABLE FAQ_CATEGORY;
DROP TABLE QNA;
DROP TABLE QNA_CATEGORY;
DROP TABLE CHATTING_ROOM;
DROP TABLE CHATTING_MESSAGE;
DROP TABLE DELIVERY;
DROP TABLE REPORT;
DROP TABLE REPORT_CATEGORY;
DROP TABLE AMENITY_RESERVATION;
DROP TABLE ACCOUNT;
DROP TABLE ACCOUNT_CATEGORY;
DROP TABLE BOARD_IMG;
DROP TABLE BOARD_STATUS;
DROP TABLE CHATTING_MEMBER_LIST;
DROP TABLE LOVE;
DROP TABLE RESTRICTION;
DROP TABLE MEMBER_FEE;
DROP TABLE MEMBER_FEE_CATEGORY;
DROP TABLE MEMBER_CALENDAR;
DROP TABLE NOTICE_CALENDAR;
DROP TABLE EQUIPMENT;
DROP TABLE BREAKFAST;
DROP TABLE MEAL_RESERVATION;
DROP TABLE AROUND_EVALUATION;
DROP TABLE VOTE_CANDIDATE;
DROP TABLE VOTE;
DROP TABLE PERSONAL_VOTE;
DROP TABLE CAPTAIN_LOVE;
DROP TABLE ADMIN_FEE_CATEGORY;
DROP TABLE ADMIN_FEE;
DROP TABLE PARCEL;
DROP TABLE DIET;
DROP TABLE AROUND;
DROP TABLE BICYCLE;
DROP TABLE CAR;
DROP TABLE AMENITY_IMG;
DROP TABLE ADMIN_CALL;
DROP TABLE AMENITY_MANAGE;
DROP TABLE AMENITY;

-- CREATE

CREATE TABLE MEMBER (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(100)		NULL,
	ID	VARCHAR2(100)		NULL,
	PWD	VARCHAR2(100)		NULL,
	DONG_NUM	NUMBER		NULL,
	HO_NUM	NUMBER		NULL,
	BIRTH	CHAR(8)		NULL,
	PHONE	CHAR(11)		NULL,
	EMAIL	VARCHAR2(100)		NULL,
	PROFILE	VARCHAR2(500)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL,
	GRADE	CHAR(1)	DEFAULT 'M'	NULL
);
DROP SEQUENCE SEQ_MEMBER_NO;
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE NOCYCLE;

CREATE TABLE POINT (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	SCORE	NUMBER		NULL,
	CONTENT	VARCHAR2(500)		NULL,
	POINT_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	CHECK_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_POINT_NO;
CREATE SEQUENCE SEQ_POINT_NO NOCACHE NOCYCLE;

CREATE TABLE FRIEND (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	FRIEND_NO	NUMBER		NOT NULL
);
DROP SEQUENCE SEQ_FRIEND_NO;
CREATE SEQUENCE SEQ_FRIEND_NO NOCACHE NOCYCLE;

CREATE TABLE NOTICE (
	NO	NUMBER		NOT NULL,
	NOTICE_CNO	NUMBER		NOT NULL,
	WRTIER_NO	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL,
	HIT	NUMBER	DEFAULT 0	NULL,
	IMPORTANT_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_NOTICE_NO;
CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE NOCYCLE;

CREATE TABLE NOTICE_IMG (
	NO	NUMBER		NOT NULL,
	NOTICE_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);

CREATE TABLE REPLY (
	NO	NUMBER		NOT NULL,
	BOARD_NO	NUMBER		NOT NULL,
	WRITER_NO	VARCHAR2(500)		NOT NULL,
	REPLY_NO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL
);
DROP SEQUENCE SEQ_REPLY_NO;
CREATE SEQUENCE SEQ_REPLY_NO NOCACHE NOCYCLE;

CREATE TABLE BOARD (
	NO	NUMBER		NOT NULL,
	WRITER_NO	VARCHAR2(500)		NOT NULL,
	BOARD_STATUS_NO	NUMBER		NOT NULL,
	BOARD_CNO	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	HIT	NUMBER	DEFAULT 0	NULL
);

CREATE TABLE BOARD_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);

CREATE TABLE FAQ (
	NO	NUMBER		NOT NULL,
	WRITER_NO	NUMBER		NOT NULL,
	FAQ_CNO	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	QUESTION	VARCHAR2(1000)		NULL,
	ANSWER	VARCHAR2(4000)		NULL,
	STATUS	CHAR(1)	DEFAULT 'N'	NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	HIT	NUMBER	DEFAULT 0	NULL
);
DROP SEQUENCE SEQ_FAQ_NO;
CREATE SEQUENCE SEQ_FAQ_NO NOCACHE NOCYCLE;

CREATE TABLE ADMIN (
	NO	NUMBER		NOT NULL,
	ID	VARCHAR2(100)		NULL,
	PWD	VARCHAR2(100)		NULL,
	NAME	VARCHAR2(100)		NULL,
	GRADE	CHAR(1)		NULL,
	PROFILE	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_ADMIN_NO;
CREATE SEQUENCE SEQ_ADMIN_NO NOCACHE NOCYCLE;

CREATE TABLE NOTICE_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_NOTICE_CATEGORY_NO;
CREATE SEQUENCE SEQ_NOTICE_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE FAQ_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_FAQ_CATEGORY_NO;
CREATE SEQUENCE SEQ_FAQ_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE QNA (
	NO	NUMBER		NOT NULL,
	QNA_CNO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	ANSWERER_NO	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	ANSWER_DATE	TIMESTAMP		NULL,
	ANSWER	VARCHAR2(4000)		NULL
);
DROP SEQUENCE SEQ_QNA_NO;
CREATE SEQUENCE SEQ_QNA_NO NOCACHE NOCYCLE;

CREATE TABLE QNA_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_QNA_CATEGORY_NO;
CREATE SEQUENCE SEQ_QNA_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE CHATTING_ROOM (
	NO	NUMBER		NOT NULL,
	MASTER_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	IMG	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_CHATTING_ROOM_NO;
CREATE SEQUENCE SEQ_CHATTING_ROOM_NO NOCACHE NOCYCLE;

CREATE TABLE CHATTING_MESSAGE (
	NO	NUMBER		NOT NULL,
	CHATTING_ROOM_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	SEND_TIME	TIMESTAMP	DEFAULT SYSDATE	NULL,
	CONTENT	VARCHAR2(4000)		NULL
);
DROP SEQUENCE SEQ_CHATTING_MESSAGE_NO;
CREATE SEQUENCE SEQ_CHATTING_MESSAGE_NO NOCACHE NOCYCLE;

CREATE TABLE DELIVERY (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	ARRIVE_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	RECEIVE_DATE	TIMESTAMP		NULL,
	CHECK_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_DELIVERY_NO;
CREATE SEQUENCE SEQ_DELIVERY_NO NOCACHE NOCYCLE;

CREATE TABLE REPORT (
	NO	NUMBER		NOT NULL,
	REPORT_CNO	NUMBER		NOT NULL,
	REPORTER	NUMBER		NOT NULL,
	RESPONDENT	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	ANSWER_DATE	TIMESTAMP		NULL
);
DROP SEQUENCE SEQ_REPORT_NO;
CREATE SEQUENCE SEQ_REPORT_NO NOCACHE NOCYCLE;

CREATE TABLE REPORT_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_REPORT_CATEGORY_NO;
CREATE SEQUENCE SEQ_REPORT_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE AMENITY_RESERVATION (
	NO	NUMBER		NOT NULL,
	AMENITY_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	RESERVE_TIME	CHAR(10)		NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL
);
DROP SEQUENCE SEQ_AMENITY_RESERVATION_NO;
CREATE SEQUENCE SEQ_AMENITY_RESERVATION_NO NOCACHE NOCYCLE;

CREATE TABLE AMENITY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	MAX_NUM	NUMBER		NULL,
	OPEN_TIME	TIMESTAMP		NULL,
	CLOSE_TIME	TIMESTAMP		NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL,
	LOCATION	VARCHAR2(2000)		NULL,
	IMG	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_AMENITY_NO;
CREATE SEQUENCE SEQ_AMENITY_NO NOCACHE NOCYCLE;

CREATE TABLE ACCOUNT (
	NO	NUMBER		NOT NULL,
	WRITER_NO	NUMBER		NOT NULL,
	ACCOUNT_CNO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	PRICE	NUMBER		NULL,
	ACCOUNT_DATE	TIMESTAMP		NULL
);
DROP SEQUENCE SEQ_ACCOUNT_NO;
CREATE SEQUENCE SEQ_ACCOUNT_NO NOCACHE NOCYCLE;

CREATE TABLE ACCOUNT_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_ACCOUNT_CATEGORY_NO;
CREATE SEQUENCE SEQ_ACCOUNT_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE BOARD_IMG (
	NO	NUMBER		NOT NULL,
	BOARD_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_BOARD_IMG_NO;
CREATE SEQUENCE SEQ_BOARD_IMG_NO NOCACHE NOCYCLE;

CREATE TABLE BOARD_STATUS (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_BOARD_STATUS_NO;
CREATE SEQUENCE SEQ_BOARD_STATUS_NO NOCACHE NOCYCLE;

CREATE TABLE CHATTING_MEMBER_LIST (
	CHATTING_ROOM_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	READ_TIME	TIMESTAMP		NULL
);

CREATE TABLE LOVE (
	MEMBER_NO	NUMBER		NOT NULL,
	BOARD_NO	NUMBER		NOT NULL
);

CREATE TABLE RESTRICTION (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL
);
DROP SEQUENCE SEQ_RESTRICTION_NO;
CREATE SEQUENCE SEQ_RESTRICTION_NO NOCACHE NOCYCLE;

CREATE TABLE MEMBER_FEE (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	FEE_CNO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(500)		NULL,
	PRICE	NUMBER		NULL,
	PAYMENT_DATE	TIMESTAMP		NULL
);
DROP SEQUENCE SEQ_MEMBER_FEE_NO;
CREATE SEQUENCE SEQ_MEMBER_FEE_NO NOCACHE NOCYCLE;

CREATE TABLE MEMBER_FEE_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_MEMBER_FEE_CATEGORY_NO;
CREATE SEQUENCE SEQ_MEMBER_FEE_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE MEMBER_CALENDAR (
	NO	NUMBER		NOT NULL,
	WRITER_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	START_DATE	TIMESTAMP		NULL,
	END_DATE	TIMESTAMP		NULL,
	LOVE	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_MEMBER_CALENDAR_NO;
CREATE SEQUENCE SEQ_MEMBER_CALENDAR_NO NOCACHE NOCYCLE;

CREATE TABLE NOTICE_CALENDAR (
	NO	NUMBER		NOT NULL,
	WRTIER_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	START_DATE	TIMESTAMP		NULL,
	END_DATE	TIMESTAMP		NULL,
	LOVE	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_NOTICE_CALENDAR_NO;
CREATE SEQUENCE SEQ_NOTICE_CALENDAR_NO NOCACHE NOCYCLE;

CREATE TABLE EQUIPMENT (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	CNT	NUMBER		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL
);
DROP SEQUENCE SEQ_EQUIPMENT_NO;
CREATE SEQUENCE SEQ_EQUIPMENT_NO NOCACHE NOCYCLE;

CREATE TABLE BREAKFAST (
	NO	NUMBER		NOT NULL,
	DIET_NO	NUMBER		NOT NULL,
	BREAKFAST_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL
);
DROP SEQUENCE SEQ_BREAKFAST_NO;
CREATE SEQUENCE SEQ_BREAKFAST_NO NOCACHE NOCYCLE;

CREATE TABLE MEAL_RESERVATION (
	NO	NUMBER		NOT NULL,
	MEAL_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL
);
DROP SEQUENCE SEQ_MEAL_RESERVATION_NO;
CREATE SEQUENCE SEQ_MEAL_RESERVATION_NO NOCACHE NOCYCLE;

CREATE TABLE AROUND_EVALUATION (
	NO	NUMBER		NOT NULL,
	AROUND_NO	NUMBER		NOT NULL,
	WRITER_NO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	SCORE	NUMBER		NULL,
	ENROLL_DATE	TIMESTAMP		NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL
);
DROP SEQUENCE SEQ_AROUND_EVALUATION_NO;
CREATE SEQUENCE SEQ_AROUND_EVALUATION_NO NOCACHE NOCYCLE;

CREATE TABLE VOTE_CANDIDATE (
	NO	NUMBER		NOT NULL,
	NOTICE_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_VOTE_CANDIDATE_NO;
CREATE SEQUENCE SEQ_VOTE_CANDIDATE_NO NOCACHE NOCYCLE;

CREATE TABLE VOTE (
	NOTICE_NO	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	END_DATE	TIMESTAMP		NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL,
	DUP_YN	CHAR(1)	DEFAULT 'N'	NULL
);

CREATE TABLE PERSONAL_VOTE (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	VOTE_LIST_NO	NUMBER		NOT NULL
);
DROP SEQUENCE SEQ_PERSONAL_VOTE_NO;
CREATE SEQUENCE SEQ_PERSONAL_VOTE_NO NOCACHE NOCYCLE;

CREATE TABLE CAPTAIN_LOVE (
	MEMBER_NO	NUMBER		NOT NULL,
	CAPTATIN_NO	NUMBER		NOT NULL,
	LOVE	CHAR(1)		NULL
);

CREATE TABLE ADMIN_FEE_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_ADMIN_FEE_CATEGORY_NO;
CREATE SEQUENCE SEQ_ADMIN_FEE_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE ADMIN_FEE (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	FEE_CNO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(500)		NULL,
	PRICE	NUMBER		NULL,
	PAYMENT_DATE	TIMESTAMP		NULL
);
DROP SEQUENCE SEQ_ADMIN_FEE_NO;
CREATE SEQUENCE SEQ_ADMIN_FEE_NO NOCACHE NOCYCLE;

CREATE TABLE PARCEL (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	ARRIVE_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	RECEIVE_DATE	TIMESTAMP		NULL,
	CHECK_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_PARCEL_NO;
CREATE SEQUENCE SEQ_PARCEL_NO NOCACHE NOCYCLE;

CREATE TABLE DIET (
	NO	NUMBER		NOT NULL,
	MENU	VARCHAR2(500)		NULL,
	NUTRIENT	VARCHAR2(500)		NULL,
	IMG	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_DIET_NO;
CREATE SEQUENCE SEQ_DIET_NO NOCACHE NOCYCLE;

CREATE TABLE AROUND (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	LATITUDE	CHAR(18)		NULL,
	LONGITUDE	CHAR(18)		NULL
);
DROP SEQUENCE SEQ_AROUND_NO;
CREATE SEQUENCE SEQ_AROUND_NO NOCACHE NOCYCLE;

CREATE TABLE BICYCLE (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	UNIQUE_NUM	VARCHAR2(100)		NULL,
	IMG	VARCHAR2(500)		NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_BICYCLE_NO;
CREATE SEQUENCE SEQ_BICYCLE_NO NOCACHE NOCYCLE;

CREATE TABLE CAR (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	UNIQUE_NUM	VARCHAR2(100)		NULL,
	IMG	VARCHAR2(500)		NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_CAR_NO;
CREATE SEQUENCE SEQ_CAR_NO NOCACHE NOCYCLE;

CREATE TABLE AMENITY_IMG (
	NO	NUMBER		NOT NULL,
	AMENITY_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(100)		NULL
);
DROP SEQUENCE SEQ_AMENITY_IMG_NO;
CREATE SEQUENCE SEQ_AMENITY_IMG_NO NOCACHE NOCYCLE;

CREATE TABLE ADMIN_CALL (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(500)		NULL,
	CALL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	CHECK_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_ADMIN_CALL_NO;
CREATE SEQUENCE SEQ_ADMIN_CALL_NO NOCACHE NOCYCLE;

CREATE TABLE AMENITY_MANAGE (
	NO	NUMBER		NOT NULL,
	AMENITY_NO	NUMBER		NOT NULL,
	START_DATE	TIMESTAMP		NULL,
	END_DATE	TIMESTAMP		NULL
);
DROP SEQUENCE SEQ_AMENITY_MANAGE_NO;
CREATE SEQUENCE SEQ_AMENITY_MANAGE_NO NOCACHE NOCYCLE;
