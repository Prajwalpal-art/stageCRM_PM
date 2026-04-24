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
${Run_Conduct_Check_Button}    xpath=//button[contains(text(), 'Run Conduct Check')]
${Document_Type_Select}    xpath=//button[contains(text(), 'Select Document type')]
${Document_Upload_Input}    xpath=//input[@type='file']
${Upload_Button}    xpath=//button[contains(text(), 'Upload Document')]
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
${Document_Type_Dropdown}    //*[contains(text(), 'Select Document type')]
${Document_File_Input}    xpath=//input[@type='file']
${Upload_Document_Button}    xpath=//button[contains(text(), 'Upload Document')]

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
    ${company_email}=    Evaluate    'Prajwal.s+' + '${timestamp}' + '@welthmax.co.uk'
    ${compliance_email}=    Evaluate    'Prajwal.s+' + '${timestamp}' + '01@welthmax.co.uk'
    
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
    Click Element Custom     //*[contains(text(), 'dd-mm-yyyy')] 
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     //*[contains(text(), 'United Kingdom')] 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[1]
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]

Select Document Type
    [Arguments]    ${doc_type}
    Click Element Custom    ${Document_Type_Dropdown}
    Click Element Custom    xpath=//button[normalize-space()='${doc_type}']

Upload Tenant Document
    [Arguments]    ${doc_type}    ${file_path}
    Select Document Type    ${doc_type}
    Sleep    2s
    Wait Until Keyword Succeeds    20s    1s    Page Should Contain Element    ${Document_File_Input}
    Choose File    ${Document_File_Input}    ${file_path}
    Sleep    2s
    Click Element Custom    ${Upload_Document_Button}

Run Conduct Check
    Scroll Down    0    500
    Wait Until Element Is Visible    ${Run_Conduct_Check_Button}    timeout=15s
    Click Element Custom    ${Run_Conduct_Check_Button}
    Sleep    3s
    ${no_buttons}=    Get WebElements    xpath=//button[contains(text(), 'No')]|//button[contains(text(), 'NO')]
    FOR    ${button}    IN    @{no_buttons}
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${button}
        IF    ${is_visible}
            Click Element    ${button}
            Sleep    2s
        END
    END
    Sleep    2s
    # Click Save Conduct Check button
    Wait Until Element Is Visible    xpath=//button[contains(normalize-space(), 'Save')]    timeout=10s
    Click Element Custom    xpath=//button[contains(normalize-space(), 'Save')]

Upload Multiple Documents
    [Arguments]    @{documents}
    FOR    ${doc}    IN    @{documents}
        Log    Uploading document: ${doc}
        Upload Tenant Document    Identity (ID)    ${doc}
        Sleep    3s
    END
    Sleep    2s
