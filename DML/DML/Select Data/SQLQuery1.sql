USE PD_311_HW
GO
DECLARE @start_date AS	DATE	= '2024-10-02'
DECLARE @date		AS	DATE	= @start_date
DECLARE @time		AS	TIME	= '13:30'
DECLARE @group		AS	INT		= (SELECT group_id FROM Groups WHERE group_name=N'PD_321');
DECLARE @discipline	AS	SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL Server%');
DECLARE @number_of_lessons AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_name LIKE '%MS SQL Server%');
DECLARE @teacher	AS	INT		= (SELECT teacher_id FROM Teachers WHERE last_name=N'???????');
PRINT (@group)
PRINT @discipline
PRINT @teacher

DECLARE @lesson AS SMALLINT = 0;
WHILE @lesson < @number_of_lessons
BEGIN
	PRINT(FORMATMESSAGE(N'%s %s', N'????:', CAST(@date AS NVARCHAR(50))));
	PRINT(FORMATMESSAGE(N'%s %s', N'?????:', CAST(@time AS NVARCHAR(50))));
	PRINT(FORMATMESSAGE(N'%s %i', N'???? ?:', @lesson));
	SET @lesson = @lesson + 1;
	PRINT('-------------------------------------')

END
