USE PD_311_HW
GO
--EXEC PrintStudents;
--EXEC PrintSchedule;
--EXEC sp_AddScheduleForStacionarGroupe '2024-01-10','14:30','PD_212','%ADO%','Покидюк'
--EXEC sp_AddScheduleForStacionarGroupe 'PD_321', '2024-01-09','14:30','Ковтун','Волосова'
--EXEC PrintScheduleForGropup 'PD_321';
EXEC sp_AddAlternatingDisciplineToSchedule 'PD_311', '%Hardware-PC%','2023-09-15','13:30','Кобылинский',2,4
--DELETE FROM Schedule
