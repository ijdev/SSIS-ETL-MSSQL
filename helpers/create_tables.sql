IF OBJECT_ID('dbo.i94staging', 'U') IS NULL CREATE TABLE i94staging (
	ccid bigint NOT NULL PRIMARY KEY,
    i94yr bigint,
    i94mon bigint,
    i94cit bigint,
    i94res int, 
    i94port varchar(50),
    arrdate bigint,
    i94mode bigint,
    i94addr varchar(50),
    depdate bigint,
    i94bir int,
    i94visa int,
    count bigint,
    dtadfile bigint,
    visapost varchar(50),
    occup varchar(50),
    entdepa varchar(50),
    entdepd varchar(50),
    entdepu varchar(50),
    matflag varchar(50),
    biryear bigint,
    dtaddto varchar(255),
    gender varchar(50),
    insnum int,
    airline varchar(50),
    admnum varchar(255),
    fltno varchar(50),
    visatype varchar(50)
);



IF OBJECT_ID('dbo.demo_staging', 'U') IS NULL CREATE TABLE  demo_staging (
	city varchar(255) NOT NULL PRIMARY KEY,
    state varchar(255) NOT NULL,
	median_age REAL,
    male_pop REAL,
    female_pop REAL,
    total_pop bigint,
    no_vet REAL,
    foreign_born REAL,
    avg_household_size REAL,
    state_code varchar(50),
    race varchar(255) NOT NULL,
    count bigint
);

IF OBJECT_ID('dbo.state', 'U') IS NULL CREATE TABLE  state (
	state_code varchar(10) NOT NULL PRIMARY KEY,
    state varchar(255),
);

IF OBJECT_ID('dbo.city', 'U') IS NULL CREATE TABLE  city (
	city varchar(255) NOT NULL PRIMARY KEY,
    state varchar(255),
	median_age REAL,
    male_pop REAL,
    female_pop REAL,
    total_pop bigint,
    no_vet REAL,
    foreign_born REAL,
    avg_household_size REAL,
    state_code varchar(10),
    race varchar(255) NOT NULL,
    count bigint,
	CONSTRAINT fk_name
    FOREIGN KEY (state_code)
    REFERENCES state (state_code)
    ON DELETE CASCADE
);

IF OBJECT_ID('dbo.country_lookup', 'U') IS NULL CREATE TABLE  country_lookup (
	code int NOT NULL PRIMARY KEY,
	country varchar(255)
);

IF OBJECT_ID('dbo.port_lookup', 'U') IS NULL CREATE TABLE  port_lookup (
	port_code varchar(50) NOT NULL PRIMARY KEY,
    port_name varchar(255)
);

IF OBJECT_ID('dbo.visa_lookup', 'U') IS NULL CREATE TABLE  visa_lookup(
	visa_code varchar(50) NOT NULL PRIMARY KEY,
    visa_type varchar(255)
);

IF OBJECT_ID('dbo.country', 'U') IS NULL CREATE TABLE  country (
	code int NOT NULL PRIMARY KEY,
	country varchar(255)
);


IF OBJECT_ID('dbo.port', 'U') IS NULL CREATE TABLE  port (
	port_code varchar(10) NOT NULL PRIMARY KEY,
    port_name varchar(255)
);
IF OBJECT_ID('dbo.visa', 'U') IS NULL CREATE TABLE  visa(
	visa_code varchar(10) NOT NULL PRIMARY KEY,
    visa_type varchar(255)
);
IF OBJECT_ID('dbo.i94fact', 'U') IS NULL CREATE TABLE  i94fact (
	ccid bigint NOT NULL PRIMARY KEY,
    country_code int REFERENCES country(code) on delete cascade, 
    state_code varchar(10) REFERENCES state(state_code) on delete cascade,
    port_code varchar(10) REFERENCES port(port_code) on delete cascade,
    age_bir int,
    visa_code varchar(10) REFERENCES visa(visa_code) on delete cascade,
    biryear int,
    gender varchar(10)
);
