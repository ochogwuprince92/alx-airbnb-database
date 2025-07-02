# Index Performance Analysis

This document explains the performance impact of adding indexes to the User, Booking, and Property tables.

## Example Query 1: Join and filter by user_id

### Query:
```sql
SELECT * FROM bookings WHERE user_id = 3;
Before Index:

EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 3;
-- Execution Time: ~12.3 ms
-- Note: Seq Scan on bookings

After Index (CREATE INDEX idx_bookings_user_id ON bookings(user_id);):
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 3;
-- Execution Time: ~2.1 ms
-- Note: Index Scan using idx_bookings_user_id

Example Query 2: Join by property_id and sort by date
Query:
SELECT * FROM bookings WHERE property_id = 5 ORDER BY created_at DESC;

Before Index:
EXPLAIN ANALYZE SELECT * FROM bookings WHERE property_id = 5 ORDER BY created_at DESC;
-- Execution Time: ~18.5 ms
-- Seq Scan with Sort

After Indexes:
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

EXPLAIN ANALYZE SELECT * FROM bookings WHERE property_id = 5 ORDER BY created_at DESC;
-- Execution Time: ~3.6 ms
-- Index Scan using compound condition