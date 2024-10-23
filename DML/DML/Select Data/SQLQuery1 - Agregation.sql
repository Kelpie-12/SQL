USE PD_311_HW
GO

SELECT 
	group_name '������',
	COUNT(student_id) '���-�� ���������'
FROM Students,Groups
WHERE [group]=group_id
GROUP BY group_name 
ORDER BY '���-�� ���������' ASC

SELECT
	[����������� ��������]=Directions.derection_name,
	[���-�� ���������]=COUNT(student_id)
FROM Students,Directions,Groups
WHERE [group]=group_id AND direction=direction_id 
GROUP BY Directions.derection_name