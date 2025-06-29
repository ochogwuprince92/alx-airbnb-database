# Airbnb Database Seeding

This script inserts realistic sample data into the database for development and testing purposes.

## Entities Seeded

- **Users**: 3 users (guest, host, admin)
- **Properties**: 2 properties listed by a host
- **Bookings**: 2 bookings made by the guest
- **Payments**: Payment for one confirmed booking
- **Reviews**: A 5-star review for one property
- **Messages**: A message from guest to host

## Usage

Run the script in your SQL shell after creating the schema:

```sql
\i database-script-0x02/seed.sql
