This image is robot framework and selenium only support chrome headless mode and series running
in robot file with Open Browser user must add  required options  [--no-sandbox] and [--disable-dev-shm-usage]
as example below

```
Open Browser    ${URL}    ${BROWSER}    options=add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage"); add_argument("--ignore-certificate-errors")
```

# How to run 
```
docker run --rm -u 1000:1000 \
    -e ROBOT_TESTS=/robots/scenario/scenario_1.robot \
    -e ROBOT_TESTS_REPORT=/robots/output \
    -e ROBOT_SQL=/robots/sql \
    -e DB_SERVER_NAME=host.docker.internal \
    -e DB_SERVER_PORT=1433 \
    -e DB_SCHEMA_NAME=PIHD \
    -e DB_USERNAME=mustchange \
    -e DB_PASSWORD=mustchange \
    -e BROWSER=headlesschrome \
    -e URL=https://host.docker.internal:8443/ \
    -v /mnt/d/Development/pihd/at_script/ui:/robots \
    -ti tongace/docker-robot-framework:latest
```

## Evironment (-e)

### ROBOT_TESTS (required)
file or folder of robot test case

### ROBOT_TESTS_REPORT (required)
folder to store output report.

### ROBOT_SQL (oprional)
folder to store sql script file

### DB_SERVER_NAME (oprional)
ip or name of sql server

### DB_SERVER_PORT (oprional)
port of sql server (default 1433)

### DB_SCHEMA_NAME (oprional)
db name such as PIHD

### DB_USERNAME (oprional)
db username

### DB_PASSWORD (oprional)
db password

### BROWSER  (required)
browser to use to run test now is only headlesschrome
### URL (required)
url to test

## Volume mapper with host (-v) (required)
folder to map robot file and other relate files to container and also output folder.


please see https://github.com/tongace/docker_robot_framework for dockerfile