--	--------------------------------------------------------------------------
--	PAR_Comp
--	--------------------------------------------------------------------------

DECLARE 
	@PAR_PartID		int,
	@PAR_PN			varchar(120),
	@PAR_Ref		varchar(120),
	@C_Ref			varchar(120)

DECLARE PAR_Cursor CURSOR FOR 
	SELECT PAR_PartID, PAR_PN, PAR_Ref
	FROM dbo.Parts (NOLOCK) 
	ORDER BY PAR_PartID

OPEN PAR_Cursor
FETCH PAR_Cursor INTO @PAR_PartID, @PAR_PN, @PAR_Ref
WHILE @@FETCH_STATUS = 0
BEGIN
	
	DECLARE Comp_Cursor CURSOR FOR 
		SELECT C_Ref
		FROM dbo.Comp
		WHERE C_Key = @PAR_Ref
	
	OPEN Comp_Cursor
	FETCH Comp_Cursor INTO @C_Ref
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF EXISTS( SELECT 1 FROM dbo.Parts WHERE PAR_PartID = @PAR_PartID AND PAR_Comp IS NULL)
		BEGIN
			UPDATE dbo.Parts SET 
				PAR_Comp = @C_Ref 
			WHERE PAR_PartID = @PAR_PartID
		END
		ELSE
			UPDATE dbo.Parts SET 
				PAR_Comp = LTRIM(PAR_Comp) + ', ' + @C_Ref
			WHERE PAR_PartID = @PAR_PartID
	
		FETCH Comp_Cursor INTO @C_Ref
	END
	CLOSE Comp_Cursor
	DEALLOCATE Comp_Cursor
	

	FETCH PAR_Cursor INTO @PAR_PartID, @PAR_PN, @PAR_Ref
END
CLOSE PAR_Cursor
DEALLOCATE PAR_Cursor


