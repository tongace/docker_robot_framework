FROM alpine:3.12.0

RUN apk add --no-cache \
    bash py-pip \
    chromium chromium-chromedriver 

RUN pip install --upgrade pip 
RUN pip install robotframework \
    robotframework-seleniumlibrary \
    robotframework-databaselibrary

ADD run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh

RUN adduser -D robotuser
USER robotuser

CMD ["run.sh"]