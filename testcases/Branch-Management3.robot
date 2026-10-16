*** Settings ***
Resource    ../keywords/kw1.robot
Resource    ../keywords/kw2.robot
Resource    ../keywords/kw3.robot
Test Teardown    Close All Browsers


*** Test Cases ***
Verify User Able To Login
    Login To Business CRM
    Sleep    10s
    Close All Browsers


