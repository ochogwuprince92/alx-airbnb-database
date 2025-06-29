# Normalization Report — Airbnb Database Design

## Objective

Ensure the Airbnb database schema follows Third Normal Form (3NF) to eliminate redundancy and improve data integrity.

## First Normal Form (1NF)

- All tables have atomic (indivisible) attributes.
- Each table has a primary key.
- No repeating groups or arrays.

✅ The schema is in 1NF.

## Second Normal Form (2NF)

- All non-key attributes are fully functionally dependent on the whole primary key.
- No partial dependencies (only relevant if there are composite keys).

✅ The schema uses single-column primary keys, and there are no partial dependencies.
✅ The schema is in 2NF.

## Third Normal Form (3NF)

- There are no transitive dependencies (non-key attributes depending on other non-key attributes).
- All attributes are dependent only on the primary key.

### 🔍 Analysis:

| Table     | 3NF Check | Notes |
|-----------|-----------|-------|
| User      | ✅        | `role` as ENUM is acceptable for simplicity. |
| Property  | ✅        | `location` could be normalized if reused heavily. |
| Booking   | ✅        | `total_price` could be derived, but stored for performance. |
| Payment   | ✅        | `payment_method` as ENUM is fine. |
| Review    | ✅        | No issues. |
| Message   | ✅        | No issues. |

## Conclusion

The database design adheres to 3NF.  
There are no transitive or partial dependencies. The use of ENUMs and calculated fields is justified for performance and simplicity in this context.

