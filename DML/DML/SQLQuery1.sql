USE PD_311_HW
GO

CREATE PROCEDURE sp_AddAlternatingDisciplineToSchedule
@group_name NVARCHAR(50),
@discipline_name NVARCHAR(256),
@start_date DATE,
@teacher_last_name NVARCHAR(150),
@constant_day TINYINT,
@alternat_day TINYINT,
@start_time TIME
AS 
BEGIN
	DECLARE @group AS INT = (SELECT group_id FROM Groups WHERE gro
END