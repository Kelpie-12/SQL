USE PD_311_HW
GO

ALTER PROCEDURE sp_AddAlternatingDisciplineToSchedule
@group_name NVARCHAR(50),
@discipline_name NVARCHAR(256),
@start_date DATE,
@teacher_last_name NVARCHAR(150),
@constant_day INT,
@alternat_day INT,
@start_time TIME
AS 
BEGIN
	DECLARE @group AS INT = (SELECT group_id FROM Groups WHERE group_name=@group_name);
	DECLARE @discipline AS SMALLINT = (SELECT Disciplines.discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name);
	DECLARE @number_of_lessons AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_name LIKE discipline_name);
	DECLARE @date AS DATE;
	DECLARE @teacher_ AS INT = (SELECT teacher_id FROM Teachers WHERE last_name=@teacher_last_name);
	DECLARE @lesson_number AS SMALLINT = 0;
	DECLARE @alternate_present AS BIT = 0;
	DECLARE @ca_interval AS INT =ABS(@constant_day -@alternat_day) 
	WHILE @lesson_number<@number_of_lessons
	BEGIN

		PRINT @date
		PRINT (DATENAME(WEEKDAY,@date))
		
		IF (DATEPART(WEEKDAY,@date)=@constant_day)
		BEGIN
			IF @alternat_day>@constant_day
			BEGIN
				DECLARE @prelast_date AS DATE = (	SELECT MAX([date]) FROM Schedule WHERE [date]<@date)
				SET @date =IIF (DATEPART(WEEKDAY,@prelast_date)=@constant_day,@ca_interval,7)
			END
			ELSE
			BEGIN
				SET @prelast_date =(	SELECT [date] FROM Schedule WHERE [date]<@date)
				SET @date =IIF (DATEPART(WEEKDAY,@prelast_date)=@constant_day,@ca_interval,7)
			END
				--SET @date=DATEADD(DAY,@ca_interval,@date)
				--SET @alternate_present=0;
		END
		ELSE
		BEGIN
			SET @date= DATEADD(DAY,7,@date)
			SET @alternate_present=1
		END
		SET @lesson_number = @lesson_number+2;
	END

END