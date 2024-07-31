CREATE TABLE if not exists gas (
	id			serial PRIMARY KEY,
	vendor_code	varchar(32) NOT NULL,
	gas_type	varchar(16) NOT NULL
);

CREATE TABLE if not exists territory (
	cadastral_id integer PRIMARY KEY,
	status varchar(32) NOT NULL,
	price money NOT NULL,
	territory_location varchar(100) NOT NULL,
	average_cars integer NOT NULL
);

CREATE TABLE if not exists station_owner (
	owner_id integer PRIMARY KEY,
	owner_name varchar(64) NOT NULL,
	company_name varchar(64) NOT NULL,
	ownership_begin_date date NOT NULL,
	objects_amount integer NOT NULL
);

CREATE TABLE if not exists gas_station (
	gas_station_id integer PRIMARY KEY,
	owner_id integer references station_owner(owner_id) NOT NULL,
	cadastral_number integer references territory(cadastral_id) NOT NULL,
	gas_station_type varchar(32) NOT NULL,
	station_location varchar(100) NOT NULL,
	pump_amount integer NOT NULL
);

CREATE TABLE if not exists cashier (
	cashier_id integer PRIMARY KEY,
	gas_station_id integer references gas_station(gas_station_id) NOT NULL,
	cashier_name varchar(64) NOT NULL,
	qualification varchar(64) NOT NULL,
	phone_number varchar(20) NOT NULL,
	work_begin_date date NOT NULL
);

CREATE TABLE if not exists remaining_gas (
	remain_id integer PRIMARY KEY,
	gas_id	integer references gas(id) NOT NULL,
	amount	decimal
);

CREATE TABLE if not exists client(
	client_id integer PRIMARY KEY,
	client_name	varchar(64) NOT NULL,
	phone_number	varchar(20) NOT NULL,
	payment_info	varchar(32) NOT NULL,
	birth_date	date NOT NULL
);

CREATE TABLE if not exists gas_consumption (
	gas_consumption_id integer PRIMARY KEY,
	cashier_id integer references cashier(cashier_id) NOT NULL,
	gas_id	integer references gas(id) NOT NULL,
	client_id integer references client(client_id) NOT NULL,
	total decimal NOT NULL,
	total_price money NOT NULL,
	liters_amount decimal NOT NULL,
	purchase_time timestamp NOT NULL
);

CREATE TABLE if not exists gas_income (
	income_contract_id integer PRIMARY KEY,
	gas_station_id integer references gas_station(gas_station_id) NOT NULL,
	gas_id	integer references gas(id) NOT NULL,
	rate integer NOT NULL,
	provider varchar(40) NOT NULL,
	shipping_company varchar(40) NOT NULL,
	amount integer NOT NULL,
	delivery_date date NOT NULL
);



