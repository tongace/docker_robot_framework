FROM python:3.7.8-alpine3.12

RUN apk add --no-cache \
    bash chromium chromium-chromedriver \
    gcc python3-dev musl-dev freetds freetds-dev

RUN pip install  --no-cache-dir --upgrade pip setuptools wheel
RUN pip install  --no-cache-dir robotframework \
    robotframework-seleniumlibrary \
    robotframework-databaselibrary \
    cython 
RUN pip install  --no-cache-dir pymssql

ADD run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh

RUN adduser -D robotuser
USER robotuser

CMD ["run.sh"]