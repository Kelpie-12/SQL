USE PD_311_HW
GO

SELECT 
	group_name 'Группа',
	COUNT(student_id) 'Кол-во студентов'
FROM Students,Groups
WHERE [group]=group_id
GROUP BY group_name 
ORDER BY 'Кол-во студентов' ASC

SELECT
	[Направление обучения]=Directions.derection_name,
	[Кол-во студентов]=COUNT(student_id)
FROM Students,Directions,Groups
WHERE [group]=group_id AND direction=direction_id 
GROUP BY Directions.derection_name