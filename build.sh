#!/bin/bash

if [ ! -f WideWorldImporters-Full.bak ]; then
    echo "Downloading WideWorldImporters OLTP backup file from Microsoft..."
    wget https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak -O WideWorldImporters-Full.bak -q
    echo "Download complete."
else
    echo "WideWorldImporters OLTP backup file already downloaded. Skipping."
fi
if [ ! -f WideWorldImportersDW-Full.bak ]; then
    echo "Downloading WideWorldImporters data warehouse backup file from Microsoft..."
    wget https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImportersDW-Full.bak -O WideWorldImportersDW-Full.bak -q
    echo "Download complete."
else
    echo "WideWorldImporters data warehouse backup file already downloaded. Skipping."
fi

echo "Building OLTP docker image."
docker build . -t taha3azab/mssql-server-linux-wideworldimporters:latest --build-arg BAK_FILE=./WideWorldImporters-Full.bak
docker tag taha3azab/mssql-server-linux-wideworldimporters:latest taha3azab/mssql-server-linux-wideworldimporters:oltp

echo "Building OLAP docker image."
docker build . -t taha3azab/mssql-server-linux-wideworldimporters:olap --build-arg BAK_FILE=./WideWorldImportersDW-Full.bak
docker tag taha3azab/mssql-server-linux-wideworldimporters:olap taha3azab/mssql-server-linux-wideworldimporters:olap
