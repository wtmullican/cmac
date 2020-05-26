--	--------------------------------------------------------------------------
--	PAR_HVAC
--	--------------------------------------------------------------------------

UPDATE dbo.Parts SET PAR_HVAC = NULL WHERE 1=1

DECLARE 
	@PAR_PartID		int,
	@PAR_PN			varchar(120),
	@PAR_Ref		varchar(120),
	@H_Ref			varchar(120)

DECLARE PAR_Cursor CURSOR FOR 
	SELECT PAR_PartID, PAR_PN, PAR_Ref
	FROM dbo.Parts (NOLOCK) 
	ORDER BY PAR_PartID

OPEN PAR_Cursor
FETCH PAR_Cursor INTO @PAR_PartID, @PAR_PN, @PAR_Ref
WHILE @@FETCH_STATUS = 0
BEGIN
	
	DECLARE HVAC_Cursor CURSOR FOR 
		SELECT H_Ref
		FROM dbo.HVAC
		WHERE H_Key = @PAR_Ref
	
	OPEN HVAC_Cursor
	FETCH HVAC_Cursor INTO @H_Ref
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF EXISTS( SELECT 1 FROM dbo.Parts WHERE PAR_PartID = @PAR_PartID AND PAR_HVAC IS NULL)
		BEGIN
			UPDATE dbo.Parts SET 
				PAR_HVAC = @H_Ref 
			WHERE PAR_PartID = @PAR_PartID
		END
		ELSE
			UPDATE dbo.Parts SET 
				PAR_HVAC = LTRIM(PAR_HVAC) + ', ' + @H_Ref
			WHERE PAR_PartID = @PAR_PartID
	
		FETCH HVAC_Cursor INTO @H_Ref
	END
	CLOSE HVAC_Cursor
	DEALLOCATE HVAC_Cursor
	

	FETCH PAR_Cursor INTO @PAR_PartID, @PAR_PN, @PAR_Ref
END
CLOSE PAR_Cursor
DEALLOCATE PAR_Cursor
