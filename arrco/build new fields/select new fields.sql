SELECT PAR_PN, PAR_HVAC 
FROM dbo.Parts
WHERE PAR_HVAC IS NOT NULL

SELECT PAR_PN, PAR_Comp
FROM dbo.Parts
WHERE PAR_Comp IS NOT NULL