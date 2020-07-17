#!/bin/bash
set -e
echo -e "ROBOT_TESTS as $ROBOT_TESTS"
echo -e "ROBOT_TESTS_REPORT as $ROBOT_TESTS_REPORT"
BROWSER=${BROWSER:-$BROWSER}
URL=${URL:-$URL}

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
robot  -v URL:${URL} -v BROWSER:${BROWSER} --outputdir ${ROBOT_TESTS_REPORT} ${ROBOT_TESTS}