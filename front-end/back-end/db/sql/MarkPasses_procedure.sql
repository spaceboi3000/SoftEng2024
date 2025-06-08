DROP PROCEDURE IF EXISTS MarkPassesAsEvaluated;
-- Second Procedure
-- Update all rows in the Pass table to set Evaluated = 1
DELIMITER // 
CREATE PROCEDURE MarkPassesAsEvaluated() BEGIN
UPDATE Pass
SET Evaluated = 1
WHERE Evaluated = 0;
END;//
DELIMITER ;