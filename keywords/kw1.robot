*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.youtube.com
${BROWSER}    chrome
${Email_css}    css:input[type='email']
${Password_css}     css:input[type='password']
${Email_Id}    admin@wealthmax.local
${Password}    Admin@12345!
${Login_Button}    css:app-button-reusable[type='submit']
${OTP}    123456
${OTP_xpath}     (//*[contains(@maxlength, '1')])
${Verify_Button}    //*[contains(text(),'Verify')]
${Profile_Button}    (//*[contains(@class, 'flex items-center justify-center')])[3]
${View_Profile}    //*[contains(text(),'View profile')]
${Logout_Button}    //button[normalize-space()='Logout']
${User_Management}    //*[contains(text(), 'User Management ')]
${Create_User_Button}    //*[contains(text(), 'Create User')] 



*** Keywords ***
Click Element Custom
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    ${xpath}    timeout=15s
    Wait Until Element Is Enabled    ${xpath}    timeout=10s
    Click Element    ${xpath}
Input Text Custom
    [Arguments]    ${xpath1}    ${xpath2}
    Wait Until Element Is Visible    ${xpath1}    timeout=10s
    Wait Until Element Is Enabled    ${xpath1}    timeout=10s
    Input Text    ${xpath1}    ${xpath2}
Scroll Down
    [Arguments]    ${xaxis}    ${yaxis}
    Execute JavaScript    window.scrollBy(${xaxis}, ${yaxis})        
login to stageCRM
    Open Browser    https://stg.superadmin.wealthmax.co.uk/login   chrome
    Maximize Browser Window
    sleep    5s
       
    Wait Until Element Is Visible    ${Email_css}    20s
    Input Text Custom    ${Email_css}    ${Email_Id}
    Input Text Custom    ${Password_css}    ${Password}
    Click Element Custom    ${Login_Button}
    Sleep    5s
    # ${otp}=    Set Variable    123456
    Wait Until Element Is Visible    ${OTP_xpath}    10s
    FOR    ${index}    IN RANGE    0    6
        Input Text   (//*[contains(@maxlength, '1')])[${index + 1}]    ${OTP}[${index}]
    END
    Click Element Custom    ${Verify_Button}
    Sleep    5s  
log out
    Click Element Custom    ${Profile_Button} 
    Click Element Custom    ${Logout_Button}
View Profile
    Click Element Custom    ${Profile_Button}
    Click Element Custom    ${View_Profile}
    Scroll Down    0    200
    Sleep    5s
Create User Management
    Click Element Custom    ${User_Management}
    Click Element Custom    ${Create_User_Button}



    