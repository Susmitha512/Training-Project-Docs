CREATE TABLE [dbo].[Populations]
(
    Rank INT,
    Country VARCHAR(50),
    Country_code VARCHAR(2),
    PopIn1980 FLOAT,
    PopIn2000 FLOAT,
    PopIn2010 FLOAT,
    PopIn2023 FLOAT,
    PopIn2024 FLOAT,
    ingestion_date DATETIME
)
WITH
(
    DISTRIBUTION = HASH (Rank),
    CLUSTERED COLUMNSTORE INDEX
)
GO

Select * from Populations

