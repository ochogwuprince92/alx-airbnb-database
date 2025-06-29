# Airbnb Database Schema (DDL)

This directory contains the SQL script used to define the Airbnb database schema in 3NF.

## Files

- `schema.sql`: Contains all `CREATE TABLE` statements for:
  - users
  - properties
  - bookings
  - payments
  - reviews
  - messages

- `README.md`: This is explanation file.

## Features

- Proper use of UUID primary keys
- Use of ENUMs via `CHECK` constraints
- Foreign key constraints for relational integrity
- Indexes on key columns for performance
