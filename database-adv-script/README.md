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

# Aggregations and Window Functions – ALX Airbnb Clone Backend

This directory contains SQL queries that demonstrate the use of SQL aggregation and window functions for data analysis in the Airbnb Clone backend.

## File: aggregations_and_window_functions.sql

### 1. Aggregation – Total Bookings per User

This query calculates the total number of bookings each user has made.

```sql
SELECT users.id, users.first_name, users.last_name, COUNT(bookings.id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id, users.first_name, users.last_name
ORDER BY total_bookings DESC;

# Airbnb Database Optimization: Index Implementation

## Objective

Improve the performance of database queries by identifying frequently accessed columns and creating appropriate indexes on them.

## Files

- **database_index.sql**: Contains `CREATE INDEX` statements for optimizing key columns in the `users`, `bookings`, and `properties` tables.
- **index_performance.md**: Performance analysis using `EXPLAIN ANALYZE` to compare query execution times before and after adding indexes.

## Why Indexes?

Indexes improve the speed of data retrieval operations on a database table at the cost of additional space and slower write operations. In a high-read environment like Airbnb, they are essential for:

- Faster filtering (`WHERE`)
- Quicker joins between tables
- Efficient ordering (`ORDER BY`)

## Indexed Columns

| Table       | Column         | Reason                          |
|-------------|----------------|----------------------------------|
| bookings    | user_id        | Used in JOIN/WHERE conditions   |
| bookings    | property_id    | Used in JOIN/WHERE conditions   |
| bookings    | created_at     | Used for ORDER BY (recent bookings) |
| users       | email          | Often queried for authentication |
| properties  | location       | Used in search/filter conditions |
| properties  | price          | Frequently sorted or filtered   |

## Setup

To apply the indexes:

```sql
\i database_index.sql