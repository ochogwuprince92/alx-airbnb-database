# Optimization Report: Complex Booking Query

## Objective

Refactor a complex SQL query that retrieves all booking records along with user details, property details, and payment details. The aim is to improve performance using indexes and better query structure.

## 🔍 Original Query

```sql
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
