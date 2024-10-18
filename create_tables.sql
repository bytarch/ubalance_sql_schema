-- Table to store administrator information
CREATE TABLE
  ADMIN (
    -- Unique ID for each admin, auto-generated
    admin_id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
    -- Admin's username
    username TEXT NOT NULL,
    -- Admin's password
    PASSWORD TEXT NOT NULL,
    -- Admin's email address
    email TEXT NOT NULL,
    -- Record creation time (defaults to now)
    created_at TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    -- Last update time (defaults to now)
    updated_at TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    -- Primary key constraint on admin_id
    CONSTRAINT admin_pkey PRIMARY KEY (admin_id),
    -- Unique constraint for email (no duplicates)
    CONSTRAINT admin_email_key UNIQUE (email),
    -- Unique constraint for username (no duplicates)
    CONSTRAINT admin_username_key UNIQUE (username),
    -- Check for valid email format
    CONSTRAINT admin_email_check CHECK ((email ~~ '%_@__%.__%'::TEXT))
  ) TABLESPACE pg_default;

-- Table to store appointment details
CREATE TABLE
  appointments (
    -- Unique ID for each appointment, auto-generated
    appointment_id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
    -- ID of the person being visited
    visitee_id BIGINT NOT NULL,
    -- ID of the visitor
    visitor_id BIGINT NOT NULL,
    -- Date and time of the appointment
    appointment_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    -- QR code for the appointment
    qr_code TEXT NOT NULL,
    -- Start time for appointment validity (defaults to now)
    valid_from TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    -- End time for appointment validity
    valid_until TIMESTAMP WITHOUT TIME ZONE NULL,
    -- Status of the appointment (defaults to 'pending')
    status TEXT NULL DEFAULT 'pending'::TEXT,
    -- Record creation time (defaults to now)
    created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    -- Primary key constraint on appointment_id
    CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id),
    -- Foreign key linking to the visitee table
    CONSTRAINT appointments_visitee_id_fkey FOREIGN KEY (visitee_id) REFERENCES visitee (visitee_id),
    -- Foreign key linking to the visitors table
    CONSTRAINT appointments_visitor_id_fkey FOREIGN KEY (visitor_id) REFERENCES visitors (visitor_id)
  ) TABLESPACE pg_default;

-- Table to store gate guard information
CREATE TABLE
  gate_guard (
    -- Unique ID for each guard, auto-generated
    guard_id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
    -- Guard's name
    NAME TEXT NOT NULL,
    -- Guard's phone number
    phone TEXT NULL,
    -- Guard's email address
    email TEXT NULL,
    -- Guard's password
    PASSWORD TEXT NOT NULL,
    -- Start time of the guard's shift
    shift_start TIMESTAMP WITH TIME ZONE NOT NULL,
    -- End time of the guard's shift
    shift_end TIMESTAMP WITH TIME ZONE NOT NULL,
    -- Record creation time (defaults to now)
    created_at TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    -- Last update time (defaults to now)
    updated_at TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    -- Primary key constraint on guard_id
    CONSTRAINT gate_guard_pkey PRIMARY KEY (guard_id),
    -- Unique constraint for email (no duplicates)
    CONSTRAINT gate_guard_email_key UNIQUE (email)
  ) TABLESPACE pg_default;

-- Table to store visitee information
CREATE TABLE
  visitee (
    -- Unique ID for each visitee, auto-generated
    visitee_id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
    -- Visitee's name
    NAME TEXT NOT NULL,
    -- Visitee's unit number
    unit_number TEXT NOT NULL,
    -- Visitee's phone number
    phone TEXT NULL,
    -- Visitee's email address
    email TEXT NULL,
    -- Record creation time (defaults to now)
    created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    -- Visitee's password (optional)
    PASSWORD TEXT NULL,
    -- Primary key constraint on visitee_id
    CONSTRAINT visitee_pkey PRIMARY KEY (visitee_id)
  ) TABLESPACE pg_default;

-- Table to store visitor information
CREATE TABLE
  visitors (
    -- Unique ID for each visitor, auto-generated
    visitor_id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
    -- Visitor's name
    NAME TEXT NOT NULL,
    -- Visitor's phone number
    phone TEXT NULL,
    -- Visitor's email address
    email TEXT NULL,
    -- Record creation time (defaults to now)
    created_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    -- Visitor's password (optional)
    PASSWORD TEXT NULL,
    -- Primary key constraint on visitor_id
    CONSTRAINT visitors_pkey PRIMARY KEY (visitor_id)
  ) TABLESPACE pg_default;
