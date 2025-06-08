-- Drop the schema if it exists
DROP SCHEMA IF EXISTS softeng_07;
CREATE SCHEMA softeng_07;
USE softeng_07;
-- Create the Operator table
CREATE TABLE Operator (
    ID VARCHAR(200) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);
-- Create the User table
CREATE TABLE User (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    OperatorID VARCHAR(200) NOT NULL,
    FOREIGN KEY (OperatorID) REFERENCES Operator(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Create the Toll_Station table
CREATE TABLE Toll_Station (
    ID VARCHAR(200) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Road VARCHAR(255) NOT NULL,
    Lat FLOAT NOT NULL,
    Long_ FLOAT NOT NULL,
    Locality VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PM VARCHAR(20) NOT NULL,
    Price1 FLOAT NOT NULL,
    Price2 FLOAT NOT NULL,
    Price3 FLOAT NOT NULL,
    Price4 FLOAT NOT NULL,
    OperatorID VARCHAR(200) NOT NULL,
    FOREIGN KEY (OperatorID) REFERENCES Operator(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Create the Tag table
CREATE TABLE Tag (
    ID VARCHAR(200) PRIMARY KEY,
    OperatorID VARCHAR(200) NOT NULL,
    FOREIGN KEY (OperatorID) REFERENCES Operator(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Create the Pass table
CREATE TABLE Pass (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Amount FLOAT NOT NULL,
    Toll_StationID VARCHAR(200) NOT NULL,
    TagID VARCHAR(200) NOT NULL,
    Evaluated INT NOT NULL DEFAULT 0,
    FOREIGN KEY (Toll_StationID) REFERENCES Toll_Station(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TagID) REFERENCES Tag(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (Timestamp, Amount, Toll_StationID, TagID)
);
-- Create the Debt table
CREATE TABLE Debt (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Amount FLOAT NOT NULL,
    StartDate DATE,
    ToOperator VARCHAR(200) NOT NULL,
    FromOperator VARCHAR(200) NOT NULL,
    FOREIGN KEY (ToOperator) REFERENCES Operator(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (FromOperator) REFERENCES Operator(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Set the delimiter to allow creating procedures
DELIMITER // 
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
END //
DELIMITER;
DELIMITER //
 -- Create the PassAnalysis procedure
CREATE PROCEDURE PassAnalysis (
    IN stationOpID VARCHAR(255),
    IN tagOpID VARCHAR(255),
    IN date_from DATETIME,
    IN date_to DATETIME
) BEGIN
SELECT p.ID AS passID,
    ts.ID AS stationID,
    p.Timestamp AS timestamp,
    t.ID AS tagID,
    p.Amount AS passCharge,
    ROW_NUMBER() OVER (
        ORDER BY p.Timestamp
    ) AS passIndex
FROM Pass p
    JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
    JOIN Tag t ON p.TagID = t.ID
    JOIN Operator o ON ts.OperatorID = o.ID
    JOIN Operator o2 ON t.OperatorID = o2.ID
WHERE o.ID = stationOpID
    AND o2.ID = tagOpID
    AND p.Timestamp BETWEEN date_from AND date_to
ORDER BY p.Timestamp;
END //
DELIMITER;
DELIMITER //

CREATE PROCEDURE PayDebt (
    IN payingOpID VARCHAR(200),
    IN receivingOpID VARCHAR(200),
    IN amount_paid FLOAT
) BEGIN
DECLARE currentAmount FLOAT;
DECLARE newAmount FLOAT;
-- Get the current amount of debt
SELECT Amount INTO currentAmount
FROM Debt
WHERE FromOperator = payingOpID
    AND ToOperator = receivingOpID;
IF currentAmount IS NULL THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Debt record not found.';
ELSE -- Calculate the new amount
SET newAmount = currentAmount - amount_paid;
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
END //
DELIMITER;
DELIMITER //
CREATE PROCEDURE ShowsDebtTo (IN operatorID VARCHAR(200)) BEGIN
SELECT FromOperator AS Debtor,
    ToOperator AS Creditor,
    Amount AS DebtAmount,
    StartDate AS DebtStartDate
FROM Debt
WHERE ToOperator = operatorID;
END // -- Create the ShowsDebtFrom procedure
CREATE PROCEDURE ShowsDebtFrom (IN operatorID VARCHAR(200)) BEGIN
SELECT FromOperator AS Debtor,
    ToOperator AS Creditor,
    Amount AS DebtAmount,
    StartDate AS DebtStartDate
FROM Debt
WHERE FromOperator = operatorID;
END //
DELIMITER;
DELIMITER //
CREATE PROCEDURE TotalPassesAndCost (
    IN tollStationID VARCHAR(200),
    IN passDate DATE
) BEGIN
SELECT COUNT(*) AS TotalPasses,
    COALESCE(ROUND(SUM(Amount), 2), 0) AS TotalCost
FROM Pass
WHERE Toll_StationID = tollStationID
    AND DATE(Timestamp) = passDate;
END //
DELIMITER;
DELIMITER //


CREATE PROCEDURE ChargesBy(
    IN tollOpID VARCHAR(255),
    IN periodFrom DATE,
    IN periodTo DATE
) 
BEGIN
    -- First, get only the operators who actually have passes through the specified operator's stations
    WITH VisitingOperators AS (
        SELECT DISTINCT t.OperatorID
        FROM Pass p
        INNER JOIN Tag t ON p.TagID = t.ID
        INNER JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
        WHERE ts.OperatorID = tollOpID
        AND p.Timestamp BETWEEN CONCAT(periodFrom, ' 00:00:00') AND CONCAT(periodTo, ' 23:59:59')
        AND t.OperatorID != tollOpID
        AND t.OperatorID != 'admin'
    )
    -- Then calculate the statistics for these operators
    SELECT 
        vo.OperatorID AS visitingOpID,
        COUNT(p.ID) AS nPasses,
        ROUND(SUM(p.Amount), 2) AS passesCost
    FROM VisitingOperators vo
    INNER JOIN Tag t ON vo.OperatorID = t.OperatorID
    INNER JOIN Pass p ON p.TagID = t.ID
    INNER JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
    WHERE ts.OperatorID = tollOpID
    AND p.Timestamp BETWEEN CONCAT(periodFrom, ' 00:00:00') AND CONCAT(periodTo, ' 23:59:59')
    GROUP BY vo.OperatorID
    ORDER BY vo.OperatorID;
END //

DELIMITER ;
DELIMITER //
 -- Here are two procedure. The first one runs every night and updates all 8 * 7 rows of the debts table taking into account-- 
-- the new passes (new -> Evaluated = 0). It sets the amount to previous + new and the date to the minimum possible--
-- It takes for granted that there already exist all 8*7 combinations as rows. (They are created in inserts_start)--
-- The second procedure makes all the passes Evaluated=1 and should be run immediately after the first one.--
CREATE PROCEDURE Debt(
    IN p_FromOperator VARCHAR(200),
    IN p_ToOperator VARCHAR(200)
) BEGIN -- Declare variables to handle the calculation
DECLARE v_TotalDebtAmount FLOAT DEFAULT 0;
DECLARE v_ExistingDebtID INT;
DECLARE v_EarliestPassDate DATE;
-- Validate input operators are different and not admin
IF p_FromOperator = p_ToOperator THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'From and To operators must be different';
END IF;
-- Check if either operator is admin
IF p_FromOperator = 'admin'
OR p_ToOperator = 'admin' THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Admin cannot be involved in debt calculation';
END IF;
-- Calculate the total debt amount for passes between the two operators
SELECT COALESCE(SUM(p.Amount), 0) INTO v_TotalDebtAmount
FROM Pass p
    JOIN Tag t ON p.TagID = t.ID
    JOIN Operator op_tag ON t.OperatorID = op_tag.ID
    JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
    JOIN Operator op_station ON ts.OperatorID = op_station.ID
WHERE op_tag.ID = p_FromOperator
    AND op_station.ID = p_ToOperator
    AND p.Evaluated = 0;
-- If there's a debt amount, update the existing debt record
IF v_TotalDebtAmount > 0 THEN -- Find the earliest pass date for these operators
SELECT COALESCE(MIN(DATE(p.Timestamp)), CURRENT_DATE) INTO v_EarliestPassDate
FROM Pass p
    JOIN Tag t ON p.TagID = t.ID
    JOIN Operator op_tag ON t.OperatorID = op_tag.ID
    JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
    JOIN Operator op_station ON ts.OperatorID = op_station.ID
WHERE op_tag.ID = p_FromOperator
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
ELSE -- Fallback to insert if no existing record (to maintain data integrity)
INSERT INTO Debt (
        Amount,
        StartDate,
        FromOperator,
        ToOperator
    )
VALUES (
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
WHERE op_tag.ID = p_FromOperator
    AND op_station.ID = p_ToOperator
    AND p.Evaluated = 0;
END IF;
END 
//
DELIMITER;
DELIMITER //
 CREATE PROCEDURE MarkPassesAsEvaluated() BEGIN
UPDATE Pass
SET Evaluated = 1
WHERE Evaluated = 0;
END;
// -- Reset the delimiter
