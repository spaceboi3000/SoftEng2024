SELECT 
    CONCAT(
        '{',
        '"stationID": "', ts.ID, '", ',
        '"stationOperator": "', o.Name, '", ',
        '"requestTimestamp": "', NOW(), '", ',
        '"periodFrom": "', '2022-01-01', '", ',
        '"periodTo": "', '2022-06-01', '", ',
        '"nPasses": "', COUNT(p.ID), '", ',
        '"passList": [', GROUP_CONCAT(
            CONCAT(
                '{',
                '"passIndex": "', @rownum := @rownum + 1, '", ',
                '"passID": "', p.ID, '", ',
                '"timestamp": "', p.Timestamp, '", ',
                '"tagID": "', t.ID, '", ',
                '"tagProvider": "', o2.Name, '", ',
                '"passType": "', CASE WHEN o.ID = o2.ID THEN 'home' ELSE 'visitor' END, '", ',
                '"passCharge": "', p.Amount, '"',
                '}'
            ) SEPARATOR ','),
        ']',
        '}'
    ) AS ""
FROM Pass p
JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
JOIN Tag t ON p.TagID = t.ID
JOIN Operator o ON ts.OperatorID = o.ID
JOIN Operator o2 ON t.OperatorID = o2.ID
CROSS JOIN (SELECT @rownum := 0) AS r
WHERE ts.ID = 'GE02' 
  AND p.Timestamp BETWEEN '2022-01-01 00:00:00' AND '2022-06-01 23:59:59'
GROUP BY ts.ID, o.Name;
