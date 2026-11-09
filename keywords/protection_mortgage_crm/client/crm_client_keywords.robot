*** Settings ***
Resource    ../common/crm_common_keywords.robot
Resource    ../login/crm_login_keywords.robot
Resource    crm_client_variables.robot

*** Keywords ***
# CRM Client Smoke Placeholder
#     CRM Smoke Placeholder
Create Client1
    # [Arguments]    ${title}    ${first_name}    ${middle_name}    ${last_name}    ${email}    ${mobile_number}    
    Click Element    ${Client}
    Click Element    ${Create_Client}
    Click Element Custom    ${Title_Dropdown}    
    Click Element Custom    //button[@type='button' and .//div[normalize-space()='Mr']]
    Input Text Custom    ${First_Name}    Prajwal
    Input Text Custom   ${Middle_Name}    Pal
    Input Text Custom   ${Last_Name}    Singh
    Input Text Custom    ${Email}    Prajwal.s+890@welathmax.co.uk
    Input Text Custom    ${Mobile_Number}    1289898989
    # Click Element Custom    ${Product_Intrested}
    # Select From List By Label    ${Product_Intrested}    ${product_interested}
    # Click Element Custom   ${Client_Source}
    # Select From List By Label    ${Client_Source}    ${client_source}
    # Click Element Custom   ${Create}
