USE PD_311_HW
GO
ALTER PROCEDURE sp_AddScheduleForStacionarGroupe
@gpoup NVARCHAR(50),
@start_date DATE,
@start_time TIME,
@teacher_last_name_1 NVARCHAR(50),
@teacher_last_name_2 NVARCHAR (50)
AS
BEGIN
	DECLARE @teacher_id_1 AS INT = (SELECT teacher_id FROM Teachers WHERE last_name=@teacher_last_name_1);
	DECLARE @teacher_id_2 AS INT = (SELECT teacher_id FROM Teachers WHERE last_name=@teacher_last_name_2);
	
	DECLARE @lessons_c_id AS INT = (SELECT discipline_id FROM Disciplines WHERE discipline_name='Процедурное программирование на языке С++');
	DECLARE @lessons_hardware_id AS INT = 32--(SELECT discipline_id FROM Disciplines WHERE discipline_name='Hardware-PC');
	DECLARE @lessons_win_id AS INT = 33--(SELECT discipline_id FROM Disciplines WHERE discipline_name='Администрирование Windows');
	
	DECLARE @number_of_lessons_c AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @lessons_c_id);
	DECLARE @number_of_lessons_hardware AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @lessons_hardware_id);
	DECLARE @number_of_lessons_win AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @lessons_win_id);
	DECLARE @lessons_all AS INT =160-- @lessons_c_id + @lessons_hardware_id + @lessons_win_id;
	--PRINT @lessons_all
	DECLARE @lessons_count_c AS INT = 0;
	DECLARE @lessons_count_harware AS INT = 0;
	DECLARE @lessons_count_win AS INT = 0;
	DECLARE @lessons_count_all AS INT = 0;
	DECLARE @lessons_count_week AS INT = 0;

	DECLARE @group_id AS INT =(SELECT Groups.group_id FROM Groups WHERE group_name=@gpoup);
	DECLARE @current_date AS DATE = GETDATE();
	DECLARE @date AS DATE = @start_date;
	DECLARE @time AS TIME = @start_time;
	DECLARE @passed AS BIT = 0;

	DECLARE @current_lessons AS INT =0;
	DECLARE @current_teacher AS INT = 0;

	WHILE @lessons_count_all<@lessons_all
	BEGIN
		IF DATEDIFF(DAY,@current_date,@date)<0
			SET @passed=1;
		ELSE SET @passed=0;

		IF @lessons_count_harware<@number_of_lessons_hardware AND 
			(@lessons_count_week % 2 != 0 AND DATENAME(WEEKDAY,@date)='Monday') OR
			(@lessons_count_week % 2 = 0 AND DATENAME(WEEKDAY, @date) IN ('Monday', 'Wednesday'))
			BEGIN
				SET @current_lessons = @lessons_hardware_id;
				SET @current_teacher = @teacher_id_2;
				SET @number_of_lessons_hardware =@number_of_lessons_hardware+1;
			END
		ELSE IF @lessons_count_win < @number_of_lessons_win AND 
				((@lessons_count_week % 2 != 0 AND DATENAME(WEEKDAY, @date) = 'Monday') OR
				(@lessons_count_week % 2 = 0 AND DATENAME(WEEKDAY, @date) IN ('Monday', 'Wednesday')))
		BEGIN
			SET @current_lessons = @lessons_win_id;
			SET @current_teacher = @teacher_id_2;
			SET @number_of_lessons_win =@number_of_lessons_win+ 1;
		END
		ELSE
		BEGIN
			SET @current_lessons = @lessons_c_id;
			SET @current_teacher = @teacher_id_1;
			SET @number_of_lessons_c =@number_of_lessons_c+ 1;
		END
		SET @lessons_count_all =@lessons_count_all+1;

		IF DATENAME(WEEKDAY, @date) = 'Friday' AND @time != @start_time
			SET @lessons_count_week =@lessons_count_week+1;	

		IF NOT EXISTS(SELECT Schedule.lesson_id FROM Schedule WHERE Schedule.[group] = @group_id AND Schedule.lesson_id = @current_lessons AND Schedule.[date] = @date AND Schedule.[time] = @time)
		BEGIN
			INSERT	Schedule	([date], [time], [group], discipline, teacher, spent)
			VALUES
				(@date, @time, @group_id, @current_lessons, @current_teacher, @passed);
		END

		IF @time = @start_time
			SET @time = DATEADD(MINUTE, 90, @time);
		ELSE
			SET @time = @start_time
		SET @date = DATEADD(DAY, IIF(DATEPART(WEEKDAY, @date)=6,3,2), @date);
				
	END


END