create DATABASE GesCom;
use GesCom;
create table suppliers(
    sup_id INT AUTO_INCREMENT NOT NULL,
    sup_name varchar(50) NOT NULL,
    sup_city varchar(50) NOT NULL,
    sup_adress varchar(150) NOT NULL,
    sup_mail varchar(75),
    sup_phone INT(10),
    PRIMARY KEY(sup_id)
);
create table customers(
    cus_id INT AUTO_INCREMENT NOT NULL,
    cus_lastname varchar(50) NOT NULL,
    cus_firstname varchar(50) NOT NULL,
    cus_adress varchar(150) NOT NULL,
    zipcode varchar(5) NOT NULL,
    cus_city varchar(50) NOT NULL,
    cus_mail varchar(75),
    cus_phone INT(10),
    PRIMARY KEY(cus_id)
);
create table orders (
    ord_id INT AUTO_INCREMENT NOT NULL,
    ord_order_date DATE DEFAULT CURRENT_DATE,
    ord_ship_date DATE,
    ord_bill_date DATE,
    ord_reception_date DATE,
    ord_status varchar(25) NOT NULL,
    cus_id INT,
    PRIMARY KEY(ord_id),
    FOREIGN KEY(cus_id) REFERENCES customers(cus_id) ON DELETE SET DEFAULT ON UPDATE CASCADE
);

create table categorie (
    cat_id INT AUTO_INCREMENT NOT NULL,
    cat_name varchar(200),
    cat_parent_id INT,
    PRIMARY KEY(cat_id),
    FOREIGN KEY(cat_parent_id) REFERENCES categorie(cat_id) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE TABLE products (
    pro_id INT AUTO_INCREMENT NOT NULL,
    pro_ref VARCHAR(10) NOT NULL,
    pro_name VARCHAR(200) NOT NULL,
    pro_desc TEXT NOT NULL,
    pro_price DECIMAL(6,2) NOT NULL,
    pro_stock SMALLINT(4),
    pro_color VARCHAR(30),
    pro_picture VARCHAR(40),
    pro_add_date DATE DEFAULT CURRENT_DATE,
    pro_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    pro_publish BOOLEAN NOT NULL DEFAULT 1,
    cat_id INT,
    sup_id INT,
    PRIMARY KEY(pro_id),
    FOREIGN KEY(cat_id) REFERENCES categorie(cat_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id) ON DELETE SET NULL ON UPDATE CASCADE
);
create table details (
    det_id INT AUTO_INCREMENT NOT NULL,
    det_price DECIMAL(6,2) NOT NULL,
    det_quantity INT(5) NOT NULL CHECK(det_quantity BETWEEN 1 and 100),
    pro_id INT,
    ord_id INT,
    PRIMARY KEY(det_id),
    FOREIGN KEY(pro_id) REFERENCES products(pro_id) ON DELETE SET DEFAULT ON UPDATE CASCADE,
    FOREIGN KEY(ord_id) REFERENCES orders(ord_id) ON DELETE SET DEFAULT ON UPDATE CASCADE
);
CREATE INDEX idx_pro_ref ON products(pro_ref);
