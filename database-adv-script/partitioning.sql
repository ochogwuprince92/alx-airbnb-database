-- Step 1: Rename existing table
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create new partitioned bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create yearly partitions (example: 2022–2025)
CREATE TABLE bookings_2022 PARTITION OF bookings
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Insert old data into new partitioned table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, created_at, updated_at)
SELECT id, user_id, property_id, start_date, end_date, created_at, updated_at
FROM bookings_old;

-- Step 5: Test performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
