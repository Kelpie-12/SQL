USE PD_311_HW
CREATE TABLE Teachers_2
(
	teacher_id INT PRIMARY KEY,
	last_name NVARCHAR(150) NOT NULL,
	first_name NVARCHAR(150) NOT NULL,
	middle_name NVARCHAR(150),
	birth_date DATE NOT NULL,
	work_since DATE NOT NULL,
	rate MONEY
);