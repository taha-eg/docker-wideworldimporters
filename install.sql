USE [master]
RESTORE DATABASE [WideWorldImporters] 
    FROM DISK = '/wideworldimporters.bak'
        WITH MOVE 'WideWorldImporters' TO '/var/opt/mssql/data/WideWorldImporters.mdf',
        MOVE 'WideWorldImporters_log' TO '/var/opt/mssql/data/WideWorldImporters_log.ldf'
GO
