SET ECHO ON

SPOOL 'C:\Users\Trevor\Documents\GitHub\sqlAsn_01\Asn1_HoefslootTrevor_StannusOliver_DarrenChan.txt';

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';

DROP TABLE Hotel;
DROP TABLE Room;
DROP TABLE Booking;
DROP TABLE Guest;

CREATE TABLE Hotel
(hotelNo		DECIMAL(8)		NOT NULL
,hotelName		VARCHAR2(30)	NOT NULL
,city			VARCHAR2(20)	NOT NULL
,CONSTRAINT PKHotel PRIMARY KEY (hotelNo)
);

CREATE TABLE Room
(roomNo			DECIMAL(4)		NOT NULL
,hotelNo		DECIMAL(8)		NOT NULL
,rmType			VARCHAR2(20)	NOT NULL CHECK(rmType == 'Double' OR rmType == 'Family' OR rmType == 'Single')
,price			DECIMAL(10, 2)	NOT NULL
,CONSTRAINT PKRoom PRIMARY KEY (roomNo)
,CONSTRAINT FKHotelNo FOREIGN KEY (hotelNo) REFERENCES Hotel (roomNo)
);

CREATE TABLE Guest
(guestNo		DECIMAL(12)		NOT NULL
,guestName		VARCHAR2(30)	NOT NULL
,guestAddress	VARCHAR2(40)	NOT NULL
,CONSTRAINT PKGuest PRIMARY KEY (guestNo)
);

CREATE TABLE Booking
(,hotelNo		DECIMAL(8)		NOT NULL
 ,guestNo    	DECIMAL(12)		NOT NULL
 ,dateFrom      DATE            NOT NULL
 ,dateTo        DATE            NOT NULL
 ,roomNo        DECIMAL(4)      NOT NULL
 ,CONSTRAINT PKHotel PRIMARY KEY (dateFrom)
 ,CONSTRAINT FKHotelNo FOREIGN KEY (hotelNo) REFERENCES Hotel(roomNo)
 ,CONSTRAINT FKGuestNo FOREIGN KEY (guestNo) REFERENCES Guest(guestNo)
 );
 
SPOOL OFF