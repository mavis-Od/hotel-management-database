# Hotel Management System Database | Oracle SQL

## Project Overview

This project involves designing a relational database for a hotel management system using Oracle SQL. The database manages hotel information, room categories, rooms, staff, guests, bookings, and payments.

The project demonstrates relational database design, table creation, primary and foreign key constraints, and the use of SQL to organize hotel operations.

## Business Problem

Hotels need to maintain accurate records of rooms, guests, reservations, employees, and payments. A well-designed relational database helps organize these records, maintain relationships between entities, and retrieve information for operational reporting.

## Project Objectives

- Design a relational database for hotel operations.
- Organize hotel data into related tables.
- Define primary keys and foreign key relationships.
- Store guest and staff information.
- Manage room categories, room status, and reservations.
- Record booking details and associated payments.

## Tools and Technologies

- Oracle SQL
- Oracle SQL Developer
- Relational database design
- Entity-Relationship Diagram (ERD)

## Database Tables

The database contains seven tables:

| Table | Purpose |
|---|---|
| HOTEL | Stores hotel name, city, contact details, star rating, and check-in/check-out times. |
| ROOM_TYPE | Stores room categories, descriptions, prices per night, and capacity. |
| Room | Stores room names, associated hotels, room types, and occupancy status. |
| Staff | Stores employee details, positions, salaries, contact information, and hire dates. |
| Guest | Stores guest details and contact information. |
| Booking | Records guest reservations, rooms, check-in/check-out dates, and total prices. |
| Payment | Records booking payments, amounts, dates, and payment methods. |

## Database Relationships

The schema uses primary keys to uniquely identify records and foreign keys to link related tables.

- HOTEL → Room
- HOTEL → Staff
- ROOM_TYPE → Room
- Guest → Booking
- Room → Booking
- Booking → Payment

## Sample Business Questions

The database can support SQL queries to answer questions such as:

- Which rooms are occupied or available?
- What are the prices of different room categories?
- Which guests have made reservations?
- What are the check-in and check-out dates for each booking?
- How much revenue has been recorded from bookings?
- Which payment methods have been used?
- What is the total salary expenditure for hotel staff?

## Project Files

- `hotel_database.sql` — table definitions and sample data inserts.
- `hotel_erd.png` — visual representation of the database structure.

## Skills Demonstrated

Oracle SQL, CREATE TABLE, INSERT statements, primary keys, foreign keys, relational database design, referential integrity, date and timestamp handling, and SQL querying.

## Conclusion

This project demonstrates the design of a relational database for hotel operations using Oracle SQL. It provides a foundation for organizing hotel, room, guest, staff, booking, and payment records for operational reporting and further analysis.
