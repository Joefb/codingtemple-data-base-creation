-- Create dealership database schema

-- Create car table
CREATE TABLE car (
    id INTEGER PRIMARY KEY,
    year DATE,
    make VARCHAR(255),
    model VARCHAR(255),
    vin VARCHAR(255),
    is_new BOOL
);

-- Create customer table
CREATE TABLE customer (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    prefered BOOL,
    is_jerk BOOL
);

-- Create sales_rep table
CREATE TABLE sales_rep (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    position VARCHAR(255),
    total_sales INTEGER,
    bonus BOOL
);

-- Create sales_invoce table
CREATE TABLE sales_invoice (
    id INTEGER PRIMARY KEY,
    sales_price FLOAT,
    date DATE,
    car_id INTEGER,
    customer_id INTEGER,
    sales_rep_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_rep (id)
);

-- Create service_ticket table
CREATE TABLE service_ticket (
    id INTEGER PRIMARY KEY,
    date DATE,
    repair VARCHAR(255),
    price FLOAT,
    customer_id INTEGER,
    car_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (car_id) REFERENCES car (id)
);

-- Create service_writer table
CREATE TABLE service_writer (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    position VARCHAR(255),
    total_tickets INTEGER,
    service_ticket_id INTEGER,
    FOREIGN KEY (service_ticket_id) REFERENCES service_ticket (id)
);

-- Create ticket_mechanic table junction
CREATE TABLE ticket_mechanic (
    ticket_id INTEGER,
    mechanic_id INTEGER,
    FOREIGN KEY (ticket_id) REFERENCES service_ticket (id),
    FOREIGN KEY (mechanic_id) REFERENCES service_mechanic (id)
);

-- Create service_mechanic table
CREATE TABLE service_mechanic (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    position VARCHAR(255),
    total_tickets INTEGER,
    ticket_mechanic_id INTEGER,
    FOREIGN KEY (ticket_mechanic_id) REFERENCES ticket_mechanic (mechanic_id)
);


-- Insert service_mechanic data
INSERT INTO service_mechanic (name, position, total_tickets, ticket_mechanic_id)
VALUES
('Alice Johnson', 'Lead Mechanic', 120, 1),
('Bob Smith', 'Technician', 85, 2),
('Carlos Martinez', 'Junior Mechanic', 40, 3);

-- Insert service_writer data
INSERT INTO service_writer (name, position, total_tickets)
VALUES
('Joe Mama', 'Supervisor', 0),
('Betty Boop', 'Junior Writer', 0),
('Billy Bob', 'Writer', 0);

-- Insert service_ticket data
INSERT INTO service_ticket (date, repair, price)
VALUES
('2024-05-01', 'Brake pad replacement', 250.00),
('2024-05-03', 'Oil change', 75.00),
('2024-05-05', 'Engine diagnostics', 180.00);

-- Insert car data
INSERT INTO car (year, make, model, vin, is_new)
VALUES
(2022, 'Toyota', 'Camry', 'JT4BG22K9V1234567', TRUE),
(2021, 'Honda', 'Civic', '2HGFB2F59CH123456', FALSE),
(2023, 'Ford', 'F-150', '1FTFW1E50PFA12345', TRUE);

-- Insert customer data
INSERT INTO customer (name, address, prefered, is_jerk)
VALUES
('Jane Doe', '123 Maple St, Springfield', TRUE, FALSE),
('John Smith', '456 Oak Ave, Shelbyville', FALSE, TRUE),
('Emily Chen', '789 Pine Rd, Capital City', TRUE, FALSE);

-- Insert sales_invoice data
INSERT INTO sales_invoice (sales_price, date)
VALUES
('Michael Brown', '555-1234'),
('Sarah Lee', '555-5678'),
('David Kim', '555-9012');

-- Insert sales_rep data
INSERT INTO sales_rep (name, position, total_sales, bonus)
VALUES
('Merica Milly', 'Manager', 102.50, FALSE),
('Merv McMally', 'Rep', 3109.20, TRUE),
('Merica Milly', 'Supervisor', 504.00, FALSE);
