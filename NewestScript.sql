-- NAME: yellow.sql
--
-- DESCRIPTION
-- This script creates group yellow's tables in the current schema.
USE master;
GO
DROP DATABASE yellow
create database yellow
GO

use yellow

DROP TABLE Professor;
DROP TABLE Department;
DROP TABLE ClassBuilding;
DROP TABLE CourseSections;
DROP TABLE Building;
DROP TABLE Dorms;
DROP TABLE Student;
DROP TABLE Tuition;
DROP TABLE Membership;
DROP TABLE FinancialAid;
DROP TABLE StudentOrgs;
DROP TABLE Organization;
DROP TABLE Sports;

CREATE TABLE Building(
	BUILDINGID	INT	Primary KEY IDENTITY,
	BUILDINGNAME	VARCHAR(255)	Not NULL,
	BUILDINGADDRESS	VARCHAR(255)	Not NULL,
);

CREATE TABLE DORMS(
	BUILDINGID INT Primary Key Identity REFERENCES BUILDING(BUILDINGID) NOT NULL,
	NUMBEROFRESIDENTS INT NOT NULL,
);

CREATE TABLE CLASSBUILDING(
	BUILDINGID INT PRIMARY KEY Identity REFERENCES BUILDING(BUILDINGID) NOT NULL,
	NUMBEROFCLASSROOMS INT NOT NULL,
);

CREATE TABLE Department(
	departmentID INT  PRIMARY KEY   IDENTITY NOT NULL,
	buildingID int References ClassBuilding(buildingID),
	departmentName VARCHAR(255)   NOT Null
);


CREATE TABLE Professor(
	professorID INT  PRIMARY KEY   IDENTITY NOT NULL,
	professorEmail    VARCHAR(255)   NOT Null,
	professorName		VARCHAR(60)		NOT NULL,
	Salary				INT				NOT NULL,
	courseTaught		 VARCHAR(255)   NOT Null,
	departmentID	 int  References Department(departmentID)
);

CREATE TABLE Student(
	StudentID	INT	Primary KEY IDENTITY,
	StudentName	VARCHAR(255)	Not NULL,
	StudentEmail	VARCHAR(255)	Not NULL,
	GPA	FLOAT(53)	Not NULL,
	ACTIVE	BIT	Not NULL,
	GOODSTANDING	BIT	Not NULL,
	totalCreditHours	INT	Not NULL,
	SEMESTERHOURS	INT	Not NULL,
	BUILDINGID INT  References DORMS(BUILDINGID),
);

CREATE TABLE CourseSections(
	courseID INT  PRIMARY KEY   IDENTITY NOT NULL,
	professorID int  References Professor(professorID),
	buildingID int  References ClassBuilding(buildingID),
	courseName		 VARCHAR(255)   NOT Null,
	NumberOfSeats			INT				NOT NULL,
	CreditHours				INT				NOT NULL
);

CREATE TABLE Enrollment(
	courseID INT  PRIMARY KEY   IDENTITY NOT NULL,
	StudentID int  References Student(StudentID)
);

CREATE TABLE FinancialAid(
	totalAid INT  PRIMARY KEY   IDENTITY NOT NULL
);
--took out scholarship and finanical aid

CREATE TABLE Tuition(
	amountDue INT  PRIMARY KEY   IDENTITY NOT NULL,
	StudentID int References Student(StudentID) NOT NULL,
	totalCost	 INT		NOT NULL,
	totalAid int  References FinancialAid(totalAid)
);

CREATE TABLE ORGANIZATION(
	MEMBERID INT PRIMARY KEY Identity NOT NULL,
);

CREATE TABLE MEMBERSHIP(
	MEMBERID INT Primary Key Identity REFERENCES ORGANIZATION(MEMBERID),
	STUDENTID INT  REFERENCES STUDENT(STUDENTID),
);

CREATE TABLE STUDENTORGS(
	MEMBERID INT PRIMARY KEY Identity REFERENCES ORGANIZATION(MEMBERID),
	ORGNAME VARCHAR NOT NULL,
	DUESOWED INT NOT NULL,
);
-- DuesPaid changed to duesOwed

CREATE TABLE SPORTS(
	MEMBERID INT PRIMARY KEY Identity REFERENCES ORGANIZATION(MEMBERID),
	SPORTNAME VARCHAR NOT NULL,
	INSEASON BIT NOT NULL,
);
