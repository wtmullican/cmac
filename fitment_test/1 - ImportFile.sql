
DECLARE	@FilePath varchar(256)

SET @FilePath = 'D:\_Imports\conflicting-fitments-test-file.csv'

EXEC dbo.Imp_FitmentTest_SP 0, @FilePath
