USE PD_311_HW;
GO

SELECT 
--last_name  'Фамилия',first_name  'Имя',middle_name  'Отчество',birth_date 'Дата рождения'
	--last_name + ' ' + first_name+ ' ' + middle_name  'Ф.И.О',
	--birth_date 'Дата рождения'
	--[Ф.И.О.]=last_name + ' ' + first_name+ ' ' + middle_name,
	[Ф.И.О.] = FORMATMESSAGE('%s %s %s',last_name,first_name,middle_name),
	[Дисциплина] = discipline_name
FROM Teachers, Disciplines,TeachersDisciplineRelations
WHERE discipline=discipline_id AND discipline_name LIKE '%SQL%'--AND teacher=teacher_id;
