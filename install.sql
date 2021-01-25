USE [master]
RESTORE DATABASE [WideWorldImporters] 
    FROM DISK = '/WideWorldImporters-Full.bak'
        WITH MOVE 'WideWorldImporters-Full' TO '/var/opt/mssql/data/WideWorldImporters.mdf',
        MOVE 'WideWorldImporters-Full_log' TO '/var/opt/mssql/data/WideWorldImporters_log.ldf'
GO
