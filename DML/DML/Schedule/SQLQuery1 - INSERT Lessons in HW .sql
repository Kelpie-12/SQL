USE PD_311_HW;
GO
DECLARE @start_date AS	DATE	= '2024-10-02'
DECLARE @date		AS	DATE	= @start_date
DECLARE @time		AS	TIME	= '13:30'
DECLARE @group		AS	INT		= (SELECT group_id FROM Groups WHERE group_name=N'PD_321');
DECLARE @discipline	AS	SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MySQL%');
DECLARE @number_of_lessons AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_name LIKE '%MySQL%');
DECLARE @teacher	AS	INT		= (SELECT teacher_id FROM Teachers WHERE last_name=N'Покидюк');
PRINT (@group)
PRINT @discipline
PRINT @teacher
DECLARE @lesson AS SMALLINT = 0;
--WHILE @lesson < @number_of_lessons
--BEGIN
--	--PRINT(FORMATMESSAGE(N'%s %s', N'Дата:', CAST(@date AS NVARCHAR(50))));
--	--PRINT(FORMATMESSAGE(N'%s %s', N'День недели:', DATENAME(WEEKDAY,@date)));
--	--PRINT(FORMATMESSAGE(N'%s %s', N'Время:', CAST(@time AS NVARCHAR(50))));
--	--PRINT(FORMATMESSAGE(N'%s %i', N'Урок №:', @lesson));
--	INSERT 
--	Schedule	([date], [time], [group], discipline, teacher, spent)
--	VALUES		(@date, @time,@group,@discipline ,@teacher,IIF(@date<GETDATE(),1,0 ))
--	SET @lesson = @lesson + 1;
--	IF @lesson<@number_of_lessons
--	BEGIN
--		--PRINT(FORMATMESSAGE(N'%s %s', N'Дата:', CAST(@date AS NVARCHAR(50))));
--		--PRINT(FORMATMESSAGE(N'%s %s', N'Время:',CAST(DATEADD(MINUTE,90,@time)AS NVARCHAR(50)))) ;
--		--PRINT(FORMATMESSAGE(N'%s %i', N'Урок №:', @lesson));
--		INSERT 
--		Schedule	([date], [time], [group], discipline, teacher, spent)
--		VALUES		(@date, DATEADD(MINUTE,90,@time),@group,@discipline ,@teacher,IIF(@date<GETDATE(),1,0 ) )
--		SET @lesson = @lesson + 1;
--	END
--	SET @date = DATEADD(DAY,IIF(DATEPART(WEEKDAY,@date)=6,3,2),@date)
--	PRINT('-------------------------------------')
----INSERT 
----Schedule	([date], [time], [group], discipline, teacher, spent)
----VALUES		('2024-10-21', '13:30', )
--END

--GO

SELECT 
	[Дата]			= [date],
	[Время]			= [time],
	[День недели]	= DATENAME(WEEKDAY,[date]),
	[Группа]		= group_name,
	[Дисциплина]	= discipline_name,
	[Преподаватель] =  FORMATMESSAGE('%s,%s,%s',last_name,first_name,middle_name),
	[Статус проведения] = IIF( S.spent =1, 'Проведено','Запланировано')
FROM Lessons AS S,Groups AS G, Disciplines AS D,Teachers AS T
WHERE [group]=G.group_id 
AND discipline=D.discipline_id
AND teacher=T.teacher_id
--SELECT * FROM Teachers;
--SELECT * FROM Disciplines;