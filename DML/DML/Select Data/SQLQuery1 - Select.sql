USE PD_311_HW;
GO

SELECT 
--last_name  '�������',first_name  '���',middle_name  '��������',birth_date '���� ��������'
	--last_name + ' ' + first_name+ ' ' + middle_name  '�.�.�',
	--birth_date '���� ��������'
	--[�.�.�.]=last_name + ' ' + first_name+ ' ' + middle_name,
	[�.�.�.] = FORMATMESSAGE('%s %s %s',last_name,first_name,middle_name),
	birth_date '���� ��������'
FROM Teachers
WHERE first_name = '����'
--WHERE birth_date>'1990-01-01'
ORDER BY last_name DESC;