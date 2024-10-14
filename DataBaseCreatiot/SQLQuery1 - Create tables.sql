USE PD_311_HW
CREATE TABLE Directions
(
	direction_id SMALLINT PRIMARY KEY,
	derection_name NVARCHAR(150) NOT NULL
);

CREATE TABLE Groups
(
	group_id INT PRIMARY KEY,
	group_name NVARCHAR(16) NOT NULL,
	direction SMALLINT NOT NULL 
	CONSTRAINT FK_Group_Directions FOREIGN KEY REFERENCES Directions(direction_id)
);

CREATE TABLE Students
(
	student_id INT PRIMARY KEY IDENTITY(1,1),
	last_name NVARCHAR(150) NOT NULL,
	first_name NVARCHAR(150) NOT NULl,
	middle_name NVARCHAR(150),
	birth_date DATE NOT NULL,
	[group] INT NOT NULL
	CONSTRAINT FK_Students_Groups FOREIGN KEY REFERENCES Groups(group_id)
);

CREATE TABLE ReportTypes
(
	report_type_id TINYINT PRIMARY KEY NOT NULL,
	report_type_name NVARCHAR(50) NOT NULL	
);

CREATE TABLE Teachers
(
	teacher_id INT PRIMARY KEY,
	last_name NVARCHAR(150) NOT NULL,
	first_name NVARCHAR(150) NOT NULL,
	middle_name NVARCHAR(150),
	birth_date DATE NOT NULL,
	work_since DATE NOT NULL,
	rate MONEY
);

CREATE TABLE Disciplines
(
	discipline_id SMALLINT PRIMARY KEY,
	discipline_name NVARCHAR(50) NOT NULL,
	number_of_lessons INT,
	report_type TINYINT 	
	CONSTRAINT FK_Disciplines_ReportTypes FOREIGN KEY REFERENCES ReportTypes(report_type_id),	

);
create table Schedule
(
	lesson_id BIGINT PRIMARY KEY,
	[date] DATE NOT NULL,
	[time] TIME NOT NULL,
	[group] INT NOT NULL 
	CONSTRAINT FK_Schedule_Groups FOREIGN KEY REFERENCES Groups(group_id),	
	discipline SMALLINT NOT NULL 
	constraint FK_Schedule_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id),	
	[subject] NVARCHAR(256),
	spent BIT,
	teacher INT
	CONSTRAINT FK_Schedule_Teachers FOREIGN KEY REFERENCES Teachers(teacher_id),	
);
create table Grades
(
	student INT 
	CONSTRAINT FK_Grades_Student foreign key references Students(student_id),
	lesson bigint
	CONSTRAINT FK_Grades_Schedule foreign key references Schedule(lesson_id),
	grade_1 tinyint check(grade_1>0 and grade_1>=12),
	grade_2 tinyint check(grade_2>0 and grade_2>=12),
	primary key(student,lesson)
);

create table Exams
(
	student INT 
	CONSTRAINT FK_Exams_Students foreign key references Students(student_id),
	lesson bigint
	constraint FK_Exams_Schedule foreign key references Schedule(lesson_id),
	grade tinyint check(grade>0 and grade>=12),
	primary key(student,lesson)
);

create table DisciplinesDerctionsRelation
(
	discipline smallint not null 
	constraint FK_DisciplinesDirectionsRelation_Disciplines foreign key references Disciplines(discipline_id),
	derection smallint not null
	constraint FK_DisciplinesDirectionsRelation_Directions foreign key references Directions(direction_id),
	primary key(discipline,derection) 
);

create table CompleteDiscipline
(
	[group] int
	constraint FK_CompleteDiscipline_Groups foreign key references Groups(group_id),	
	discipline smallint	
	constraint FK_CompleteDiscipline_Disciplines foreign key references Disciplines(discipline_id),
	primary key(discipline,[group])
);

CREATE TABLE DependentDiscipline
(
	target_discipline SMALLINT
	CONSTRAINT FK_DependentDiscipline_Target FOREIGN KEY REFERENCES Disciplines(discipline_id),	
	dependent_discipline SMALLINT
	CONSTRAINT FK_DependentDiscipline_Dependent FOREIGN KEY REFERENCES Disciplines(discipline_id),	
	PRIMARY KEY(target_discipline,dependent_discipline)
);

CREATE TABLE RequiredDiciplines
(
	target_discipline SMALLINT
	CONSTRAINT FK_RequiredDiciplines_Target FOREIGN KEY REFERENCES Disciplines(discipline_id),	
	required_discipline SMALLINT
	CONSTRAINT FK_RequiredDiciplines_Dependent FOREIGN KEY REFERENCES Disciplines(discipline_id),	
	PRIMARY KEY(target_discipline,required_discipline)
);


create table TeachersDisciplineRelations
(
	teacher_id int
	constraint FK_TeachersDisciplineRelations_Teachers foreign key references Teachers(teacher_id),
	discipline smallint
	constraint FK_TeachersDisciplineRelations_Disciplines foreign key references Disciplines(discipline_id),
	primary key(teacher_id,discipline)
);