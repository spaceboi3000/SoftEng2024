DELIMITER $$ 
CREATE PROCEDURE TollStationPasses (
    IN tollStationID VARCHAR(255),
    IN date_from DATETIME,
    IN date_to DATETIME
) BEGIN
SELECT ROW_NUMBER() OVER (
        ORDER BY p.Timestamp
    ) AS passIndex,
    p.ID AS passID,
    p.Timestamp AS timestamp,
    t.ID AS tagID,
    o2.Name AS tagProvider,
    CASE
        WHEN o.ID = o2.ID THEN 'home'
        ELSE 'visitor'
    END AS passType,
    p.Amount AS passCharge
FROM Pass p
    JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
    JOIN Tag t ON p.TagID = t.ID
    JOIN Operator o ON ts.OperatorID = o.ID
    JOIN Operator o2 ON t.OperatorID = o2.ID
WHERE ts.ID = tollStationID
    AND p.Timestamp BETWEEN date_from AND date_to
ORDER BY p.Timestamp;
END $$
