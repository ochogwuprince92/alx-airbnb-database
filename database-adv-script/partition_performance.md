# Partitioning Performance Report

## Objective

Improve query performance on the large `bookings` table by applying partitioning based on the `start_date` column.

## Partitioning Strategy

We implemented **range partitioning** by year. The `bookings` table was recreated with:

- A parent table partitioned by `start_date`
- 4 child tables:
  - `bookings_2022`
  - `bookings_2023`
  - `bookings_2024`
  - `bookings_2025`

Data from the original table was inserted into the corresponding partitions.

## Performance Test

### Query:

```sql
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
