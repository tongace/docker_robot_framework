#!/bin/bash
set -e
ROBOT_TESTS=${ROBOT_TESTS:-$ROBOT_TESTS}
ROBOT_TESTS_REPORT=${ROBOT_TESTS_REPORT:-$ROBOT_TESTS_REPORT}
BROWSER=${BROWSER:-$BROWSER}
URL=${URL:-$URL}

echo -e "clear old output"
echo -e "${ROBOT_TESTS_REPORT}/*.html"
echo -e "${ROBOT_TESTS_REPORT}/*.xml"
echo -e "${ROBOT_TESTS_REPORT}/*.png"
rm -rf ${ROBOT_TESTS_REPORT}/*.html
rm -rf ${ROBOT_TESTS_REPORT}/*.xml
rm -rf ${ROBOT_TESTS_REPORT}/*.png
echo -e "Executing robot tests"
robot  -v URL:${URL} -v BROWSER:${BROWSER} --outputdir ${ROBOT_TESTS_REPORT} ${ROBOT_TESTS}