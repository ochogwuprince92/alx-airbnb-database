# Optimization Report: Complex Booking Query

## Objective

Optimize a query that retrieves booking records along with user, property, and payment details.

---

## Original Query Analysis

```sql
SELECT
    bookings.id,
    users.first_name,
    properties.name,
    payments.amount
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
LEFT JOIN payments ON payments.booking_id = bookings.id;
