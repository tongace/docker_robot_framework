#!/bin/bash
set -e
echo -e "ROBOT_TESTS as $ROBOT_TESTS"
echo -e "ROBOT_TESTS_REPORT as $ROBOT_TESTS_REPORT"

echo -e "ROBOT_SQL as $ROBOT_SQL"
echo -e "DB_SERVER_NAME as $DB_SERVER_NAME"
echo -e "DB_SERVER_PORT as $DB_SERVER_PORT"
echo -e "DB_SCHEMA_NAME as $DB_SCHEMA_NAME"
echo -e "DB_USERNAME as $DB_USERNAME"
echo -e "DB_PASSWORD as $DB_PASSWORD"

echo -e "BROWSER as $BROWSER"
echo -e "URL as $URL"

echo -e "SLEEP_IN_SEC as $SLEEP_IN_SEC"
echo -e "UPLOAD_FILE_PATH as ${UPLOAD_FILE_PATH}"

if [ -z "${ROBOT_TESTS}" ] || [ -z "${ROBOT_TESTS_REPORT}" ]
then
    echo -e "environment ROBOT_TESTS and ROBOT_TESTS_REPORT are required"
    exit 0
fi

echo -e "clear old output"
echo -e "${ROBOT_TESTS_REPORT}/*.html"
echo -e "${ROBOT_TESTS_REPORT}/*.xml"
echo -e "${ROBOT_TESTS_REPORT}/*.png"
rm -rf ${ROBOT_TESTS_REPORT}/*.html
rm -rf ${ROBOT_TESTS_REPORT}/*.xml
rm -rf ${ROBOT_TESTS_REPORT}/*.png
echo -e "Executing robot tests"
robot  \
    -v URL:${URL} \
    -v BROWSER:${BROWSER} \
    -v ROBOT_SQL:${ROBOT_SQL} \
    -v DB_SERVER_NAME:${DB_SERVER_NAME} \
    -v DB_SERVER_PORT:${DB_SERVER_PORT} \
    -v DB_SCHEMA_NAME:${DB_SCHEMA_NAME} \
    -v DB_USERNAME:${DB_USERNAME} \
    -v DB_PASSWORD:${DB_PASSWORD} \
	-v SLEEP_IN_SEC:${SLEEP_IN_SEC} \
	-v UPLOAD_FILE_PATH:${UPLOAD_FILE_PATH} \
    --outputdir ${ROBOT_TESTS_REPORT} \
    ${ROBOT_TESTS}