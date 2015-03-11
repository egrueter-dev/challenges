# Use this file to import the sales information into the database.

require "pg"
require "csv"
require "pry"

def server_connect
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

###### Parsing Data #######

 DATA = CSV.read("sales.csv", :headers => true).map{|row| row.to_hash}

###### Inserting Data ######


### checking duplicates test code ###

# employee = {"employee"=>"Ricky Bobby (ricky.bobby@korning.com)"}
# checking_dupes = []
# server_connect do |conn|
#   checking_dupes = conn.exec_params("SELECT employee from employees;")
# end
# array_of_hashes.any? {|h| h[:a] == 11}
# puts checking_dupes.to_a.any? { |h| h["employee"] == employee["employee"] }

### end ###

binding.pry

def insert_employees
  server_connect do |conn|
    DATA.each do |customer|
      checking_dupes = conn.exec_params("SELECT employee from employees;")
      if checking_dupes.to_a.any? { |h| h["employee"] == customer["employee"] } == true
        return nil
      else
        conn.exec_params("INSERT INTO employees (employee) VALUES ($1);", [customer["employee"] ])
      end
    end
  end
end

insert_employees

def insert_customers
  server_connect do |conn|
    DATA.each do |customer|
      conn.exec_params("INSERT INTO customers (customer_and_account_no) VALUES ($1);", [customer["customer_and_account_no"] ])
    end
  end
end
Ko
insert_customers

def insert_products
  server_connect do |conn|
    DATA.each do |customer|
      conn.exec_params("INSERT INTO products (product_name) VALUES ($1);", [customer["product_name"] ])
    end
  end
end

insert_products

def insert_invoices
  server_connect do |conn|
    DATA.each do |customer|
      conn.exec_params("INSERT INTO invoices (invoice_no,invoice_frequency,units_sold) VALUES ($1,$2,$3);", [ customer["invoice_no"], customer["invoice_frequency"], customer["units_sold"] ])
    end
  end
end

insert_invoices

# def delete_dupes
#
# end

# def select_primary_keys
#     keys = {"invoices"=> invoiceid, "products"=> productid, "customer"=> customerid, "employees"=> employeeid }
#     server_connect do |conn|
#       keys["employees"] = conn.exec_params("SELECT employeeid FROM employees;")
#       keys["products"] = conn.exec_params("SELECT customerid FROM customers;")
#       keys["customer"] = conn.exec_params("SELECT productid FROM products;")
#       keys["invoices"] = conn.exec_params("SELECT invoiceid FROM invoices;")
#     end
#     return keys
# end

# def insert_sales
#   server_connect do |conn|
#     data.each do |customer|
#       conn.exec_params("INSERT INTO invoices (sale_date,invoice_frequency,units_sold) VALUES ($1,$2,$3);", [ customer["sale_date"], customer["invoice_frequency"] ])
#     end
#   end
# end
