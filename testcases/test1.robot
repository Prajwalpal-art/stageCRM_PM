*** Settings ***
Resource    ../keywords/kw1.robot

*** Test Cases ***
Verify User Able To login
    login to stageCRM
User Able To Log Out
    login to stageCRM
    log out
User Able To View Profile
    login to stageCRM
    View Profile     
    log out
Admin Able To Create User For General Managenent Role
    login to stageCRM
    Create User Management   
    