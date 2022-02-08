
-- tables
-- Table: payment_details
CREATE TABLE payment_details (
    id_payment_details int NOT NULL AUTO_INCREMENT,
    shipment_id int NOT NULL,
    value varchar(50) NOT NULL,
    payment_type_id int NOT NULL,
    CONSTRAINT payment_details_pk PRIMARY KEY (id_payment_details)
);

-- Table: payment_type
CREATE TABLE payment_type (
    id_payment_type int NOT NULL AUTO_INCREMENT,
    type_name varchar(50) NOT NULL,
    CONSTRAINT payment_type_pk PRIMARY KEY (id_payment_type)
) COMMENT 'e.g. card, cash, paypal, wire transfer';

-- Table: product
CREATE TABLE product (
    id_product int NOT NULL AUTO_INCREMENT,
    product_name varchar(50) NOT NULL,
    product_description varchar(100) NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (id_product)
);

-- Table: shipment
CREATE TABLE shipment (
    id_shipment int NOT NULL AUTO_INCREMENT,
    user_id int NOT NULL,
    delivery_date date NOT NULL,
    payment_type_id int NOT NULL,
    delivery_address varchar(50) NOT NULL,
    billing_address varchar(50) NOT NULL,
    products_price varchar(50) NOT NULL,
    CONSTRAINT shipment_pk PRIMARY KEY (id_shipment)
);

-- Table: shipment_details
CREATE TABLE shipment_details (
    id_shipment_details int NOT NULL AUTO_INCREMENT,
    shipment_id int NOT NULL,
    product_id int NOT NULL,
    price varchar(50) NOT NULL,
    UNIQUE INDEX shipmet_details_ak_1 (shipment_id,product_id),
    CONSTRAINT shipment_details_pk PRIMARY KEY (id_shipment_details)
);

-- Table: stock
CREATE TABLE stock (
    product_id int NOT NULL AUTO_INCREMENT,
    in_stock varchar(50) NOT NULL,
    last_update timestamp NOT NULL,
    supplier_id_supplier int NOT NULL,
    CONSTRAINT stock_pk PRIMARY KEY (product_id)
);

-- Table: supplier
CREATE TABLE supplier (
    id_supplier int NOT NULL,
    company_name varchar(50) NOT NULL,
    product_name varchar(50) NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY (id_supplier)
);

-- Table: user
CREATE TABLE user (
    id_user int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    address text NOT NULL,
    payment_type_id int NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id_user)
);

-- foreign keys
-- Reference: payment_details_payment_type (table: payment_details)
ALTER TABLE payment_details ADD CONSTRAINT payment_details_payment_type FOREIGN KEY payment_details_payment_type (payment_type_id)
    REFERENCES payment_type (id_payment_type);

-- Reference: payment_details_shipment (table: payment_details)
ALTER TABLE payment_details ADD CONSTRAINT payment_details_shipment FOREIGN KEY payment_details_shipment (shipment_id)
    REFERENCES shipment (id_shipment);

-- Reference: shipment_client (table: shipment)
ALTER TABLE shipment ADD CONSTRAINT shipment_client FOREIGN KEY shipment_client (user_id)
    REFERENCES user (id_user);

-- Reference: shipment_payment_type (table: shipment)
ALTER TABLE shipment ADD CONSTRAINT shipment_payment_type FOREIGN KEY shipment_payment_type (payment_type_id)
    REFERENCES payment_type (id_payment_type);

-- Reference: shipmet_details_product (table: shipment_details)
ALTER TABLE shipment_details ADD CONSTRAINT shipmet_details_product FOREIGN KEY shipmet_details_product (product_id)
    REFERENCES product (id_product);

-- Reference: shipmet_details_shipment (table: shipment_details)
ALTER TABLE shipment_details ADD CONSTRAINT shipmet_details_shipment FOREIGN KEY shipmet_details_shipment (shipment_id)
    REFERENCES shipment (id_shipment);

-- Reference: stock_product (table: stock)
ALTER TABLE stock ADD CONSTRAINT stock_product FOREIGN KEY stock_product (product_id)
    REFERENCES product (id_product);

-- Reference: stock_supplier (table: stock)
ALTER TABLE stock ADD CONSTRAINT stock_supplier FOREIGN KEY stock_supplier (supplier_id_supplier)
    REFERENCES supplier (id_supplier);

-- Reference: user_payment_type (table: user)
ALTER TABLE user ADD CONSTRAINT user_payment_type FOREIGN KEY user_payment_type (payment_type_id)
    REFERENCES payment_type (id_payment_type);

-- End of file.

