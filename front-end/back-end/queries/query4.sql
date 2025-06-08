DELIMITER $$

CREATE PROCEDURE ChargesBy(
    IN tollOpID VARCHAR(255),
    IN periodFrom DATE,
    IN periodTo DATE
)
BEGIN
    SELECT 
        o2.ID AS visitingOpID,
        COUNT(p.ID) AS nPasses,
        ROUND(SUM(p.Amount), 2) AS passesCost
    FROM Pass p
    JOIN Tag t ON p.TagID = t.ID
    JOIN Operator o2 ON t.OperatorID = o2.ID
    JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
    WHERE ts.OperatorID = tollOpID
      AND o2.ID != tollOpID -- Exclude home operator
      AND p.Timestamp BETWEEN CONCAT(periodFrom, ' 00:00:00') AND CONCAT(periodTo, ' 23:59:59')
    GROUP BY o2.ID;
END$$

DELIMITER ;
