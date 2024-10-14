USE PD_311_HW
CREATE TABLE Directions
(
	direction_id SMALLINT PRIMARY KEY,
	derection_name NVARCHAR(150) NOT NULL
);

CREATE TABLE Groups
(
	group_id int primary key,
	group_name nvarchar(16) not null,
	direction smallint not null 
	constraint FK_Group_Directions foreign key references Directions(direction_id)
);

create table Students
(
	student_id bigint primary key,
	last_name nvarchar(150) not null,
	first_name nvarchar(150) not null,
	middle_name nvarchar(150),
	birth_date date not null,
	[group] int not null
	constraint FK_Students_Groups foreign key references Groups(group_id)
);

create table ReportTypes
(
	report_type_id tinyint primary key not null,
	report_type_name nvarchar(50) not null	
);

create table Teachers
(
	teacher_id int primary key,
	last_name nvarchar(150) not null,
	first_name nvarchar(150) not null,
	middle_name nvarchar(150),
	birth_date date not null,
	work_since date not null,
	rate money
);

create table Disciplines
(
	discipline_id smallint primary key,
	discipline_name nvarchar(50) not null,
	number_of_lessons int,
	report_type tinyint 	
	constraint FK_Disciplines_ReportTypes foreign key references ReportTypes(report_type_id),	

);
create table Schedule
(
	lesson_id bigint primary key,
	[date] date not null,
	[time] time not null,
	[group] int not null 
	constraint FK_Schedule_Groups foreign key references Groups(group_id),	
	discipline smallint not null 
	constraint FK_Schedule_Disciplines foreign key references Disciplines(discipline_id),	
	[subject] nvarchar(256),
	spent bit,
	teacher int
	constraint FK_Schedule_Teachers foreign key references Teachers(teacher_id),	
);
create table Grades
(
	student bigint 
	constraint FK_Grades_Student foreign key references Students(student_id),
	lesson bigint
	constraint FK_Grades_Schedule foreign key references Schedule(lesson_id),
	grade_1 tinyint check(grade_1>0 and grade_1>=12),
	grade_2 tinyint check(grade_2>0 and grade_2>=12),
	primary key(student,lesson)
);

create table Exams
(
	student bigint 
	constraint FK_Exams_Students foreign key references Students(student_id),
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

create table DependentDiscipline
(
	target_discipline smallint
	constraint FK_DependentDiscipline_Target foreign key references Disciplines(discipline_id),	
	dependent_discipline smallint
	constraint FK_DependentDiscipline_Dependent foreign key references Disciplines(discipline_id),	
	primary key(target_discipline,dependent_discipline)
);

create table RequiredDiciplines
(
	target_discipline smallint
	constraint FK_RequiredDiciplines_Target foreign key references Disciplines(discipline_id),	
	required_discipline smallint
	constraint FK_RequiredDiciplines_Dependent foreign key references Disciplines(discipline_id),	
	primary key(target_discipline,required_discipline)
);


create table TeachersDisciplineRelations
(
	teacher_id int
	constraint FK_TeachersDisciplineRelations_Teachers foreign key references Teachers(teacher_id),
	discipline smallint
	constraint FK_TeachersDisciplineRelations_Disciplines foreign key references Disciplines(discipline_id),
	primary key(teacher_id,discipline)
);