*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process
Library    Collections
Resource   ./kw1.robot


*** Variables ***
${Tenant_Management}    //*[contains(text(), 'Tenant Management')]
${Create_Tenant}    //*[contains(text(), 'Create Tenant')]
${Manual_Tenant_Creation}    //*[contains(text(), 'Fill the complete tenant profile on behalf of the tenant')]
${Run_Conduct_Check_Button}    (//button[contains(.,'Run Conduct Check')])[last()]
${Document_Type_Select}    xpath=//button[contains(text(), 'Select Document type')]
${Document_Upload_Input}    xpath=//input[@type='file']
${Upload_Button}    //button[contains(text(), ' Upload Document ')]
${Continue_With_Manual}    //*[contains(text(), ' Continue with Manual')]
${Enter_Company_Name}    (//*[contains(@placeholder, 'Enter company name')])[2]
${Company_Title}    (//*[contains(@placeholder,'e.g. Ltd, PLC')])[2]
${Company_Number}    (//*[contains(@placeholder, 'e.g. 12345678')])[2]
${Registration_Number}    (//*[contains(@placeholder, 'e.g. 123456')])[2]
${Tenant_Website}    (//*[contains(@placeholder, 'https://yourcompany.com')])[2]
${Company_Mobile_Number}    (//*[contains(@placeholder, '00 0000 0000')])[2]
${Company_Email}    (//*[contains(@placeholder, 'info@company.com')])[2]
${Complaince_Email}    (//*[contains(@placeholder, 'compliance@company.com')])[2]
${Postal_Code}    (//*[contains(@placeholder, 'Postcode')])[2]
${Document_Type_Dropdown}    (//*[contains(text(), 'Select Document type')])[2]
${Document_File_Input}    xpath=//input[@type='file']
${Upload_Document_Button}    xpath=//button[contains(text(), 'Upload Document')]
${company_name2}    (//*[contains(@placeholder, 'e.g. Wealthmax Financial Advisers')])[2]
${First_name2}    (//*[contains(@placeholder, 'e.g. Steve')])[2]
${Last_name2}    (//*[contains(@placeholder, 'e.g. Smith')])[2]
${Mobile_number2}    (//*[contains(@style, 'padding-left: 83px;')])
${company_email2}    (//*[contains(@placeholder, 'e.g. abc.def@gmail.com')])[2]
${Licensed}    (//*[contains(text(), 'Custom credits, duration & renewal')])
${User_Credits1}    (//*[contains(@placeholder, 'e.g. 10')])[2]
${Subscription_Duration}    (//*[contains(@placeholder, 'e.g. 12 months')])[2]
${Send_Invitation}    (//*[contains(text(), 'Send Invitation')])
${Subscription_Duration1}    (//*[contains(text(), 'Free Trial')])[2]


*** Keywords ***
Fill Field By Placeholder
    [Arguments]    ${placeholder}    ${value}    ${index}=1
    [Documentation]    Fills input field by placeholder text using native SeleniumLibrary
    Scroll Down    0    300
    ${locator}=    Catenate    (//*[contains(@placeholder,'${placeholder}')])[${index}]
    Wait Until Element Is Visible    xpath=${locator}    timeout=15s
    Click Element    xpath=${locator}
    Clear Element Text    xpath=${locator}
    Input Text    xpath=${locator}    ${value}
    Sleep    1s

Generate Unique Tenant Data
    [Documentation]    Generates unique values for tenant creation using timestamp
    ${timestamp}=    Evaluate    str(int(__import__('time').time() * 1000))[-8:]
    ${company_name}=    Evaluate    'Prajwal' + '${timestamp}'
    ${company_title}=    Evaluate    'Prajwal Pal Singh' + '${timestamp}'
    ${company_number}=    Evaluate    '${timestamp}'
    ${company_email}=    Evaluate    'Prajwal.s+' + '${timestamp}' + '@wealthmax.co.uk'
    ${compliance_email}=    Evaluate    'Prajwal.s+' + '${timestamp}' + '01@wealthmax.co.uk'
    
    [Return]    ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}

Create Tenant 
    ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}=    Generate Unique Tenant Data
    
    Click Element Custom    ${Tenant_Management}    
    Click Element Custom    ${Create_Tenant}    
    Click Element Custom    ${Manual_Tenant_Creation} 
    Click Element Custom    ${Continue_With_Manual}  
    Sleep    2s
    
    Fill Field By Placeholder    Enter company name    ${company_name}    2
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    https://yourcompany.com    https://yourcompany.com    2
    Fill Field By Placeholder    00 0000 0000    ${User_phonenumber}    2
    Fill Field By Placeholder    info@company.com    ${company_email}    2
    Fill Field By Placeholder    compliance@company.com    ${compliance_email}    2
    Fill Field By Placeholder    Postcode    TW89DW    2

Create Tenant2   
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    prajwal test
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    # Select Date of Birth (18+ years old)
    Sleep    15s
    # Click Element Custom    //*[contains(text(), 'dd-mm-yyyy')]
    # Sleep    1s
    # # Select year dropdown and set to 2006 (18+ years old in 2024)
    # Click Element Custom    xpath=//button[contains(@class, 'year')]
    # Sleep    1s
    # Click Element Custom    xpath=//*[contains(text(), '2006')]
    # Sleep    1s
    # # Select month
    # Click Element Custom    xpath=//button[contains(@class, 'month')]
    # Sleep    1s
    # Click Element Custom    xpath=//*[contains(text(), 'Jan')]
    # Sleep    1s
    # # Select day
    # Click Element Custom    xpath=//*[contains(text(), '15')]
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2] 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[1]
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]

Select Document Type
    [Arguments]    ${doc_type}
    Click Element Custom    ${Document_Type_Dropdown}
    Click Element Custom    xpath=//button[normalize-space()='${doc_type}']
Select Document Type2
    [Arguments]    ${doc_type1}
    Click Element Custom    (//*[contains(text(), 'Select Document type')])[2]
    Click Element Custom    xpath=//button[normalize-space()='${doc_type1}']    

Upload Tenant Document
    [Arguments]    ${doc_type}    ${file_path}
    Select Document Type    ${doc_type}
    Sleep    2s
    Wait Until Keyword Succeeds    20s    1s    Page Should Contain Element    ${Document_File_Input}
    Choose File    ${Document_File_Input}    ${file_path}
    Sleep    2s
    Click Element Custom    (//button[contains(.,'Upload Document') and not(contains(@style,'display: none'))])[1]

Run Conduct Check
    Scroll Down    0    500
    Wait Until Element Is Visible    (//button[contains(.,'Run Conduct Check')])[last()]    timeout=15s
    Click Element Custom    (//button[contains(.,'Run Conduct Check')])[last()]
    Sleep    3s
    ${no_buttons}=    Get WebElements    //span[normalize-space()='No']/ancestor::button
    FOR    ${button}    IN    @{no_buttons}
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${button}
        IF    ${is_visible}
            Click Element    ${button}
            # Sleep    2s
        END
    END
    # Sleep    2s
    # Click Save Conduct Check button
    Wait Until Element Is Visible    xpath=//button[contains(normalize-space(), 'Save')]    timeout=10s
    Click Element Custom    xpath=//button[contains(normalize-space(), 'Save')]

Upload Multiple Documents
    [Arguments]    ${doc_type1}    ${file_path}
    Scroll Down    0    500
    # Sleep    2s
    Wait Until Element Is Visible    (//*[contains(text(), 'Select Document type')])[2]    timeout=15s
    Select Document Type2    ${doc_type1}
    # Sleep    2s
    Wait Until Keyword Succeeds    20s    1s    Page Should Contain Element    ${Document_File_Input}
    Choose File    ${Document_File_Input}    ${file_path}
    Sleep    120s
    Click Element Custom    ${Upload_Document_Button}
    # Sleep    3s
Tenant credits
    Input Text Custom    (//*[contains(@placeholder, 'e.g. 1000')])[2]    100
    Input Text Custom    (//*[contains(@placeholder, 'e.g. 12 months')])[2]    12
    Click Element Custom    //*[contains(text(), 'Initiate Agreement')]
Invite Tenant Creation
    Click Element Custom    ${Tenant_Management}    
    Click Element Custom    ${Create_Tenant}
    Click Element Custom    //*[contains(text(), 'Ideal for self-service onboarding and free trial accounts')]
    Click Element Custom    //*[contains(text(), ' Continue with Invite')]
Fill Field By Placeholders
    [Arguments]    ${placeholders}    ${value}    ${index}=1
    [Documentation]    Fills input field by placeholder text using native SeleniumLibrary
    Scroll Down    0    300
    ${locator}=    Catenate    (//*[contains(@placeholder,'${placeholders}')])[${index}]
    Wait Until Element Is Visible    xpath=${locator}    timeout=15s
    Click Element    xpath=${locator}
    Clear Element Text    xpath=${locator}
    Input Text    xpath=${locator}    ${value}
    Sleep    1s
Generate Unique Tenants Data
    [Documentation]    Generates unique values for tenant creation using timestamp
    ${timestamp1}=    Evaluate    str(int(__import__('time').time() * 1000))[-10:]
    ${company_name2}=    Evaluate    'Prajwal' + '${timestamp1}'
    ${First_name2}=    Evaluate    'Prajwal Pal' 
    ${Last_name2}=    Evaluate    'Singh' 
    ${Company_Mobile_Number}=    Evaluate    '${timestamp1}'
    ${company_email2}=    Evaluate    'Prajwal.s+' + '${timestamp1}' + '@welthmax.co.uk'
   
    [Return]    ${company_name2}    ${First_name2}    ${Last_name2}    ${Company_Mobile_Number}    ${company_email2}
Create Invite Tenant Licenced 1
    ${company_name2}    ${First_name2}    ${Last_name2}    ${User_phonenumber}     ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Fill Field By Placeholder    00 0000 0000    ${User_phonenumber}    2
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2   
    Click Element Custom    ${Licensed}
    Input Text Custom    ${User_Credits1}    5
    Input Text Custom    ${Subscription_Duration}    11
    Click Element Custom    ${Send_Invitation}
Create Invite Tenant Licenced 2
    ${company_name2}    ${First_name2}    ${Last_name2}    ${User_phonenumber}     ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Fill Field By Placeholder    00 0000 0000    ${User_phonenumber}    2
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2 
    Click Element Custom    ${Send_Invitation} 
