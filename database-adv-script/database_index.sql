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
