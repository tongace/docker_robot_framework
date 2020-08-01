FROM python:3.7.8-alpine3.12

RUN apk add --no-cache \
    bash chromium chromium-chromedriver \
    gcc python3-dev musl-dev freetds freetds-dev tzdata

RUN pip install  --no-cache-dir --upgrade pip setuptools wheel
RUN pip install  --no-cache-dir robotframework \
    robotframework-seleniumlibrary \
    robotframework-databaselibrary \
    cython 
RUN pip install  --no-cache-dir pymssql

ENV ROBOT_TESTS=/robots/scenario
ENV ROBOT_TESTS_REPORT=/robots/output
ENV ROBOT_SQL=/robots/sql
ENV DB_SERVER_NAME=host.docker.internal
ENV DB_SERVER_PORT=1433
ENV DB_SCHEMA_NAME=PIHD
ENV DB_USERNAME=pihd
ENV DB_PASSWORD=mustbedefind
ENV BROWSER=headlesschrome
ENV URL=https://host.docker.internal:8443/
ENV SLEEP_IN_SEC=3
ENV UPLOAD_FILE_PATH=/robots/upload
ENV TZ=Asia/Bangkok

ADD run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh

RUN adduser -D robotuser
USER robotuser

CMD ["run.sh"]