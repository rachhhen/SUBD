CREATE TABLE gas (
	id			serial PRIMARY KEY,
	vendor_code	varchar(32) NOT NULL,
	gas_type	varchar(16) NOT NULL
);

