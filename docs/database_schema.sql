-- Core normalized schema (starter)
CREATE TABLE roles (id SERIAL PRIMARY KEY, code VARCHAR(30) UNIQUE NOT NULL);
CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  role_id INT NOT NULL REFERENCES roles(id),
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(30) UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  is_verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE TABLE profiles (
  user_id BIGINT PRIMARY KEY REFERENCES users(id),
  full_name VARCHAR(200),
  bio TEXT,
  country_code VARCHAR(3),
  city VARCHAR(80)
);
CREATE TABLE wallets (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT UNIQUE NOT NULL REFERENCES users(id),
  balance NUMERIC(14,2) DEFAULT 0
);
CREATE TABLE wallet_transactions (
  id BIGSERIAL PRIMARY KEY,
  wallet_id BIGINT NOT NULL REFERENCES wallets(id),
  txn_type VARCHAR(30) NOT NULL,
  amount NUMERIC(14,2) NOT NULL,
  status VARCHAR(30) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE TABLE jobs (
  id BIGSERIAL PRIMARY KEY,
  client_id BIGINT NOT NULL REFERENCES users(id),
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  budget_min INT,
  budget_max INT,
  location GEOGRAPHY(POINT, 4326),
  status VARCHAR(30) DEFAULT 'open',
  created_at TIMESTAMPTZ DEFAULT NOW()
);
