USE PD_311_HW;
GO

SELECT
	[�.�.�.] = FORMATMESSAGE
	('%s %s %s',last_name,first_name,middle_name),
	[����������] = discipline_name
FROM Teachers,Disciplines, TeachersDisciplineRelations
WHERE discipline=discipline_id
--WHERE discipline_name LIKE 'MySQL%'