DELIMITER $$

CREATE PROCEDURE PassAnalysis(
    IN stationOpID VARCHAR(255), 
    IN tagOpID VARCHAR(255), 
    IN date_from DATETIME, 
    IN date_to DATETIME
)
BEGIN
    SET SESSION group_concat_max_len = 10000;
    SELECT 
        CONCAT(
            '{',
            '"stationOpID": "', o.ID, '", ',
            '"tagOpID": "', o2.ID, '", ',
            '"requestTimestamp": "', NOW(), '", ',
            '"periodFrom": "', date_from, '", ',
            '"periodTo": "', date_to, '", ',
            '"nPasses": "', COUNT(p.ID), '", ',
            '"passList": [', GROUP_CONCAT(
                CONCAT(
                    '{',
                    '"passIndex": "', @rownum := @rownum + 1, '", ',
                    '"passID": "', p.ID, '", ',
                    '"stationID": "', ts.ID, '", ',
                    '"timestamp": "', p.Timestamp, '", ',
                    '"tagID": "', t.ID, '", ',
                    '"passCharge": "', p.Amount, '"',
                    '}'
                ) SEPARATOR ','), 
            ']',
            '}'
        ) AS result
    FROM Pass p
    JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
    JOIN Tag t ON p.TagID = t.ID
    JOIN Operator o ON ts.OperatorID = o.ID
    JOIN Operator o2 ON t.OperatorID = o2.ID
    CROSS JOIN (SELECT @rownum := 0) AS r
    WHERE o.ID = stationOpID
      AND o2.ID = tagOpID
      AND p.Timestamp BETWEEN date_from AND date_to
    GROUP BY o.ID, o2.ID;
END$$

DELIMITER ;
