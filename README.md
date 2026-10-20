# Hotel Management System Database

A relational database designed in Oracle SQL to manage hotel operations, including guest bookings, room inventories, staff management, and payment processing.

## Entity Relationship Diagram (ERD)
![Hotel Database ERD](hotel_erd.png)

##  Database Schema & Features
The project consists of 6 core tables:
- Hotel: Stores individual property details, contact info, and operating timestamps.
- Room_Type & Room: Manages room categories (Standard, Deluxe, Presidential Suite, etc.), pricing, capacity, and current occupation status.
- Guest & Booking: Tracks customer profiles and links them to specific room reservations.
- Payment: Handles transaction records tied to individual bookings.
- Staff: Manages employee records, roles, salaries, and department info per hotel property.

##  How to Run
1. Clone or download this repository.
2. Open your Oracle SQL environment (such as Oracle SQL Developer).
3. Run the `hotel_database_setup.sql` script to automatically create the tables and insert sample data.
