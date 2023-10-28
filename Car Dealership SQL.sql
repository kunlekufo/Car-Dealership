
-- create Salespeople table
CREATE TABLE Salespeople (
    SalespersonID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Cars table
CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    SerialNumber VARCHAR(20) UNIQUE,
    Model VARCHAR(50),
    Type VARCHAR(20),
    Price DECIMAL(8, 2),
    SalespersonID INT,
    CustomerID INT,
    FOREIGN KEY (SalespersonID) REFERENCES Salespeople(SalespersonID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Invoices table
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    InvoiceDate DATE,
    CarID INT,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

-- ServiceTickets table
CREATE TABLE ServiceTickets (
    ServiceTicketID INT PRIMARY KEY,
    TicketDate DATE,
    CarID INT,
    CustomerID INT,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Mechanics table
CREATE TABLE Mechanics (
    MechanicID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- CarMechanics table 
    CarID INT,
    MechanicID INT,
    PRIMARY KEY (CarID, MechanicID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (MechanicID) REFERENCES Mechanics(MechanicID)
);

-- ServiceHistory table 
CREATE TABLE ServiceHistory (
    ServiceRecordID INT PRIMARY KEY,
    ServiceDate DATE,
    ServiceDescription TEXT,
    CarID INT,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

-- PartsUsed table 
CREATE TABLE PartsUsed (
    PartID INT PRIMARY KEY,
    PartName VARCHAR(100),
    ServiceRecordID INT,
    FOREIGN KEY (ServiceRecordID) REFERENCES ServiceHistory(ServiceRecordID)
);


-- Insert data into Salespeople table
INSERT INTO Salespeople (SalespersonID, FirstName, LastName)
VALUES
    (1, 'John', 'Doe'),
    (2, 'Jane', 'Smith'),
    (3, 'Robert', 'Johnson');

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES
    (1, 'Alice', 'Brown'),
    (2, 'David', 'Wilson'),
    (3, 'Eva', 'Lee');

-- Insert data into Cars table
INSERT INTO Cars (CarID, SerialNumber, Model, Type, Price, SalespersonID, CustomerID)
VALUES
    (1, 'ABC123', 'Sedan', 'Compact', 20000.00, 1, 1),
    (2, 'XYZ789', 'SUV', 'Mid-Size', 30000.00, 2, 2),
    (3, '123DEF', 'Coupe', 'Sport', 40000.00, 1, 3);

-- Insert data into Invoices table
INSERT INTO Invoices (InvoiceID, InvoiceDate, CarID)
VALUES
    (1, '2023-10-15', 1),
    (2, '2023-10-20', 2),
    (3, '2023-10-25', 3);

-- Insert data into ServiceTickets table
INSERT INTO ServiceTickets (ServiceTicketID, TicketDate, CarID, CustomerID)
VALUES
    (1, '2023-10-16', 1, 1),
    (2, '2023-10-21', 2, 2),
    (3, '2023-10-26', 3, 3);

-- Insert data into Mechanics table
INSERT INTO Mechanics (MechanicID, FirstName, LastName)
VALUES
    (1, 'Michael', 'Anderson'),
    (2, 'Sarah', 'Clark'),
    (3, 'Kevin', 'Miller');

-- Insert data into CarMechanics table 
INSERT INTO CarMechanics (CarID, MechanicID)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 3);

-- Insert data into ServiceHistory table to store service records
INSERT INTO ServiceHistory (ServiceRecordID, ServiceDate, ServiceDescription, CarID)
VALUES
    (1, '2023-10-17', 'Oil change and tire rotation', 5),
    (2, '2023-10-22', 'Brake pad replacement', 6),
    (3, '2023-10-27', 'Engine diagnostics', 7);
-- Insert data into Parts Used Table
   


