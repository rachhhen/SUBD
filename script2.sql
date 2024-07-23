CREATE TABLE remaining_gas (
	remain_id integer CONSTRAINT PRIMARY KEY,
	vendor_code	varchar(32) references gas(vendor_code) NOT NULL,
	amount	integer
);

CREATE TABLE client (
	client_number integer CONSTRAINT PRIMARY KEY,
	client_name	varchar(64) NOT NULL,
	phone_number	integer NOT NULL,
	payment_info	varchar(32) NOT NULL,
	birth_date	date NOT NULL
);

CREATE TABLE gas_consumption (
	receipt_number integer CONSTRAINT PRIMARY KEY,
	vendor_code	varchar(32) references gas(vendor_code) NOT NULL,
	client_number integer references client(client_number) NOT NULL,
	total integer NOT NULL,
	total_price money NOT NULL,
	liters_amount integer NOT NULL,
	purchase_time time NOT NULL
);

CREATE TABLE gas_income(
	income_contract_number integer CONSTRAINT PRIMARY KEY,
	gas_station_id integer references gas_staion(gas_station_id) NOT NULL,
	vendor_code varchar references gas(vendor_code) NOT NULL,
	rate integer NOT NULL,
	provider varchar(40) NOT NULL,
	shipping_company varchar(40) NOT NULL,
	amount integer NOT NULL,
	delivery_date date NOT NULL
);

CREATE TABLE cashier(
	cashier_id integer CONSTRAINT PRIMARY KEY,
	gas_station_id integer references gas_staion(gas_station_id) NOT NULL,
	cashier_name varchar(64) NOT NULL,
	qualification varchar(64) NOT NULL,
	phone_number integer NOT NULL,
	work_begin_date date NOT NULL
);

CREATE TABLE gas_station(
	gas_station_id integer CONSTRAINT PRIMARY KEY
	inn integer references station_owner(inn) NOT NULL,
	cadastral_number integer references territory(cadastral_number) NOT NULL,
	gas_station_type varchar(32) NOT NULL,
	station_location varchar(100) NOT NULL,
	pump_amount integer NOT NULL,
);

CREATE TABLE station_owner(
	inn integer CONSTRAINT PRIMARY KEY,
	owner_name varchar(64) NOT NULL,
	company_name varchar(64) NOT NULL,
	ownership_begin_date date NOT NULL,
	objects_amount integer NOT NULL
);

CREATE TABLE territory(
	cadastral_number integer CONSTRAINT PRIMARY KEY,
	status varchar(32) NOT NULL,
	price money NOT NULL,
	territory_location varchar(100) NOT NULL,
	average_cars integer NOT NULL
);