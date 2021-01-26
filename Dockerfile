FROM mcr.microsoft.com/mssql/server:2019-latest

LABEL maintainer="Taha Azab"
LABEL maintainer_email="azab.taha@gmail.com"
LABEL version="1.0"

ARG arg
ARG SA_PASSWORD

ENV SA_PASSWORD=${SA_PASSWORD}
EXPOSE 1433

WORKDIR /

ADD https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak wideworldimporters.bak
#ADD https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImportersDW-Full.bak wideworldimporters.bak

# Grant permissions for the wideworldimporters.bak
USER root
RUN chmod -R 777 ./wideworldimporters.bak

# ADD $BAK_FILE ./wideworldimporters.bak
ADD ./install.sql .
ADD ./install.sh .
ADD ./entrypoint.sh .


CMD /bin/bash ./entrypoint.sh
