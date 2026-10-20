-- ==========================================
-- HOTEL MANAGEMENT SYSTEM DATABASE SCHEMA
-- Database: Oracle SQL
-- ==========================================

-- 1. HOTEL TABLE
CREATE TABLE HOTEL(
    HOTEL_ID VARCHAR2(10) PRIMARY KEY, 
    HOTEL_NAME VARCHAR2(30),
    CITY VARCHAR2(30),
    PHONE_NUMBER NUMBER,
    EMAIL VARCHAR2(30),
    STARS VARCHAR2(10),
    CHECKIN_TIME TIMESTAMP,
    CHECKOUT_TIME TIMESTAMP
);

INSERT INTO hotel VALUES(
    '95', 'Terra Verde Hotel', 'Benin-City', 07084011176, 'Terraverde@gmail.com',
    '5 Stars', TO_TIMESTAMP('2026-01-03 12:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2026-01-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS')
);


-- 2. ROOM TYPE TABLE
CREATE TABLE ROOM_TYPE(
    Type_ID VARCHAR2(10) PRIMARY KEY,
    Room_name VARCHAR2(30),
    Room_Description VARCHAR2(100),
    Price_Per_Night NUMBER(30),
    Capacity VARCHAR2(20)
);

INSERT INTO Room_type VALUES('001', 'Standard', 'Cozy, Comfortable bed, en-suite bathroom, Wi-Fi, TV', 20000, '2');
INSERT INTO Room_type VALUES('011', 'Deluxe Room', 'Spacious, king bed, balcony, upgraded amenities, lounge access', 40000, '3');
INSERT INTO Room_type VALUES('021', 'Family Room', 'Larger room for families, extra beds', 80000, '4');
INSERT INTO Room_type VALUES('027', 'Presidential Suite', 'Top-tier, luxurious suite with premium services', 160000, '2-6');
INSERT INTO Room_type VALUES('032', 'Twin Room', 'Room with two single beds, often for shared occupancy', 15000, '2');


-- 3. ROOM TABLE
CREATE TABLE Room(
    Room_name VARCHAR2(100) PRIMARY KEY,
    Hotel_id VARCHAR2(100),
    Type_ID VARCHAR2(100),
    Status VARCHAR2(100),
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID),
    FOREIGN KEY (Type_ID) REFERENCES Room_Type(Type_ID)
);

INSERT INTO Room VALUES('Standard', '95', '001', 'Not Occupied');
INSERT INTO Room VALUES('Deluxe', '95', '011', 'Occupied');
INSERT INTO Room VALUES('Family Room', '95', '021', 'Not Occupied');
INSERT INTO Room VALUES('Presidential Suite', '95', '027', 'Not Occupied');
INSERT INTO Room VALUES('Twin Room', '95', '032', 'Occupied');


-- 4. STAFF TABLE
CREATE TABLE Staff(
    Staff_ID VARCHAR2(20) PRIMARY KEY,
    Hotel_ID VARCHAR2(10),
    First_name VARCHAR2(30),
    Last_name VARCHAR2(30),
    Staff_Position VARCHAR2(30),
    salary NUMBER,
    Date_Of_Birth DATE,
    Phone_Number NUMBER,
    Email VARCHAR2(30),
    Hire_Date DATE,
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

INSERT INTO Staff VALUES(10, '95', 'Stella', 'Jude', 'Receptionist', 50000, '05-Jan-1993', 08145638221, 'stella@gmail.com', '20-May-2022');
INSERT INTO Staff VALUES(11, '95', 'Andrew', 'Bright', 'Waiter', 45000, '07-Mar-1999', 08135678904, 'andrew@gmail.com', '20-Jan-2022');


-- 5. GUEST TABLE
CREATE TABLE Guest(
    Guest_id VARCHAR2(30) PRIMARY KEY,
    first_name VARCHAR2(30),
    last_name VARCHAR2(30),
    date_of_birth DATE,
    city_address VARCHAR2(30),
    phone_number NUMBER,
    email VARCHAR2(30)
);

INSERT INTO guest VALUES(10, 'Stephanie', 'Moses', '17-JAN-1996', 'benin-city', 0813547633, 'stepanie@gmail.com');
INSERT INTO guest VALUES(11, 'Joshua', 'Edward', '17-May-1999', 'benin-city', 08135235416, 'joshua@gmail.com');
INSERT INTO guest VALUES(12, 'Philip', 'Moses', '20-JAN-1996', 'Asaba', 07035476444, 'philip@gmail.com');
INSERT INTO guest VALUES(13, 'Happy', 'Odey', '17-Apr-1992', 'Warri', 09132157633, 'happy@gmail.com');
INSERT INTO guest VALUES(14, 'Mavis', 'Alexander','22-JAN-2000', 'Abuja', 07084100054, 'mavis@gmail.com');
INSERT INTO guest VALUES(15, 'Lucky', 'Andew', '30-Oct-1996', 'benin-city', 09056432165, 'lucky@gmail.com');
INSERT INTO guest VALUES(16, 'Stephen', 'Odey', '10-Dec-1996', 'benin-city', 08122543678, 'stepen@gmail.com');
INSERT INTO guest VALUES(17, 'Guest', 'Seventeen', '15-Jan-1995', 'benin-city', 08100000000, 'guest17@gmail.com'); -- Added to support booking foreign key
INSERT INTO guest VALUES(18, 'Loveth', 'Ade', '17-Sep-2001', 'Auchi', 08154328593, 'loveth@gmail.com');
INSERT INTO guest VALUES(19, 'Madu', 'Orobosa', '17-June-2000', 'benin-city', 08165324512, 'madu@gmail.com');


-- 6. BOOKING TABLE
CREATE TABLE Booking(
    Booking_id VARCHAR2(50) PRIMARY KEY,
    guest_id VARCHAR2(50),
    Room_name VARCHAR2(30),
    check_in_date TIMESTAMP, 
    check_out_date TIMESTAMP,
    Total_price NUMBER,
    FOREIGN KEY (guest_id) REFERENCES guest(guest_id),
    FOREIGN KEY (Room_name) REFERENCES Room(Room_name)
);

INSERT INTO booking VALUES('XYXZ-023', 10, 'Standard', TO_TIMESTAMP('2026-01-20 12:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2026-01-21 12:00:00','YYYY-MM-DD HH24:MI:SS'), 20000); 
INSERT INTO booking VALUES('XYXZ-024', 11, 'Standard', TO_TIMESTAMP('2026-01-27 12:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2026-01-28 12:00:00','YYYY-MM-DD HH24:MI:SS'), 20000); 


-- 7. PAYMENT TABLE
CREATE TABLE Payment(
    Payment_id VARCHAR2(10) PRIMARY KEY,
    booking_id VARCHAR2(10),
    Amount NUMBER,
    Payment_date TIMESTAMP,
    Payment_Method VARCHAR2(20),
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

INSERT INTO payment VALUES(2461, 'XYXZ-023', 20000, TO_TIMESTAMP('2026-01-20 11:00:59','YYYY-MM-DD HH24:MI:SS'), 'Transfer');
INSERT INTO payment VALUES(2462, 'XYXZ-024', 20000, TO_TIMESTAMP('2026-01-27 11:00:59','YYYY-MM-DD HH24:MI:SS'), 'Cash');