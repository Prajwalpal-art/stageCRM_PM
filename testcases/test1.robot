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
Verify Admin Able To Create User For General Management Role
    login to stageCRM
    Create User Management
    Sleep    5s
    log out   
# Read Mail
    # Read Password From Email    
Verify Admin Able To Search User
    login to stageCRM
    Search User
    Sleep    5s
    log out 
Verify Admin Able To View User Details
    login to stageCRM
    # Search User
    View User Deatails
    Scroll Down    0    100
    Sleep    6s
    # log out    
Verify And Validate That Admin Able To Export User Details
    login to stageCRM
    Export User Deatails
    Sleep    5s
    Open Downloaded XLS File    users (2).xlsx
    log out
