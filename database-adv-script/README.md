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

# SQL Subqueries – ALX Airbnb Clone Backend

This directory contains SQL subqueries for retrieving specific data insights from the Airbnb Clone relational database.

## File: subqueries.sql

### 1. Non-Correlated Subquery
- Retrieves all properties where the **average rating is greater than 4.0**.
- Uses a subquery in the `WHERE` clause that is independent of the outer query.

```sql
SELECT id, name, location
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

2. Correlated Subquery
Retrieves all users who have made more than 3 bookings.

The subquery depends on the outer query and is re-evaluated for each user.

SELECT id, first_name, last_name, email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;

bash
psql -d airbnb_clone -f subqueries.sql