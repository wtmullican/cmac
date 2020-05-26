--	--------------------------------------------------------------------------
--	Declare Variables
--	--------------------------------------------------------------------------
DECLARE
	@pFilePath			varchar(256),
	@BulkInsert			varchar(1024)
	
--	--------------------------------------------------------------------------
--	Import Comp
--	--------------------------------------------------------------------------
BEGIN
	SET @pFilePath = 'E:\ARRCO\Comp.csv'	
	TRUNCATE TABLE dbo.Comp1
	SET @BulkInsert = 'BULK INSERT dbo.Comp1 FROM ''' + @pFilePath + ''' WITH ( FIRSTROW = 2,FIELDTERMINATOR = ''|'',	ROWTERMINATOR = ''\n'' )'
	EXECUTE (@BulkInsert)
	PRINT 'BulkInsert COMP Complete.'
END
--	--------------------------------------------------------------------------
--	Import HVAC
--	--------------------------------------------------------------------------
BEGIN
	SET @pFilePath = 'E:\ARRCO\HVAC.csv'	
	TRUNCATE TABLE dbo.HVAC1
	SET @BulkInsert = 'BULK INSERT dbo.HVAC1 FROM ''' + @pFilePath + ''' WITH ( FIRSTROW = 2,FIELDTERMINATOR = ''|'',	ROWTERMINATOR = ''\n'' )'
	EXECUTE (@BulkInsert)
	PRINT 'BulkInsert HVAC Complete.'
END
--	--------------------------------------------------------------------------
--	Import Parts
--	--------------------------------------------------------------------------
BEGIN
	SET @pFilePath = 'E:\ARRCO\ARRCO Part Numbers.csv'	
	TRUNCATE TABLE dbo.Parts1
	TRUNCATE TABLE dbo.Parts
	SET @BulkInsert = 'BULK INSERT dbo.Parts1 FROM ''' + @pFilePath + ''' WITH ( FIRSTROW = 2,FIELDTERMINATOR = ''|'',	ROWTERMINATOR = ''\n'' )'
	EXECUTE (@BulkInsert)
	
	Insert Into dbo.Parts (PAR_PN, PAR_Ref)
	SELECT PAR_PN, PAR_Ref FROM dbo.Parts1

	PRINT 'BulkInsert Parts Complete.'
END
