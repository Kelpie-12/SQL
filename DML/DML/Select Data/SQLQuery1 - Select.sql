USE PD_311_HW;
GO

SELECT 
--last_name  'Фамилия',first_name  'Имя',middle_name  'Отчество',birth_date 'Дата рождения'
	--last_name + ' ' + first_name+ ' ' + middle_name  'Ф.И.О',
	--birth_date 'Дата рождения'
	--[Ф.И.О.]=last_name + ' ' + first_name+ ' ' + middle_name,
	[Ф.И.О.] = FORMATMESSAGE('%s %s %s',last_name,first_name,middle_name),
	birth_date 'Дата рождения'
FROM Teachers
WHERE first_name = 'Олег'
--WHERE birth_date>'1990-01-01'
ORDER BY last_name DESC;