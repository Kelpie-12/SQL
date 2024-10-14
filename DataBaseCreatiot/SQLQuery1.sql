USE PD_311_HW;
CREATE TABLE ReportTypes_2
(
	report_type_id TINYINT PRIMARY KEY NOT NULL,
	report_type_name NVARCHAR(50) NOT NULL	
);

CREATE TABLE Disciplines_2
(
	discipline_id SMALLINT PRIMARY KEY,
	discipline_name NVARCHAR(50) NOT NULL,
	number_of_lessons INT,
	report_type TINYINT 	
	CONSTRAINT FK_Disciplines_ReportTypes FOREIGN KEY REFERENCES ReportTypes_2(report_type_id),	
);

CREATE TABLE DependentDiscipline_2
(
	target_discipline SMALLINT
	CONSTRAINT FK_DependentDiscipline_Target FOREIGN KEY REFERENCES Disciplines_2(discipline_id),	
	dependent_discipline SMALLINT
	CONSTRAINT FK_DependentDiscipline_Dependent FOREIGN KEY REFERENCES Disciplines_2(discipline_id),	
	PRIMARY KEY(target_discipline,dependent_discipline)
);

CREATE TABLE RequiredDiciplines_2
(
	target_discipline SMALLINT
	CONSTRAINT FK_RequiredDiciplines_Target FOREIGN KEY REFERENCES Disciplines_2(discipline_id),	
	required_discipline SMALLINT
	CONSTRAINT FK_RequiredDiciplines_Dependent FOREIGN KEY REFERENCES Disciplines_2(discipline_id),	
	PRIMARY KEY(target_discipline,required_discipline)
);