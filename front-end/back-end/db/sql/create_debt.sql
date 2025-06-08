-- Drop the existing procedure if it exists
DROP PROCEDURE IF EXISTS Debt;
-- Here are two procedure. The first one runs every night and updates all 8 * 7 rows of the debts table taking into account-- 
-- the new passes (new -> Evaluated = 0). It sets the amount to previous + new and the date to the minimum possible--
-- It takes for granted that there already exist all 8*7 combinations as rows. (They are created in inserts_start)--
-- The second procedure makes all the passes Evaluated=1 and should be run immediately after the first one.--
DELIMITER //

CREATE PROCEDURE Debt(
    IN p_FromOperator VARCHAR(200),
    IN p_ToOperator VARCHAR(200)
)
BEGIN
    -- Declare variables to handle the calculation
    DECLARE v_TotalDebtAmount FLOAT DEFAULT 0;
    DECLARE v_ExistingDebtID INT;
    DECLARE v_EarliestPassDate DATE;
    
    -- Validate input operators are different and not admin
    IF p_FromOperator = p_ToOperator THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'From and To operators must be different';
    END IF;
    
    -- Check if either operator is admin
    IF p_FromOperator = 'admin' OR p_ToOperator = 'admin' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Admin cannot be involved in debt calculation';
    END IF;
    
    -- Calculate the total debt amount for passes between the two operators
    SELECT COALESCE(SUM(p.Amount), 0) INTO v_TotalDebtAmount
    FROM Pass p
    JOIN Tag t ON p.TagID = t.ID
    JOIN Operator op_tag ON t.OperatorID = op_tag.ID
    JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
    JOIN Operator op_station ON ts.OperatorID = op_station.ID
    WHERE 
        op_tag.ID = p_FromOperator 
        AND op_station.ID = p_ToOperator 
        AND p.Evaluated = 0;
    
    -- If there's a debt amount, update the existing debt record
    IF v_TotalDebtAmount > 0 THEN
        -- Find the earliest pass date for these operators
        SELECT COALESCE(MIN(DATE(p.Timestamp)), CURRENT_DATE) INTO v_EarliestPassDate
        FROM Pass p
        JOIN Tag t ON p.TagID = t.ID
        JOIN Operator op_tag ON t.OperatorID = op_tag.ID
        JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
        JOIN Operator op_station ON ts.OperatorID = op_station.ID
        WHERE 
            op_tag.ID = p_FromOperator 
            AND op_station.ID = p_ToOperator 
            AND p.Evaluated = 0;
        
        -- Check if a debt record already exists
        SELECT ID INTO v_ExistingDebtID
        FROM Debt
        WHERE FromOperator = p_FromOperator 
          AND ToOperator = p_ToOperator
        LIMIT 1;
        
        -- Update existing debt record or insert if not exists
        IF v_ExistingDebtID IS NOT NULL THEN
            UPDATE Debt
            SET Amount = Amount + v_TotalDebtAmount,
                StartDate = COALESCE(StartDate, v_EarliestPassDate)
            WHERE ID = v_ExistingDebtID;
        ELSE
            -- Fallback to insert if no existing record (to maintain data integrity)
            INSERT INTO Debt (
                Amount, 
                StartDate, 
                FromOperator, 
                ToOperator
            ) VALUES (
                v_TotalDebtAmount, 
                v_EarliestPassDate, 
                p_FromOperator, 
                p_ToOperator
            );
        END IF;
        
        -- Mark the passes as evaluated
        UPDATE Pass p
        JOIN Tag t ON p.TagID = t.ID
        JOIN Operator op_tag ON t.OperatorID = op_tag.ID
        JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
        JOIN Operator op_station ON ts.OperatorID = op_station.ID
        SET p.Evaluated = 1
        WHERE 
            op_tag.ID = p_FromOperator 
            AND op_station.ID = p_ToOperator 
            AND p.Evaluated = 0;
    END IF;
END //

DELIMITER ;