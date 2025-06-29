# Entity-Relationship Diagram (ERD) Specification

## 🎯 Objective
Create an ER diagram representing the AirBnB clone database.

---

## 📦 Entities and Attributes

### 1. User
- user_id (PK)
- first_name
- last_name
- email (UNIQUE)
- password_hash
- phone_number
- role (ENUM: guest, host, admin) NOT NULL
- created_at

### 2. Property
- property_id (PK)
- host_id (FK → User.user_id)
- name
- description
- location
- pricepernight
- created_at
- updated_at

...

## 🔗 Relationships

- One `User` can list many `Properties` (1:N)
- One `User` can make many `Bookings` (1:N)
- One `Property` can have many `Bookings` (1:N)
- One `Booking` has one `Payment` (1:1)
- One `User` can write many `Reviews` (1:N)
- One `Property` can have many `Reviews` (1:N)
- One `User` can send/receive many `Messages` (1:N)

---

## 🖼️ Diagram File
The visual ER diagram is saved as:

![ERD](./airbnb_ERD.png)

