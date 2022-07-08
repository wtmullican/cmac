SELECT * FROM dbo.Fitment WHERE DupCount > 1


SELECT * 
FROM dbo.FitmentTest_Prc 
ORDER BY FitmentID  --PartNumber, Make, Model, Year, Liter, CID, Block, Cyl, Fuel, Drive, TransType, MfrCode, FitNotes

SELECT Make, Model, Year, Liter, CID, Block, Cyl, Fuel, Drive, TransType, MfrCode, FitNotes, COUNT(*)
FROM dbo.FitmentTest_Prc
GROUP BY Make, Model, Year, Liter, CID, Block, Cyl, Fuel, Drive, TransType, MfrCode, FitNotes
HAVING COUNT(*) > 1
ORDER BY Make, Model, Year, Liter, CID, Block, Cyl, Fuel, Drive, TransType, MfrCode, FitNotes
