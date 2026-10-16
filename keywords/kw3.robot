*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process
Library    Collections
Resource   ./kw1.robot
Resource   ./kw2.robot

*** Variables ***
${Email_Address}    (//*[contains(@placeholder, 'Enter Email')])[2]
${User_Password}    (//*[contains(@placeholder, 'Enter Password')])[2]
${User_Name}    prajwal.s+90@wealthmax.co.uk
${Password}    Mybell@123
${Login_Button}     (//*[contains(text(), 'Login')])[2]






*** Keywords ***
# Close Browser Session    Close All Browsers
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
Login To Business CRM
    Open Browser    https://stg.crm.wealthmax.co.uk/login   Chrome
    Maximize Browser Window
   
    Input Text Custom    ${Email_Address}   ${User_Name}
    Input Text Custom  ${User_Password}    ${Password}
    Click Element Custom  (//*[contains(text(), 'Login')])[2]