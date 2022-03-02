CREATE PROCEDURE Query1 @canton INT
AS
SELECT partidoId, entregableId, Entregable.planId, cantonId, kpiValue, kpiType, postTime, checksum, accionId FROM Entregable
LEFT JOIN [Plan] ON Entregable.planId = [Plan].planId
WHERE cantonId = @canton
GROUP BY partidoId, entregableId, Entregable.planId, cantonId, kpiValue, kpiType, postTime, checksum, accionId

EXEC Query1 @canton = 7


CREATE PROCEDURE Query2
AS
DECLARE @cantPartidos INT
SET @cantPartidos = (SELECT COUNT(*) FROM Partido) 

SELECT Canton.cantonId, Canton.nombre, Canton.provinciaId, COUNT(Entregable.entregableId) AS Cantidad_Entregable FROM Canton
LEFT JOIN Entregable ON Canton.cantonId = Entregable.cantonId
WHERE (
SELECT COUNT(DISTINCT [Plan].partidoId) FROM Entregable
LEFT JOIN [Plan] ON Entregable.planId = [Plan].planId
WHERE  Entregable.cantonId = Canton.cantonId
) <=  @cantPartidos * 0.25
GROUP BY Canton.cantonId, Canton.nombre, Canton.provinciaId

EXEC Query2


CREATE PROCEDURE Query3
AS

SELECT Partido.partidoId, Accion.accionId, Canton.cantonId, COUNT (entregableId) AS Cantidad_Entregables INTO #TempLocation FROM Partido
LEFT JOIN [Plan] ON Partido.partidoId = [Plan].partidoId
LEFT JOIN Accion ON [Plan].planId = Accion.planId
LEFT JOIN Entregable ON Accion.accionId = Entregable.accionId
LEFT JOIN Canton ON Entregable.cantonId = Canton.cantonId
GROUP BY Partido.partidoId, Accion.accionId, Canton.cantonId

SELECT * FROM #TempLocation AS T1
WHERE Cantidad_Entregables = (
SELECT MIN (Cantidad_Entregables) AS Minima_Cantidad FROM #tempLocation AS T2
WHERE T1.partidoId = T2.partidoId AND T1.accionId = T2.accionId
)
OR Cantidad_Entregables = (
SELECT MAX (Cantidad_Entregables) AS Maxima_Cantidad FROM #tempLocation AS T2
WHERE T1.partidoId = T2.partidoId AND T1.accionId = T2.accionId
)

EXEC Query3