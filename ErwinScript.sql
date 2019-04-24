
CREATE TABLE [Building]
( 
	[buildingID]         char(18)  NOT NULL ,
	[buildingName]       char(18)  NULL ,
	[buildingAddress]    char(18)  NULL 
)
go

ALTER TABLE [Building]
	ADD CONSTRAINT [XPKBuilding] PRIMARY KEY  CLUSTERED ([buildingID] ASC)
go

CREATE TABLE [ClassBuilding]
( 
	[buildingID]         char(18)  NOT NULL ,
	[numberOfClassrooms] char(18)  NULL 
)
go

ALTER TABLE [ClassBuilding]
	ADD CONSTRAINT [XPKClassBuilding] PRIMARY KEY  CLUSTERED ([buildingID] ASC)
go

CREATE TABLE [Course_Sections]
( 
	[CourseID]           char(18)  NOT NULL ,
	[courseName]         char(18)  NULL ,
	[NumberOfSeats]      char(18)  NULL ,
	[Hours]              char(18)  NULL ,
	[professorID]        char(18)  NOT NULL ,
	[buildingID]         char(18)  NOT NULL 
)
go

ALTER TABLE [Course_Sections]
	ADD CONSTRAINT [XPKCourse_Sections] PRIMARY KEY  CLUSTERED ([CourseID] ASC)
go

CREATE TABLE [Department]
( 
	[departmentID]       char(18)  NOT NULL ,
	[departmentName]     char(18)  NULL ,
	[buildingID]         char(18)  NOT NULL 
)
go

ALTER TABLE [Department]
	ADD CONSTRAINT [XPKDepartment] PRIMARY KEY  CLUSTERED ([departmentID] ASC)
go

CREATE TABLE [Dorms]
( 
	[buildingID]         char(18)  NOT NULL ,
	[numberOfResidents]  char(18)  NULL 
)
go

ALTER TABLE [Dorms]
	ADD CONSTRAINT [XPKDorms] PRIMARY KEY  CLUSTERED ([buildingID] ASC)
go

CREATE TABLE [Enrrollment]
( 
	[StudentID]          char(18)  NOT NULL ,
	[CourseID]           char(18)  NOT NULL 
)
go

ALTER TABLE [Enrrollment]
	ADD CONSTRAINT [XPKEnrrollment] PRIMARY KEY  CLUSTERED ([CourseID] ASC)
go

CREATE TABLE [Financial_Aid]
( 
	[totalAid]           char(18)  NOT NULL 
)
go

ALTER TABLE [Financial_Aid]
	ADD CONSTRAINT [XPKFinancial_Aid] PRIMARY KEY  CLUSTERED ([totalAid] ASC)
go

CREATE TABLE [Membership]
( 
	[OrganizationID]     char(18)  NOT NULL ,
	[StudentID]          char(18)  NULL 
)
go

ALTER TABLE [Membership]
	ADD CONSTRAINT [XPKMembership] PRIMARY KEY  CLUSTERED ([OrganizationID] ASC)
go

CREATE TABLE [Organization]
( 
	[OrganizationID]     char(18)  NOT NULL 
)
go

ALTER TABLE [Organization]
	ADD CONSTRAINT [XPKOrganization] PRIMARY KEY  CLUSTERED ([OrganizationID] ASC)
go

CREATE TABLE [Professor]
( 
	[professorID]        char(18)  NOT NULL ,
	[professorName]      char(18)  NULL ,
	[professorEmail]     char(18)  NULL ,
	[Salary]             char(18)  NULL ,
	[courseTaught]       char(18)  NULL ,
	[departmentID]       char(18)  NOT NULL 
)
go

ALTER TABLE [Professor]
	ADD CONSTRAINT [XPKProfessor] PRIMARY KEY  CLUSTERED ([professorID] ASC)
go

CREATE TABLE [Sports]
( 
	[sportName]          char(18)  NULL ,
	[inSeason]           char(18)  NULL ,
	[OrganizationID]     char(18)  NOT NULL 
)
go

ALTER TABLE [Sports]
	ADD CONSTRAINT [XPKSports] PRIMARY KEY  CLUSTERED ([OrganizationID] ASC)
go

CREATE TABLE [Student]
( 
	[StudentID]          char(18)  NOT NULL ,
	[StudentName]        char(18)  NULL ,
	[StudentEmail]       char(18)  NULL ,
	[GPA]                char(18)  NULL ,
	[active]             char(18)  NULL ,
	[goodStanding]       char(18)  NULL ,
	[totalCreditHours]   char(18)  NULL ,
	[semesterHours]      char(18)  NULL ,
	[buildingID]         char(18)  NULL 
)
go

ALTER TABLE [Student]
	ADD CONSTRAINT [XPKStudent] PRIMARY KEY  CLUSTERED ([StudentID] ASC)
go

CREATE TABLE [StudentOrgs]
( 
	[duesPaid]           char(18)  NULL ,
	[orgName]            char(18)  NULL ,
	[OrganizationID]     char(18)  NOT NULL 
)
go

ALTER TABLE [StudentOrgs]
	ADD CONSTRAINT [XPKStudentOrgs] PRIMARY KEY  CLUSTERED ([OrganizationID] ASC)
go

CREATE TABLE [Tuition]
( 
	[amountDue]          char(18)  NOT NULL ,
	[StudentID]          char(18)  NOT NULL ,
	[totalCost]          char(18)  NULL ,
	[totalAid]           char(18)  NULL 
)
go

ALTER TABLE [Tuition]
	ADD CONSTRAINT [XPKTuition] PRIMARY KEY  CLUSTERED ([amountDue] ASC,[StudentID] ASC)
go


ALTER TABLE [ClassBuilding]
	ADD CONSTRAINT [R_32] FOREIGN KEY ([buildingID]) REFERENCES [Building]([buildingID])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Course_Sections]
	ADD CONSTRAINT [R_14] FOREIGN KEY ([professorID]) REFERENCES [Professor]([professorID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Course_Sections]
	ADD CONSTRAINT [R_34] FOREIGN KEY ([buildingID]) REFERENCES [ClassBuilding]([buildingID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Department]
	ADD CONSTRAINT [R_31] FOREIGN KEY ([buildingID]) REFERENCES [ClassBuilding]([buildingID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Dorms]
	ADD CONSTRAINT [R_29] FOREIGN KEY ([buildingID]) REFERENCES [Building]([buildingID])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Enrrollment]
	ADD CONSTRAINT [R_41] FOREIGN KEY ([StudentID]) REFERENCES [Student]([StudentID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Enrrollment]
	ADD CONSTRAINT [R_43] FOREIGN KEY ([CourseID]) REFERENCES [Course_Sections]([CourseID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Membership]
	ADD CONSTRAINT [R_39] FOREIGN KEY ([OrganizationID]) REFERENCES [Organization]([OrganizationID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Membership]
	ADD CONSTRAINT [R_40] FOREIGN KEY ([StudentID]) REFERENCES [Student]([StudentID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Professor]
	ADD CONSTRAINT [R_38] FOREIGN KEY ([departmentID]) REFERENCES [Department]([departmentID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Sports]
	ADD CONSTRAINT [R_20] FOREIGN KEY ([OrganizationID]) REFERENCES [Organization]([OrganizationID])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Student]
	ADD CONSTRAINT [R_37] FOREIGN KEY ([buildingID]) REFERENCES [Dorms]([buildingID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [StudentOrgs]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([OrganizationID]) REFERENCES [Organization]([OrganizationID])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Tuition]
	ADD CONSTRAINT [R_16] FOREIGN KEY ([StudentID]) REFERENCES [Student]([StudentID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Tuition]
	ADD CONSTRAINT [R_17] FOREIGN KEY ([totalAid]) REFERENCES [Financial_Aid]([totalAid])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go
