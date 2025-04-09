
CREATE DATABASE IF NOT EXISTS IMS;
USE IMS;


CREATE TABLE User (
    userId INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);


CREATE TABLE Policy (
    policyId INT PRIMARY KEY AUTO_INCREMENT,
    policyName VARCHAR(100) NOT NULL,
    policyType VARCHAR(100),
    coverageAmount DECIMAL(12,2),
    premiumAmount DECIMAL(12,2)
);

CREATE TABLE Client (
    clientId INT PRIMARY KEY AUTO_INCREMENT,
    clientName VARCHAR(100) NOT NULL,
    contactInfo VARCHAR(150),
    policyId INT,
    FOREIGN KEY (policyId) REFERENCES Policy(policyId)
);


CREATE TABLE Claim (
    claimId INT PRIMARY KEY AUTO_INCREMENT,
    claimNumber VARCHAR(100) NOT NULL UNIQUE,
    dateFiled DATE NOT NULL,
    claimAmount DECIMAL(12,2),
    status VARCHAR(50),
    policyId INT,
    clientId INT,
    FOREIGN KEY (policyId) REFERENCES Policy(policyId),
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);

CREATE TABLE Payment (
    paymentId INT PRIMARY KEY AUTO_INCREMENT,
    paymentDate DATE NOT NULL,
    paymentAmount DECIMAL(12,2),
    clientId INT,
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);
