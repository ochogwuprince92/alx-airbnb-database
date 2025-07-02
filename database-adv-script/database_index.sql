-- Create index on user_id for fast filtering and joins
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on property_id for joins and filters
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index for ordering bookings by created_at
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Index on email for user lookup (e.g., login)
CREATE INDEX idx_users_email ON users(email);

-- Index on property location for filtering in searches
CREATE INDEX idx_properties_location ON properties(location);

-- Index on price for filtering or sorting
CREATE INDEX idx_properties_price ON properties(price);

-- ==============================================
-- Performance tests using EXPLAIN ANALYZE
-- ==============================================

-- Test 1: Bookings by user_id
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 3;

-- Test 2: Bookings by property_id ordered by created_at
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE property_id = 5 ORDER BY created_at DESC;

-- Test 3: Lookup user by email
EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'user@example.com';
