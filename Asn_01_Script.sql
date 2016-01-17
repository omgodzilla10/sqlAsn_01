SET ECHO ON

SPOOL 'C:\Users\Trevor\Documents\GitHub\sqlAsn_01\Asn1_HoefslootTrevor_StannusOliver_DarrenChan.txt';

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';

DROP TABLE Hotel;
DROP TABLE Room;
DROP TABLE Guest;
DROP TABLE Booking;


CREATE TABLE Hotel
(hotelNo		DECIMAL(8)		NOT NULL
,hotelName		VARCHAR2(30)	NOT NULL
,city			VARCHAR2(20)	NOT NULL
,CONSTRAINT PKHotel PRIMARY KEY (hotelNo)
);

CREATE TABLE Room
(roomNo			DECIMAL(3)		NOT NULL CHECK(roomNo >= 1 AND roomNo <= 100)
,hotelNo		DECIMAL(4)		NOT NULL
,rmType			VARCHAR2(20)	NOT NULL CHECK(rmType = 'Double' OR rmType = 'Family' OR rmType = 'Single')
,price			DECIMAL(5, 2)	NOT NULL CHECK(price >= 10 AND price <= 100)
,CONSTRAINT PKRoom PRIMARY KEY (roomNo)
,CONSTRAINT FKHotelNo FOREIGN KEY (hotelNo) REFERENCES Hotel (hotelNo)
);

CREATE TABLE Guest
(guestNo		DECIMAL(12)		NOT NULL
,guestName		VARCHAR2(30)	NOT NULL
,guestAddress	VARCHAR2(40)	NOT NULL
,CONSTRAINT PKGuest PRIMARY KEY (guestNo)
);

CREATE TABLE Booking
(hotelNo		DECIMAL(8)		NOT NULL
 ,guestNo    	DECIMAL(12)		NOT NULL
 ,dateFrom      DATE            NOT NULL WHERE(dateFrom >= CURRENT_DATE)
 ,dateTo        DATE            NOT NULL WHERE(dateTo >= CURRENT_DATE)
 ,roomNo        DECIMAL(4)      NOT NULL
 ,CONSTRAINT PKBooking PRIMARY KEY (dateFrom)
 ,CONSTRAINT FKRoomNo FOREIGN KEY (roomNo) REFERENCES Room(roomNo)
 ,CONSTRAINT FKBookingHotelNo FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo)
 ,CONSTRAINT FKGuestNo FOREIGN KEY (guestNo) REFERENCES Guest(guestNo)
 );
 
 CREATE ASSERTION RoomsCannotDoubleBook
	CHECK (SELECT hotelNo
	FROM Booking
	GROUP BY hotelNo, roomNo
 
SPOOL OFF