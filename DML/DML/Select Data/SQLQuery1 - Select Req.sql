USE PD_311_HW
GO

SELECT 
	--[Целевая дисциплина] = discipline_name,
	[Требуемая дисциплина] = discipline_name
FROM Disciplines, RequiredDiciplines
WHERE --required_discipline = discipline_id AND
discipline_id =required_discipline
AND target_discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%ADO%')
--AND discipline_name LIKE 'ADO'
AND Disciplines.discipline_id=required_discipline