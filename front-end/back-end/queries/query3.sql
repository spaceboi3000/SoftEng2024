SELECT 
    CONCAT(
        '{',
        '"tollOpID": "', o.ID, '", ',
        '"tagOpID": "', o2.ID, '", ',
        '"requestTimestamp": "', NOW(), '", ',
        '"periodFrom": "', '2022-01-01', '", ',
        '"periodTo": "', '2022-06-01', '", ',
        '"nPasses": "', COUNT(p.ID), '", ',
        '"passesCost": "', ROUND(SUM(p.Amount), 2), '"',
        '}'
    ) AS ""
FROM Pass p
JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
JOIN Operator o ON ts.OperatorID = o.ID
JOIN Tag t ON p.TagID = t.ID
JOIN Operator o2 ON t.OperatorID = o2.ID
WHERE o.ID = 'NO' -- Replace with actual tollOpID
  AND o2.ID = 'NAO' -- Replace with actual tagOpID
  AND p.Timestamp BETWEEN '2022-01-01 00:00:00' AND '2022-06-01 23:59:59'
GROUP BY o.ID, o2.ID;
