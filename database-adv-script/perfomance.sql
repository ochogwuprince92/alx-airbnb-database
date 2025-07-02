-- =======================================
-- Original Complex Query (with WHERE)
-- =======================================

EXPLAIN ANALYZE
SELECT
    bookings.id AS booking_id,
    bookings.created_at AS booking_date,
    users.id AS user_id,
    users.first_name,
    users.last_name,
    properties.id AS property_id,
    properties.name AS property_name,
    payments.id AS payment_id,
    payments.amount,
    payments.status
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
LEFT JOIN payments ON payments.booking_id = bookings.id
WHERE users.id = 3 AND payments.status = 'completed';

-- =======================================
-- Optimized Query (with WHERE)
-- =======================================

-- Assumes indexes on:
--   - bookings.user_id
--   - bookings.property_id
--   - payments.booking_id
--   - payments.status

EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.created_at AS booking_date,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE u.id = 3 AND pay.status = 'completed';
