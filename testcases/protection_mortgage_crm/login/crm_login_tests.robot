

*** Settings ***
Resource    ../../../keywords/protection_mortgage_crm/login/crm_login_keywords.robot

*** Test Cases ***
# CRM_LOGIN_001 - Login smoke placeholder
#     [Tags]    CRM_LOGIN    smoke
#     CRM Login Smoke Placeholder
CRM_LOGIN_002 - Login to stageCRM
    [Tags]    CRM_LOGIN    smoke
    Login to stage_CRM
    Sleep    5s
    Close All Browsers
