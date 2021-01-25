FROM mcr.microsoft.com/mssql/server:2019-latest

ARG BAK_FILE
ARG SA_PASSWORD

ENV SA_PASSWORD=${SA_PASSWORD}
EXPOSE 1433

WORKDIR /

COPY $BAK_FILE ./wideworldimporters.bak
COPY ./install.sql .
COPY ./install.sh .
COPY ./entrypoint.sh .

CMD /bin/bash ./entrypoint.sh
