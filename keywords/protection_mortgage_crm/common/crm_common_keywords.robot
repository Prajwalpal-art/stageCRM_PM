*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process
Library    Collections
Test Teardown    Close All Browsers
Resource    crm_common_variables.robot

*** Keywords ***
CRM Smoke Placeholder
    Log    Placeholder only; add approved CRM flow steps and confirmed locators before browser execution.
Click Element Custom
    [Arguments]    ${xpath}

    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    xpath=//div[@role='status']     10s
    Wait Until Element Is Visible    ${xpath}    timeout=15s
    Wait Until Element Is Enabled    ${xpath}    timeout=10s

    Scroll Element Into View    ${xpath}

    Click Element    ${xpath}
Input Text Custom
    [Arguments]    ${xpath1}    ${xpath2}
    Wait Until Element Is Visible    ${xpath1}    timeout=10s
    Wait Until Element Is Enabled    ${xpath1}    timeout=10s
    Input Text    ${xpath1}    ${xpath2}
Scroll Down
    [Arguments]    ${xaxis}    ${yaxis}
    Execute JavaScript    window.scrollBy(${xaxis}, ${yaxis})        
# Select Date Range
#     Click Element Custom    ${Date_Xpath}
#     Wait Until Element Is Visible    ${Start_Date_Button}    timeout=15s
#     Click Element Custom    ${Start_Date_Button}
#     Click Element Custom    ${End_Date_Button}
login to stage_CRM
    Open Browser    https://stg.crm.wealthmax.co.uk/login   chrome
    Maximize Browser Window
    # sleep    5s
       
    Wait Until Element Is Visible    ${Email_css}    20s
    Input Text Custom    ${Email_css}    ${Email_Id}
    Input Text Custom    ${Password_css}    ${Password}
    Click Element Custom    ${Login_Button}
    # Sleep    5s
    # ${otp}=    Set Variable    123456
    Wait Until Element Is Visible    ${OTP_xpath}    10s
    FOR    ${index}    IN RANGE    0    6
        Input Text   (//*[contains(@maxlength, '1')])[${index + 1}]    ${OTP}[${index}]
    END
    Click Element Custom    ${Verify_Button}    
