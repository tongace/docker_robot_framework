FROM alpine:3.11.3

RUN apk add --no-cache \
    bash py-pip \
    chromium chromium-chromedriver \
    gcc python2-dev musl-dev freetds freetds-dev

RUN pip install --upgrade pip setuptools wheel
RUN pip install robotframework \
    robotframework-seleniumlibrary \
    robotframework-databaselibrary \
    cython 
RUN pip install pymssql

ADD run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh

RUN adduser -D robotuser
USER robotuser

CMD ["run.sh"]