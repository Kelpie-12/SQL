USE PD_311_HW;
GO

SELECT 
--last_name  '�������',first_name  '���',middle_name  '��������',birth_date '���� ��������'
	--last_name + ' ' + first_name+ ' ' + middle_name  '�.�.�',
	--birth_date '���� ��������'
	--[�.�.�.]=last_name + ' ' + first_name+ ' ' + middle_name,
	[�.�.�.] = FORMATMESSAGE('%s %s %s',last_name,first_name,middle_name),
	[����������] = discipline_name
FROM Teachers, Disciplines,TeachersDisciplineRelations
WHERE discipline=discipline_id AND discipline_name LIKE '%SQL%'--AND teacher=teacher_id;
