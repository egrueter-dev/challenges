-- DEFINE YOUR DATABASE SCHEMA HERE

CREATE  TABLE employees (
  employeeid serial PRIMARY KEY,
  employee varchar(255) NOT NULL
);

CREATE TABLE customers (
  customerid serial PRIMARY KEY,
  customer_and_account_no varchar(255)
);

CREATE TABLE products (
  productid serial PRIMARY KEY,
  product_name varchar(255)
);

CREATE TABLE invoices (
  invoiceid serial PRIMARY KEY,
  invoice_no varchar(255),
  invoice_frequency varchar(255),
  units_sold varchar(255)
);

CREATE TABLE sales (
  sale_id serial PRIMARY KEY,
  sale_date varchar(255),
  sale_amount varchar(255),
  employeeid integer REFERENCES employees(employeeid),
  customerid integer REFERENCES customers(customerid),
  productid  integer REFERENCES products(productid),
  invoice_id integer REFERENCES invoices(invoiceid)
);
