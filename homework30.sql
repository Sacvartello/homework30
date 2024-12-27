CREATE TABLE medicaments(
    id serial PRIMARY KEY,
    substance varchar(3000) NOT NULL CHECK(substance != ''),
    dosage numeric(5,2) NOT NULL CHECK(dosage > 0),
    price numeric(10,2) NOT NULL CHECK(price >= 0),
    quantity int NOT NULL CHECK(quantity >= 0)
);

CREATE TABLE pharmacies(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK(name != ''),
    address varchar(2000) NOT NULL,
    tel varchar(100) NOT NULL
);

CREATE TABLE medicaments_to_pharmacies(
    pharmacies_id int REFERENCES pharmacies(id),
    medicaments_id int REFERENCES medicaments(id)
);

CREATE TABLE customers(
    id serial PRIMARY KEY,
    first_name varchar(300) NOT NULL CHECK(first_name != ''),
    last_name varchar(300) NOT NULL CHECK(last_name != ''),
    is_login boolean DEFAULT FALSE
);

CREATE TABLE orders(
    id serial PRIMARY KEY,
    user_id int REFERENCES customers(id),
    created_at timestamp DEFAULT current_date
);

CREATE TABLE medicaments_to_orders(
    medicaments_id int REFERENCES medicaments(id),
    order_id int REFERENCES orders(id)
);