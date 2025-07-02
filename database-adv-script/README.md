# Complex SQL JOIN Queries

This directory contains SQL queries that demonstrate mastery of SQL JOINs using realistic Airbnb Clone data relationships.

## File: joins_queries.sql

### 1. INNER JOIN
- Retrieves all bookings and the respective users who made those bookings.
- Matches only records where a user has made a booking.

### 2. LEFT JOIN
- Retrieves all properties and their reviews.
- Includes properties that may not have any reviews yet.

### 3. FULL OUTER JOIN
- Retrieves all users and all bookings.
- Ensures that even users without bookings or bookings without users (e.g., orphan data) are included.
- Requires PostgreSQL or another DBMS that supports FULL OUTER JOIN.

## Usage
Run the queries using your PostgreSQL CLI or any compatible SQL client.

```bash
psql -d airbnb_clone -f joins_queries.sql

Requirements
- PostgreSQL
- Existing tables: users, bookings, properties, reviews

Author
Prince Ochogwu – ALX Backend Advanced SQL Project