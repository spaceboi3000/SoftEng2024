DROP PROCEDURE IF EXISTS PayDebt;

DELIMITER // 
CREATE PROCEDURE PayDebt(IN payingOpID VARCHAR(200),IN receivingOpID VARCHAR(200),IN amount_paid FLOAT)
BEGIN
	DECLARE currentAmount FLOAT;
	DECLARE newAmount FLOAT;
	-- Get the current amount of debt
	SELECT Amount INTO currentAmount
	FROM Debt
	WHERE FromOperator = payingOpID
		AND ToOperator = receivingOpID;
	IF currentAmount IS NULL THEN -- No such debt exists
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Debt record not found.';
	ELSE -- Calculate the new amount
	SET newAmount = currentAmount - amount_paid;
	-- Prevent negative amounts. THAT SHOULD NEVER HAPPEN THOUGH. IT SHOULD BE PREVENTED BY THE UI OR THE CLI BEFORE IT IS CALLED
	IF newAmount <= 0 THEN -- Set Amount to zero and StartDate to NULL
	UPDATE Debt
	SET Amount = 0,
		StartDate = NULL
	WHERE FromOperator = payingOpID
		AND ToOperator = receivingOpID;
	ELSE -- Update the Amount
	UPDATE Debt
	SET Amount = newAmount
	WHERE FromOperator = payingOpID
		AND ToOperator = receivingOpID;
	END IF;
	END IF;
END;//
DELIMITER ;