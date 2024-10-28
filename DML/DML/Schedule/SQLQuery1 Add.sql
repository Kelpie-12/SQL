USE PD_311_HW;
GO

--CREATE PROCEDURE sp_AddSchenuleForBaseS
--@group_name NVARCHAR(50),	
----@discipline_name NVARCHAR(256),
--@start_date DATE,
--@teacher_1_last_name NVARCHAR(150),
--@teacher_2_last_name NVARCHAR(150)
--AS
--BEGIN
--	DECLARE @group AS INT = (SELECT group_id FROM Groups WHERE group_name = @group_name);
--	DECLARE @teacher_1_ AS INT = (SELECT teacher_id FROM Teachers WHERE last_name=@teacher_1_last_name);
--	DECLARE @teacher_2_ AS INT = (SELECT teacher_id FROM Teachers WHERE last_name=@teacher_2_last_name);
--	DECLARE @date AS DATE = @start_date;
--	DECLARE @discipline_1 AS SMALLINT (SELECT  FROM Disciplines
--END