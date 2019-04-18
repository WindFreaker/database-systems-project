USE yellow
GO
SET IDENTITY_INSERT CLASSBUILDING OFF;

SET IDENTITY_INSERT Building ON;

INSERT INTO Building(BUILDINGID, BUILDINGNAME, BUILDINGADDRESS) VALUES

  (1, 'Math', '1234 Main St'),
  (2, 'Science', '4598 Hayes Lane'),
  (3, 'English', '12 Josh St'),
  (4, 'Computer Science', '78 Planters Lane'),
  (5, 'Eagle Village', '34 Fair Rd'),
  (6, 'Southern Living', '90 Gentilly Rd'),
  (7, 'Centiennial', '4356 Georgia Ave'),
  (8, 'Courtyard', '9999 College Ave');

SET IDENTITY_INSERT Building OFF;


SET IDENTITY_INSERT Dorms ON;

INSERT INTO DORMS(BUILDINGID, NUMBEROFRESIDENTS) VALUES
  (5, 50),
  (6, 100),
  (7, 90),
  (8, 150);

SET IDENTITY_INSERT Dorms OFF;

SET IDENTITY_INSERT CLASSBUILDING ON;

INSERT INTO CLASSBUILDING(BUILDINGID, NUMBEROFCLASSROOMS) VALUES
  (1, 25),
  (2, 75),
  (3, 15),
  (4, 100);

SET IDENTITY_INSERT CLASSBUILDING OFF;

SET IDENTITY_INSERT Department ON;

INSERT INTO Department(departmentID,buildingID,departmentName) VALUES
  (1,4,'Computer Science'),
  (2,3,'Literature'),
  (3,2,'Physics'),
  (4,1,'Math');

SET IDENTITY_INSERT Department OFF;

SET IDENTITY_INSERT Professor ON;

INSERT INTO Professor(professorID,professorEmail,professorName,Salary,courseTaught,departmentID) VALUES
  (1,'js0112@georgiasouthern.edu', 'John Smith', 30000, 'Calculus', 4),
  (2,'hb0992@georgiasouthern.edu', 'Hayes Barber', 95000, 'Database Systems', 1),
  (3,'bp9302@georgiasouthern.edu', 'Brad Pitt', 50000, 'World Literature', 2),
  (4,'gh7787@georgiasouthern.edu', 'Griffin Harris', 80000, 'Intro to Physics', 3);

SET IDENTITY_INSERT Professor OFF;

SET IDENTITY_INSERT STUDENT ON;

INSERT INTO STUDENT(StudentID, StudentName, StudentEmail,GPA,ACTIVE,GOODSTANDING,totalCreditHours,SEMESTERHOURS,buildingID) VALUES
  (321,'Caleb Willson', 'cb0123@georgiasouthern.edu', 3.0, 1, 1, 45, 12,5),
  (123,'Nick Row', 'nr0000@georgiasouthern.edu', 3.7, 1, 1, 50, 15,5),
  (234,'Isaac Elrod', 'ie7777@georgiasouthern.edu', 4.0, 1, 1, 15, 15,6),
  (457,'Billy Dumb', 'bd1111@georgiasouthern.edu', 1.5, 1, 0, 30, 10,7),
  (989,'John Kittle', 'jk5555@georgiasouthern.edu', 2.0, 1, 0, 60, 12,8);

SET IDENTITY_INSERT STUDENT OFF;


SET IDENTITY_INSERT CourseSections ON;

INSERT INTO CourseSections(courseID, professorID,buildingID,courseName,NumberOfSeats,CreditHours) VALUES
(1, 1, 1, 'Calculus', 25, 4),
(2, 2, 4, 'Database Systems', 30, 3),
(3, 3, 3, 'WorldLiterature', 50, 3),
(4, 4, 2, 'Intro to Physics', 35, 4);

SET IDENTITY_INSERT CourseSections OFF;


SET IDENTITY_INSERT Enrollment ON;

INSERT INTO Enrollment(courseID,StudentID) VALUES
(1,321),
(2,123),
(2,234),
(3,457),
(4,989);

SET IDENTITY_INSERT Enrollment OFF;


--SET IDENTITY_INSERT FinancialAid ON;

--INSERT INTO FinancialAid(totalAid) VALUES

--SET IDENTITY_INSERT FinancialAid OFF;



SET IDENTITY_INSERT Tuition ON;

INSERT INTO Tuition(amountDue,StudentID, totalCost, totalAid) VALUES
(25000,321 ,50000,25000),
(50000, 123,50000,0),
(35000, 234,50000,15000),
(40000, 457,50000,10000),
(50000,989 ,50000,0);

SET IDENTITY_INSERT Tuition OFF;


SET IDENTITY_INSERT ORGANIZATION ON;

INSERT INTO ORGANIZATION(MEMBERID) VALUES
(1),
(2),
(3);

SET IDENTITY_INSERT ORGANIZATION OFF;


SET IDENTITY_INSERT MEMBERSHIP ON;

INSERT INTO MEMBERSHIP(MEMBERID, STUDENTID) VALUES
(1,321),
(1,123),
(2,234),
(3,989);

SET IDENTITY_INSERT MEMBERSHIP OFF;


SET IDENTITY_INSERT STUDENTORGS ON;

INSERT INTO STUDENTORGS(MEMBERID, ORGNAME, DUESOWED) VALUES
(1, 'SGA', 100);

SET IDENTITY_INSERT STUDENTORGS OFF;


SET IDENTITY_INSERT SPORTS ON;

INSERT INTO SPORTS(MEMBERID, SPORTNAME, INSEASON) VALUES
(2, 'Football', 0),
(3, 'Baseball', 1);

SET IDENTITY_INSERT SPORTS OFF;
