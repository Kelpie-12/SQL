USE PD_311_HW
GO
DELETE FROM Grades	
DECLARE @count_grade AS INT = 150;
DECLARE @count AS INT =0;
	WHILE @count_grade>@count
	BEGIN
		DECLARE @curr_grade AS TINYINT = (RAND()*(12-1)+1);
		DECLARE @a AS TINYINT =(RAND()*(4-1)+1);
		DECLARE @curr_student AS INT =(RAND()*(41-1)+1);
		DECLARE @curr_lessons AS SMALLINT =(RAND()*((SELECT MAX(Schedule.lesson_id) FROM Schedule WHERE Schedule.spent=1)-((SELECT MIN(Schedule.lesson_id) FROM Schedule WHERE Schedule.spent=1 )))+(SELECT MIN(Schedule.lesson_id) FROM Schedule WHERE Schedule.spent=1))
		IF @a=1
		BEGIN
			INSERT  Grades (student,lesson,grade_1)
			VALUES (@curr_student,@curr_lessons,@curr_grade)
		END
		ELSE IF @a=2
		BEGIN
			INSERT  Grades (student,lesson,grade_2)
			VALUES (@curr_student,@curr_lessons,@curr_grade)
		END
		ELSE 	
		BEGIN
			DECLARE @curr_grade_2 AS TINYINT = (RAND()*(12-1)+1);
			INSERT  Grades (student,lesson,grade_1,grade_2)
			VALUES (@curr_student,@curr_lessons,@curr_grade,@curr_grade_2)
		END
		SET	@count = @count+1;
		PRINT @count_grade PRINT @count
	END
	
	SELECT * FROM Grades
	
	--PRINT @count_grade PRINT @count--PRINT @curr_student PRINT @curr_lessons