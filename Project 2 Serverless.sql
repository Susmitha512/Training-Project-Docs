IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'presented_adlsforproject2_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [presented_adlsforproject2_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://presented@adlsforproject2.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE [dbo].[Shopping] (
	[Age] int,
	[Payment Method] nvarchar(4000),
	[Category] nvarchar(4000),
	[Gender] nvarchar(4000),
	[Quantity] int,
	[Shopping Mall] nvarchar(4000),
	[count] bigint
	)
	WITH (
	LOCATION = 'part-00000-tid-3018892156613465265-14a395e8-950d-411b-b290-54ee33a62377-25-1-c000.snappy.parquet',
	DATA_SOURCE = [presented_adlsforproject2_dfs_core_windows_net],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM [dbo].[Shopping]
GO