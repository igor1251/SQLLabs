create table Medicine
(
    ID INTEGER AUTOINCREMENT NOT NULL,
    medicineName NCHAR(40) NOT NULL,
    medicineCost NCHAR(40) NOT NULL
);

create table Pet 
(
    ID INTEGER AUTOINCREMENT NOT NULL,
    petName NCHAR(40) NOT NULL,
    petsex INTEGER NOT NULL,
    petBreed NCHAR(40) NOT NULL,
    petDateOfBirth DATETIME NOT NULL,
    petDateOfRegistration DATETIME NOT NULL
);

create table Services
(
    ID INTEGER AUTOINCREMENT NOT NULL,
    serviceName NCHAR(60) NOT NULL,
    serviceCost DECIMAL NOT NULL
);

create table Sex 
(
    ID INTEGER AUTOINCREMENT NOT NULL,
    sexname NCHAR(10)
);

create table Treatment 
(
    ID INTEGER AUTOINCREMENT NOT NULL,
    serviceID INTEGER NOT NULL,
    vaccinationID INTEGER NOT NULL,
    medicineID INTEGER NOT NULL
);

create table Vaccination
(
    ID INTEGER AUTOINCREMENT NOT NULL,
    vaccinationName NCHAR(40) NOT NULL,
    vaccinationCost DECIMAL NOT NULL
);

create table vaccinationCost
(
    ID INTEGER AUTOINCREMENT NOT NULL,
    petID INTEGER NOT NULL,
    dateOfAdmition DATETIME NOT NULL,
    dateOfDischarge DATETIME NOT NULL,
    sympthoms NCHAR(250)
)