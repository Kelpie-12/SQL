USE PD_311_HW;
GO

/*№1
SELECT [Название дисцеплины]=discipline_name  
FROM Disciplines,RequiredDiciplines
WHERE
discipline_id=required_discipline 
AND 
target_discipline=
(SELECT discipline_id FROM Disciplines 
WHERE discipline_name LIKE '%Процедурное программирование на языке С++%');
*/

/*--№2
--DECLARE @today_date AS DATE = GETDATE();
SELECT [Преподаватель] = T.first_name +' ' +T.last_name,
	[Возраст]=(DATEDIFF(DAY, T.birth_date,GETDATE()))/365,
	[Стаж (лет)]=(DATEDIFF(DAY,T.work_since ,GETDATE()))/365
FROM Teachers AS T;
*/

/*--№3
SELECT [Преподаватель] = T.first_name +' ' +T.last_name,
	[Стаж (Больше 10 лет)]=( DATEDIFF(DAY,T.work_since ,GETDATE()))/365
FROM Teachers AS T
WHERE ((DATEDIFF(DAY,T.work_since ,GETDATE()))/365)>10; 
*/

/*--№4
DECLARE @group_id AS INT = (SELECT Groups.group_id FROM Groups WHERE Groups.group_name LIKE 'PD_321');
DECLARE @disciplines_name AS INT = (SELECT Disciplines.discipline_id FROM Disciplines WHERE discipline_name LIKE 'MySQL');
DECLARE @lessons_hour AS SMALLINT = (SELECT Disciplines.number_of_lessons FROM Disciplines WHERE discipline_name LIKE 'MySQL');
DECLARE @teacher_id AS BIGINT = 1--(SELECT Teachers.teacher_id FROM Teachers WHERE Teachers.teacher_id =15);
DECLARE @start_date AS DATE = '2024-10-02';
DECLARE @start_time AS TIME = '13:30';
DECLARE @current_date AS DATE = GETDATE();
DECLARE @lesson AS SMALLINT = 0;
DECLARE @date AS DATE = @start_date;
DECLARE @time AS TIME = @start_time;
DECLARE @passed AS BIT = 0;

WHILE @lesson<@lessons_hour
BEGIN
	IF DATEDIFF(DAY,@current_date,@date)<0
		SET @passed=1;
	ELSE	
		SET @passed=0;
	INSERT Lessons (lesson_date,lesson_time,group_id,teacher_id,is_done)
	VALUES (@date,@time,@group_id,@teacher_id,@passed)

	SET @lesson+=1;

	IF @time=@start_time
		SET @time=DATEADD(HOUR,1.5,@time);
	ELSE 
		SET @time=@start_time;

	IF DATEPART(WEEKDAY, @date) IN (2, 4) AND @time = @start_time
		SET @date = DATEADD(DAY, 2, @date);
	ELSE IF DATEPART(WEEKDAY, @date) = 6 AND @time = @start_time
		SET @date = DATEADD(DAY, 3, @date);

END
*/
