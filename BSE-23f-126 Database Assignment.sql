create database library_management;
use library_management;
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Publisher VARCHAR(255),
    YearPublished INT,
    Genre VARCHAR(50)
);

-- Table to store information about library members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    MembershipDate DATE
);

-- Table to store information about loans
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table to store information about staff members
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Position VARCHAR(100),
    HireDate DATE,
    Email VARCHAR(100) UNIQUE
);

-- Table to store information about book categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Table to link books to categories
CREATE TABLE BookCategories (
    BookID INT,
    CategoryID INT,
    PRIMARY KEY (BookID, CategoryID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Table to store information about publishers
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(255) NOT NULL UNIQUE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- Table to store information about fines
CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(5, 2) NOT NULL,
    Paid BOOLEAN DEFAULT FALSE,
    DateIssued DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table to store information about reservations
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    ReservationDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table to store information about library branches
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(255) NOT NULL UNIQUE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- Table to link staff to branches
CREATE TABLE StaffBranches (
    StaffID INT,
    BranchID INT,
    PRIMARY KEY (StaffID, BranchID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
