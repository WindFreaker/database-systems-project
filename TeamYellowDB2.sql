-- NAME: yellow.sql
--
-- DESCRIPTION
-- This script creates group yellow's tables in the current schema. 
USE master;
GO
DROP DATABASE YELLOW
create database yellow
GO

use yellow

--DROP TABLE Professor;
--DROP TABLE Department;
--DROP TABLE ClassBuilding;
--DROP TABLE CourseSections;
--DROP TABLE Building;
--DROP TABLE Dorms;
--DROP TABLE Student;
--DROP TABLE Tuition;
--DROP TABLE Membership;
--DROP TABLE FinancialAid;
--DROP TABLE StudentOrgs;
--DROP TABLE Organization;
--DROP TABLE Sports;

CREATE TABLE Building(
BUILDINGID		INT				NOT NULL	PRIMARY KEY IDENTITY,
BUILDINGNAME	VARCHAR(255)	NOT NULL,
BUILDINGADDRESS	VARCHAR(255)	NOT NULL,
);

CREATE TABLE DORMS(
BUILDINGID				INT REFERENCES BUILDING(BUILDINGID) NOT NULL PRIMARY KEY,
NUMBEROFRESIDENTS		INT									NOT NULL,
);

CREATE TABLE CLASSBUILDING(
BUILDINGID			INT  REFERENCES BUILDING(BUILDINGID) NOT NULL PRIMARY KEY,
NUMBEROFCLASSROOMS	INT		NOT NULL,
);

CREATE TABLE Department(
departmentID	INT  PRIMARY KEY   IDENTITY NOT NULL,
buildingID		INT							References ClassBuilding(buildingID),
departmentName	VARCHAR(255)				NOT Null,
);


CREATE TABLE Professor(
professorID		INT	PRIMARY KEY   IDENTITY  NOT NULL,
professorEmail	VARCHAR(255)				NOT Null,
professorName	VARCHAR(60)					NOT NULL,
Salary			INT							NOT NULL,
courseTaught	VARCHAR(255)				NOT Null,
departmentID	INT							References	Department(departmentID),
);

CREATE TABLE Student(
StudentID			INT				Primary KEY IDENTITY,
StudentName			VARCHAR(255)	Not NULL,
StudentEmail		VARCHAR(255)	Not NULL,
GPA					FLOAT(53)		Not NULL,
ACTIVE				BIT				Not NULL,
GOODSTANDING		BIT				Not NULL,
totalCreditHours	INT				Not NULL,
SEMESTERHOURS		INT				Not NULL,
BUILDINGID			INT				References DORMS(BUILDINGID),
);

CREATE TABLE CourseSections(
courseID		INT				PRIMARY KEY   IDENTITY NOT NULL,
StudentID		INT				References Student(StudentID),
professorID		INT				References Professor(professorID),
buildingID		INT				References ClassBuilding(buildingID),
courseName		VARCHAR(255)    NOT Null,
NumberOfSeats	INT				NOT NULL,
CreditHours		INT				NOT NULL
);

CREATE TABLE FinacialAid(
totalAid		INT				PRIMARY KEY   IDENTITY NOT NULL
);
--took out scholarship and finanical aid

CREATE TABLE Tuition(
amountDue	 INT	PRIMARY KEY   IDENTITY NOT NULL,
StudentID	 INT	References Student(StudentID) NOT NULL,
totalCost	 INT	NOT NULL,
totalAid	 INT	References FinacialAid(totalAid)
);

CREATE TABLE ORGANIZATION(
ORGNAME		 INT	PRIMARY KEY NOT NULL,
);

CREATE TABLE MEMBERSHIP(
ORGNAME		INT  REFERENCES ORGANIZATION(ORGNAME),
STUDENTID	INT  REFERENCES STUDENT(STUDENTID),
			PRIMARY KEY CLUSTERED (ORGNAME, STUDENTID),
);

CREATE TABLE STUDENTORGS(
ORGID		INT		PRIMARY KEY NOT NULL,
MEMBERID	INT		REFERENCES  ORGANIZATION(ORGNAME),
ORGNAME		VARCHAR				NOT NULL,
DUESOWED	INT					NOT NULL,
);
-- DuesPaid changed to duesOwed

CREATE TABLE SPORTS(
SPORTID		INT			PRIMARY KEY NOT NULL,
MEMBERID	INT			REFERENCES ORGANIZATION(ORGNAME),
SPORTNAME	VARCHAR		NOT NULL,
INSEASON	BIT			NOT NULL,
);
