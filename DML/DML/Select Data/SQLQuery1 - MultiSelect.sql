USE PD_311_HW;
GO

SELECT
	[Ф.И.О.] = FORMATMESSAGE
	('%s %s %s',last_name,first_name,middle_name),
	[Дисциплины] = discipline_name
FROM Teachers,Disciplines, TeachersDisciplineRelations
WHERE discipline=discipline_id
--WHERE discipline_name LIKE 'MySQL%'