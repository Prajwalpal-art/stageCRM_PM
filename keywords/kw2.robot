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
${Postal_Code}    (//*[contains(@placeholder, 'e.g. TW89DW')])[1]
${Document_Type_Dropdown}    (//*[contains(text(), 'Select Document type')])[2]
${Document_File_Input}    xpath=//input[@type='file']
${Upload_Document_Button}    (//button[.//span[contains(normalize-space(),'Upload Document')]])
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
${Wealthmax_Name}    Wealthmax Financial Advisers Wealthmax Financial Advisers Wealthmax Financial Advisers Wealthmax Financial Advisers Wealthmax Financial Advisers Wealthmax Financial Advisers Wealthmax Financial Advisers Wealthmax Financial Advisers
${Licensed_Selected}    //p[normalize-space()='Licensed']/ancestor::div[contains(@class,'cursor-pointer')]//div[contains(@class,'bg-indigo600')]
${Free_Trial_Selected}    //p[normalize-space()='Free Trial']/ancestor::div[contains(@class,'cursor-pointer')]//div[contains(@class,'bg-indigo600')]
${Auto_Renew_Toggle}    xpath=//app-toggle-reusable[@type='tenant']//button[@role='switch']
${Auto_Renew_Label}     xpath=//*[normalize-space()='Auto Renew']
${OUTLOOK_URL}    https://outlook.office.com/mail/
${OUTLOOK_ALIAS}    OutlookBrowser
${OUTLOOK_SEARCH}    id=topSearchInput
${INVITATION_SUBJECT}    Welcome to WealthMax
${INVITATION_SENDER}    noreply@mg.wealthmaxcommercial.co.uk
${INVITATION_EMAIL_RESULT}    xpath=(//*[contains(normalize-space(.),'Welcome to WealthMax')])[last()]
${INVITATION_POPUP}    xpath=//*[contains(@placeholder,'e.g. Wealthmax Financial Advisers')][2]/ancestor::*[@role='dialog'][1]
${INVITATION_CANCEL}    xpath=(//button[normalize-space()='Cancel' or .//*[normalize-space()='Cancel']])[last()]
${INVITE_COMPANY_NAME_FIELD}    xpath=(//*[contains(@placeholder,'e.g. Wealthmax Financial Advisers')])[2]
${INVITATION_CANCEL_BUTTON}    xpath=(//button[normalize-space()='Cancel' or .//*[normalize-space()='Cancel']])[last()]
${INVITATION_CLOSE_ICON}    //*[contains(@aria-label, "Close popup")]


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

    RETURN    ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}
Create Tenant 
    ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}=    Generate Unique Tenant Data
    
    Click Element Custom    ${Tenant_Management}    
    Click Element Custom    ${Create_Tenant}    
    Click Element Custom    ${Manual_Tenant_Creation} 
    Click Element Custom    ${Continue_With_Manual}  
    Fill Field By Placeholder    Enter company name    ${company_name}    2
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    https://yourcompany.com    https://yourcompany.com    2
    Fill Field By Placeholder    Enter phone number    ${User_phonenumber}    1
    Fill Field By Placeholder    info@company.com    ${company_email}    2
    Fill Field By Placeholder    compliance@company.com    ${compliance_email}    2
    Fill Field By Placeholder    e.g. TW89DW    TW89DW  
    Fill Field By Placeholder    Pick Your Address      GULF AIR, 1000 GREAT WEST ROAD, BRENTFORD, MIDDLESEX  

Create Tenant2   
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2] 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[1]
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]
Fill Adult DOB
    Wait Until Element Is Visible    //input[contains(@placeholder,'dd-mm-yyyy')]    10s
    Input Text    //input[contains(@placeholder,'dd-mm-yyyy')]    15-01-2005
Select Document Type
    [Arguments]    ${doc_type}
    Click Element Custom    ${Document_Type_Dropdown}
    Click Element Custom    xpath=//button[normalize-space()='${doc_type}']
Select Document Type1
    [Arguments]    ${doc_type1}
    Click Element Custom    (//*[contains(text(), 'Select Document type')])[2]
    Click Element Custom    xpath=//button[normalize-space()='${doc_type1}']
Click Element With JavaScript
    [Arguments]    ${text_to_find}
    ${js}=    Catenate    const btns = Array.from(document.querySelectorAll('button')); const btn = btns.find(b => b.textContent && b.textContent.includes('${text_to_find}') && window.getComputedStyle(b).display !== 'none'); if(!btn){ return false; } btn.scrollIntoView({behavior:'auto', block:'center', inline:'nearest'}); btn.click(); return true;
    ${result}=    Execute JavaScript    ${js}
    Should Be True    ${result}    Button with text '${text_to_find}' not found or not interactable    
Upload Tenant Document
    [Arguments]    ${doc_type}    ${file_path}
    Select Document Type    ${doc_type}
    Sleep    1s
    File Should Exist    ${file_path}
    Wait Until Keyword Succeeds    1s    1s    Page Should Contain Element    ${Document_File_Input}
    Choose File    ${Document_File_Input}    ${file_path}
    Sleep    1s
    Scroll Down    0    300
    Sleep    1s
    Click Element    //button[.//span[contains(normalize-space(),'Upload Document')]]
    Scroll Down    0    300
    Sleep    1s    
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
        END
    END
    Wait Until Element Is Visible    xpath=//button[contains(normalize-space(), 'Save')]    timeout=10s
    Click Element Custom    xpath=//button[contains(normalize-space(), 'Save')]
Upload Multiple Documents
    [Arguments]    ${doc_type1}    ${file_path1}
    Select Document Type1    ${doc_type1}
    File Should Exist    ${file_path1}
    Wait Until Page Contains Element    (//input[@type='file'])[last()]    timeout=20s
    Choose File    (//input[@type='file'])[last()]    ${file_path1}
    Sleep    2s
    Click Element Custom    (//button[.//span[contains(normalize-space(),'Upload Document')]])[2]
    Sleep    1s
Tenant credits
    Input Text Custom    (//*[contains(@placeholder, 'e.g. 1000')])[2]    1000
    Input Text Custom    (//*[contains(@placeholder, 'e.g. 12 months')])[2]    11
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
    ${company_email2}=    Evaluate    'Prajwal.s+' + '${timestamp1}' + '@wealthmax.co.uk'
    RETURN   ${company_name2}    ${First_name2}    ${Last_name2}    ${Company_Mobile_Number}    ${company_email2}
Create Invite Tenant Licenced 1
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type=tel}     ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2   
    Click Element Custom    ${Licensed}
    Input Text Custom    ${User_Credits1}    50
    Input Text Custom    ${Subscription_Duration}    11
    Click Element Custom    ${Send_Invitation}
    Log To Console    Invitation sent to: ${company_email2}
    RETURN    ${company_email2}

Create Invite Tenant Licenced 2
    ${company_name2}    ${First_name2}    ${Last_name2}    ${User_phonenumber}     ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2 
    Click Element Custom    ${Send_Invitation}
Vaild Company Name
    ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}=    Generate Unique Tenant Data
    Click Element Custom    ${Tenant_Management}    
    Click Element Custom    ${Create_Tenant}    
    Click Element Custom    ${Manual_Tenant_Creation} 
    Click Element Custom    ${Continue_With_Manual}
    Input Text Custom    (//*[contains(@placeholder, 'Enter company name')])[2]    Wealthmax Financial Advisers
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    https://yourcompany.com    https://yourcompany.com    2
    Fill Field By Placeholder    Enter phone number    ${User_phonenumber}    1
    Fill Field By Placeholder    info@company.com    ${company_email}    2
    Fill Field By Placeholder    compliance@company.com    ${compliance_email}    2
    Fill Field By Placeholder    e.g. TW89DW    TW89DW  
    Fill Field By Placeholder    Pick Your Address      GULF AIR, 1000 GREAT WEST ROAD, BRENTFORD, MIDDLESEX
Blank Company Name
    ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}=    Generate Unique Tenant Data
    Click Element Custom    ${Tenant_Management}    
    Click Element Custom    ${Create_Tenant}    
    Click Element Custom    ${Manual_Tenant_Creation} 
    Click Element Custom    ${Continue_With_Manual}
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    https://yourcompany.com    https://yourcompany.com    2
    Fill Field By Placeholder    Enter phone number    ${User_phonenumber}    1
     Fill Field By Placeholder    info@company.com    ${company_email}    2
    Fill Field By Placeholder    compliance@company.com    ${compliance_email}    2
    Fill Field By Placeholder    e.g. TW89DW    TW89DW  
    Fill Field By Placeholder    Pick Your Address      GULF AIR, 1000 GREAT WEST ROAD, BRENTFORD, MIDDLESEX   
Email Mandatory Field Validation
    ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}=    Generate Unique Tenant Data
    Click Element Custom    ${Tenant_Management}    
    Click Element Custom    ${Create_Tenant}    
    Click Element Custom    ${Manual_Tenant_Creation} 
    Click Element Custom    ${Continue_With_Manual}
    Fill Field By Placeholder    Enter company name    ${company_name}    2
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    https://yourcompany.com    https://yourcompany.com    2
    Fill Field By Placeholder    Enter phone number    ${User_phonenumber}    1
    Fill Field By Placeholder    e.g. TW89DW    TW89DW  
    Fill Field By Placeholder    Pick Your Address      GULF AIR, 1000 GREAT WEST ROAD, BRENTFORD, MIDDLESEX
Company Name Maximum Length Validation
     ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}=    Generate Unique Tenant Data
    Click Element Custom    ${Tenant_Management}    
    Click Element Custom    ${Create_Tenant}    
    Click Element Custom    ${Manual_Tenant_Creation} 
    Click Element Custom    ${Continue_With_Manual}
    Input Text Custom    (//*[contains(@placeholder, 'Enter company name')])[2]    ${Wealthmax_Name} 
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    https://yourcompany.com    https://yourcompany.com    2
    Fill Field By Placeholder    Enter phone number    ${User_phonenumber}    1
    Fill Field By Placeholder    info@company.com    ${company_email}    2
    Fill Field By Placeholder    compliance@company.com    ${compliance_email}    2
    Fill Field By Placeholder    e.g. TW89DW    TW89DW  
    Fill Field By Placeholder    Pick Your Address      GULF AIR, 1000 GREAT WEST ROAD, BRENTFORD, MIDDLESEX  
First Name Valid Entry
    ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}=    Generate Unique Tenant Data
    Click Element Custom    ${Tenant_Management}    
    Click Element Custom    ${Create_Tenant}    
    Click Element Custom    ${Manual_Tenant_Creation} 
    Click Element Custom    ${Continue_With_Manual}
    Fill Field By Placeholder    Enter company name    ${company_name}    2
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    https://yourcompany.com    https://yourcompany.com    2
    Fill Field By Placeholder    Enter phone number    ${User_phonenumber}    1
    Fill Field By Placeholder    info@company.com    ${company_email}    2
    Fill Field By Placeholder    compliance@company.com    ${compliance_email}    2
    Fill Field By Placeholder    e.g. TW89DW    TW89DW  
    Fill Field By Placeholder    Pick Your Address      GULF AIR, 1000 GREAT WEST ROAD, BRENTFORD, MIDDLESEX
Create Tenant Company In formantion  
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2] 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[1]
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]    
First Name Mandatory Field Validation
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2] 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[1]
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]
Company Name Special Characters Validation
    ${company_name}    ${company_title}    ${company_number}    ${company_email}    ${compliance_email}=    Generate Unique Tenant Data
    Click Element Custom    ${Tenant_Management}    
    Click Element Custom    ${Create_Tenant}    
    Click Element Custom    ${Manual_Tenant_Creation} 
    Click Element Custom    ${Continue_With_Manual}
    Input Text Custom    (//*[contains(@placeholder, 'Enter company name')])[2]    Wealthmax Financial Advisers @#$%^&*()_+
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    e.g. Ltd, PLC    ${company_title}    2
    Fill Field By Placeholder    e.g. 12345678    ${company_number}    2
    Fill Field By Placeholder    https://yourcompany.com    https://yourcompany.com    2
    Fill Field By Placeholder    Enter phone number    ${User_phonenumber}    1
    Fill Field By Placeholder    info@company.com    ${company_email}    2
    Fill Field By Placeholder    compliance@company.com    ${compliance_email}    2
    Fill Field By Placeholder    e.g. TW89DW    TW89DW  
    Fill Field By Placeholder    Pick Your Address      GULF AIR, 1000 GREAT WEST ROAD, BRENTFORD, MIDDLESEX    
First Name Numeric Character Validation
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal121
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2] 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[1]
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]
Last Name Mandatory Field Validation
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2] 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[1]
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]    
    Click Element Custom    //*[contains(text(), 'Yes')]
Mobile Number Valid Entry
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2] 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[1]
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]
Mobile Valid Entry
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2] 
    Click Element Custom    (//div[contains(@class,'iti__selected-country-primary')])[2]
    Input Text Custom    //input[@role='combobox']    India
    Click Element Custom    (//*[contains(text(),'India')])[1]
    Input Text Custom     (//input[contains(@placeholder,'Enter phone number')])[2]   9797111111 
    Input Text Custom    //input[@type='email' and @placeholder='admin@company.com']    Prajwal.s+0990@wealthmax.co.uk  
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]    
Mobile Number field left blank
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2]
    Input Text Custom    //input[@type='email' and @placeholder='admin@company.com']    Prajwal.s+0991@wealthmax.co.uk 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]
Incorrect Mobile Number format
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2]
    Input Text Custom     (//input[contains(@placeholder,'Enter phone number')])[2]   1234 
    Input Text Custom    //input[@type='email' and @placeholder='admin@company.com']    Prajwal.s+0990@wealthmax.co.uk  
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]
Email field with valid email format
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2]
    Input Text Custom     (//input[contains(@placeholder,'Enter phone number')])[2]   9797111111 
    Input Text Custom    //input[@type='email' and @placeholder='admin@company.com']    Prajwal.s+0992@wealthmax.co.uk  
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]
Email field is left blank
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2]
    Input Text Custom     (//input[contains(@placeholder,'Enter phone number')])[2]   9797111111 
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]
Invalid email format
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2]
    Input Text Custom     (//input[contains(@placeholder,'Enter phone number')])[2]   9797111111 
    Input Text Custom    //input[@type='email' and @placeholder='admin@company.com']    admin@test  
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]   
Already registered email addresses
    Input Text Custom    (//*[contains(@placeholder, 'Enter first name')])[2]    Prajwal Pal
    Input Text Custom    (//*[contains(@placeholder, 'Enter last name')])[2]   singh
    Fill Adult DOB
    Click Element Custom     //*[contains(text(), 'Select nationality')] 
    Click Element Custom     (//*[contains(text(), 'United Kingdom')])[2]
    Input Text Custom     (//input[contains(@placeholder,'Enter phone number')])[2]   9797111111 
    Input Text Custom    //input[@type='email' and @placeholder='admin@company.com']    Prajwal.s+0992@wealthmax.co.uk
    Click Element Custom    (//*[contains(text(), 'Same as Company Details')])[2]
    Click Element Custom    //*[contains(text(), 'Yes')]
Licensed subscription type selection validation
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type=tel}     ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${Licensed_Selected}    10s
    Element Should Be Visible    ${Licensed_Selected}
Validate Subscription Selection Behavior
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type=tel}     ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${Licensed_Selected}    10s
    Element Should Be Visible    ${Licensed_Selected}
    ${free_trial_count}=    Get Element Count    ${Free_Trial_Selected}
    Should Be Equal As Integers    ${free_trial_count}    0
Validate User Credits With Valid Value
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type=tel}     ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${User_Credits1}    10s
    Input Text Custom    ${User_Credits1}    10
    Element Attribute Value Should Be    ${User_Credits1}    value    10
    Page Should Not Contain    The field UserCredits must be between 1 and 2147483647.
User Credits Mandatory Validation
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type=tel}     ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Input Text Custom    ${Subscription_Duration}    12
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    //*[contains(text(),'UserCredits')]    10s
    Element Should Be Visible    //*[contains(text(),'UserCredits')]
    Element Should Be Visible    ${User_Credits1}
Validate Decimal User Credits
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type=tel}     ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Input Text    ${User_Credits1}    10.5
    Input Text Custom    ${Subscription_Duration}    12
    ${entered_value}=    Get Element Attribute    ${User_Credits1}    value
    Log To Console    User Credits value before submission: ${entered_value}
    Click Element Custom    ${Send_Invitation}  
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'User Credits must be a whole number')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'User Credits must be a whole number')]
    Element Should Be Visible    ${User_Credits1}  
Validate Negative User Credits
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${User_Credits1}    10s
    Click Element    ${User_Credits1}
    Press Keys    ${User_Credits1}    CTRL+A
    Press Keys    ${User_Credits1}    BACKSPACE
    Input Text    ${User_Credits1}    -5
    ${entered_value}=    Get Element Attribute    ${User_Credits1}    value
    Log To Console    Entered negative value: -5
    Log To Console    Actual field value: ${entered_value}
    Should Be Equal As Strings    ${entered_value}    5    Negative User Credits value was not converted to the expected positive integer.
Validate Zero User Credits
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${User_Credits1}    10s
    Click Element    ${User_Credits1}
    Press Keys    ${User_Credits1}    CTRL+A
    Press Keys    ${User_Credits1}    BACKSPACE
    Input Text    ${User_Credits1}    0
    Input Text Custom    ${Subscription_Duration}    12
    ${entered_value}=    Get Element Attribute    ${User_Credits1}    value
    Log To Console    User Credits test value: ${entered_value}
    Element Attribute Value Should Be    ${User_Credits1}    value    0
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'UserCredits must be between 1 and 2147483647')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'UserCredits must be between 1 and 2147483647')]
    Element Should Be Visible    ${User_Credits1}
Validate Valid Subscription Duration
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${User_Credits1}    10s
    Input Text Custom    ${User_Credits1}    10
    Wait Until Element Is Visible    ${Subscription_Duration}    10s
    Input Text Custom    ${Subscription_Duration}    12
    Element Attribute Value Should Be    ${Subscription_Duration}    value    12
    Page Should Not Contain    The field Duration must be between 1 and 2147483647
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')] 
Validate Subscription Duration Mandatory Field
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${User_Credits1}    10s
    Input Text Custom    ${User_Credits1}    10
    Wait Until Element Is Visible    ${Subscription_Duration}    10s
    Clear Element Text    ${Subscription_Duration}
    ${duration_value}=    Get Element Attribute    ${Subscription_Duration}    value
    Should Be Empty    ${duration_value}    Subscription Duration field should be blank before submission.
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Duration must be between 1 and 2147483647')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Duration must be between 1 and 2147483647')]
    Element Should Be Visible    ${Subscription_Duration}       
Validate Zero Subscription Duration
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${User_Credits1}    10s
    Input Text Custom    ${User_Credits1}    10
    Wait Until Element Is Visible    ${Subscription_Duration}    10s
    Click Element    ${Subscription_Duration}
    Press Keys    ${Subscription_Duration}    CTRL+A
    Press Keys    ${Subscription_Duration}    BACKSPACE
    Input Text    ${Subscription_Duration}    0
    ${duration_value}=    Get Element Attribute    ${Subscription_Duration}    value
    Log To Console    Subscription Duration test value: ${duration_value}
    Element Attribute Value Should Be    ${Subscription_Duration}    value    0
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Duration must be between 1 and 2147483647')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Duration must be between 1 and 2147483647')]
    Element Should Be Visible    ${Subscription_Duration}
Validate Negative Subscription Duration
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${User_Credits1}    10s
    Input Text Custom    ${User_Credits1}    10
    Wait Until Element Is Visible    ${Subscription_Duration}    10s
    Click Element    ${Subscription_Duration}
    Press Keys    ${Subscription_Duration}    CTRL+A
    Press Keys    ${Subscription_Duration}    BACKSPACE
    Input Text    ${Subscription_Duration}    -12
    ${duration_value}=    Get Element Attribute    ${Subscription_Duration}    value
    Log To Console    Negative duration entered: -12
    Log To Console    Converted duration value: ${duration_value}
    Should Be Equal As Strings    ${duration_value}    12   Negative Subscription Duration was not converted to the expected positive value.
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]  
Validate Auto Renew Default State
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${Auto_Renew_Toggle}    10s
    Element Should Be Visible    ${Auto_Renew_Toggle}
    ${default_state}=    Get Element Attribute    ${Auto_Renew_Toggle}    aria-checked
    Log To Console    Auto Renew default state: ${default_state}
    Should Be Equal As Strings    ${default_state}    false    Auto Renew toggle should be OFF by default.
Validate User Can Enable Auto Renew
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Input Text Custom    ${User_Credits1}    10
    Input Text Custom    ${Subscription_Duration}    12
    Wait Until Element Is Visible    ${Auto_Renew_Toggle}    10s
    ${initial_state}=    Get Element Attribute    ${Auto_Renew_Toggle}    aria-checked
    Log To Console    Auto Renew initial state: ${initial_state}
    Should Be Equal As Strings    ${initial_state}    false    Auto Renew should be OFF before enabling it.
    Click Element Custom    ${Auto_Renew_Toggle}
    Wait Until Keyword Succeeds    5x    1s    Element Attribute Value Should Be    ${Auto_Renew_Toggle}    aria-checked    true
    ${enabled_state}=    Get Element Attribute    ${Auto_Renew_Toggle}    aria-checked
    Log To Console    Auto Renew enabled state: ${enabled_state}
    Should Be Equal As Strings    ${enabled_state}    true    Auto Renew was not enabled successfully.
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]    
Validate User Can Disable Auto Renew
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Input Text Custom    ${User_Credits1}    10
    Input Text Custom    ${Subscription_Duration}    12
    Wait Until Element Is Visible    ${Auto_Renew_Toggle}    10s
    ${initial_state}=    Get Element Attribute    ${Auto_Renew_Toggle}    aria-checked
    Log To Console    Auto Renew initial state: ${initial_state}
    Should Be Equal As Strings    ${initial_state}    false    Auto Renew should initially be OFF.
    # Turn Auto Renew ON
    Click Element Custom    ${Auto_Renew_Toggle}
    Wait Until Keyword Succeeds    5x    1s    Element Attribute Value Should Be    ${Auto_Renew_Toggle}    aria-checked    true
    ${enabled_state}=    Get Element Attribute    ${Auto_Renew_Toggle}    aria-checked
    Log To Console    Auto Renew enabled state: ${enabled_state}
    Should Be Equal As Strings    ${enabled_state}    true    Auto Renew could not be enabled before testing the OFF state.
    # Turn Auto Renew OFF
    Click Element Custom    ${Auto_Renew_Toggle}
    Wait Until Keyword Succeeds    5x    1s    Element Attribute Value Should Be    ${Auto_Renew_Toggle}    aria-checked    false
    ${disabled_state}=    Get Element Attribute    ${Auto_Renew_Toggle}    aria-checked
    Log To Console    Auto Renew disabled state: ${disabled_state}
    Should Be Equal As Strings    ${disabled_state}    false    Auto Renew was not disabled successfully.
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]    
Validate Invitation Is Sent Successfully
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${User_Credits1}    10s
    Input Text Custom    ${User_Credits1}    10
    Wait Until Element Is Visible    ${Subscription_Duration}    10s
    Input Text Custom    ${Subscription_Duration}    12
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]
    ${success_message}=    Get Text    xpath=//*[@role='status']
    Log To Console    Invitation response: ${success_message}
    Should Contain    ${success_message}    Licensed invite created    
Validate Mandatory Fields Block Invitation Submission
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2
    Click Element Custom    ${Licensed}
    Wait Until Element Is Visible    ${User_Credits1}    10s
    Wait Until Element Is Visible    ${Subscription_Duration}    10s
    Clear Element Text    ${User_Credits1}
    Clear Element Text    ${Subscription_Duration}
    ${credits_value}=    Get Element Attribute    ${User_Credits1}    value
    ${duration_value}=    Get Element Attribute    ${Subscription_Duration}    value
    Log To Console    User Credits value: ${credits_value}
    Log To Console    Subscription Duration value: ${duration_value}
    Should Be Empty    ${credits_value}    User Credits field should be blank before submission.
    Should Be Empty    ${duration_value}    Subscription Duration field should be blank before submission.
    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Validation failed')]    10s
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'UserCredits')]
    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Duration')]
    Element Should Be Visible    ${User_Credits1}
    Element Should Be Visible    ${Subscription_Duration}

Handle Outlook Post Login Pages
    Sleep    3s

    ${stay_signed_in_yes}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//input[@id='idSIButton9' and @type='submit']    10s

    IF    ${stay_signed_in_yes}
        Click Element    xpath=//input[@id='idSIButton9' and @type='submit']
    END    

Open Outlook Test Mailbox
    ${outlook_email}=    Get Environment Variable    OUTLOOK_EMAIL    ${EMPTY}
    ${outlook_password}=    Get Environment Variable    OUTLOOK_PASSWORD    ${EMPTY}

    Should Not Be Empty    ${outlook_email}    OUTLOOK_EMAIL environment variable is not configured.
    Should Not Be Empty    ${outlook_password}    OUTLOOK_PASSWORD environment variable is not configured.

    ${outlook_options}=    Create Outlook Chrome Options

    Open Browser    ${OUTLOOK_URL}    chrome    alias=${OUTLOOK_ALIAS}    options=${outlook_options}

    Maximize Browser Window


    ${email_page_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=i0116    20s

    IF    ${email_page_visible}
        Input Text    id=i0116    ${outlook_email}
        Press Keys    id=i0116    ENTER

        Wait Until Element Is Visible    id=i0118    20s
        Wait Until Element Is Enabled    id=i0118    20s

        Set Log Level    NONE
        Input Password    id=i0118    ${outlook_password}
        Set Log Level    INFO

        Press Keys    id=i0118    ENTER
    END

    Handle Outlook Post Login Pages

    Wait Until Element Is Visible    ${OUTLOOK_SEARCH}    60s
    Element Should Be Visible    ${OUTLOOK_SEARCH}

    Log To Console    Outlook mailbox opened successfully.


Send Licensed Tenant Invitation For Email Validation
    ${company_name2}    ${First_name2}    ${Last_name2}    ${type_tel}    ${company_email2}=    Generate Unique Tenants Data

    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company_name2}    2
    Fill Field By Placeholders    e.g. Steve    ${First_name2}    2
    Fill Field By Placeholders    e.g. Smith    ${Last_name2}    2

    Input Text    xpath=//input[@type='tel']    9797889977

    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${company_email2}    2

    Click Element Custom    ${Licensed}

    Wait Until Element Is Visible    ${User_Credits1}    10s
    Input Text Custom    ${User_Credits1}    10

    Wait Until Element Is Visible    ${Subscription_Duration}    10s
    Input Text Custom    ${Subscription_Duration}    12

    Click Element Custom    ${Send_Invitation}

    Wait Until Element Is Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]    15s

    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]

    Log To Console    Invitation sent successfully to: ${company_email2}

    RETURN    ${company_email2}


Search Invitation Email In Outlook
    [Arguments]    ${recipient_email}=${EMPTY}

    Wait Until Element Is Visible    ${OUTLOOK_SEARCH}    30s
    Wait Until Element Is Enabled    ${OUTLOOK_SEARCH}    30s

    Click Element    ${OUTLOOK_SEARCH}
    Press Keys    ${OUTLOOK_SEARCH}    CTRL+A
    Press Keys    ${OUTLOOK_SEARCH}    BACKSPACE

    IF    not $recipient_email
        ${search_query}=    Set Variable    ${INVITATION_SUBJECT}
        Press Keys    ${OUTLOOK_SEARCH}    ${search_query}
    ELSE
        Should Contain    ${recipient_email}    +    Generated invitation email should contain plus addressing.

        @{email_parts}=    Split String    ${recipient_email}    +    1
        ${email_prefix}=    Set Variable    ${email_parts}[0]
        ${email_suffix}=    Set Variable    ${email_parts}[1]

        Log To Console    Email prefix: ${email_prefix}
        Log To Console    Email suffix: ${email_suffix}

        Press Keys    ${OUTLOOK_SEARCH}    ${email_prefix}
        Press Keys    ${OUTLOOK_SEARCH}    SHIFT+=
        Press Keys    ${OUTLOOK_SEARCH}    ${email_suffix}

        ${search_query}=    Set Variable    ${recipient_email}
    END

    
    ${actual_search_value}=    Get Element Attribute    ${OUTLOOK_SEARCH}    value

    Log To Console    Expected Outlook search: ${search_query}
    Log To Console    Actual Outlook search: ${actual_search_value}

    Should Be Equal As Strings    ${actual_search_value}    ${search_query}    Outlook search did not retain the complete plus-addressed email.

    Press Keys    ${OUTLOOK_SEARCH}    ENTER

    Wait Until Page Contains    ${INVITATION_SUBJECT}    30s
    Page Should Contain    ${INVITATION_SUBJECT}

    Capture Page Screenshot    outlook-search-results.png

    Log To Console    WealthMax invitation email found successfully for: ${recipient_email}

Create Outlook Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Evaluate    $options.add_argument("--user-data-dir=C:/Automation/OutlookChromeProfile")
    Evaluate    $options.add_argument("--start-maximized")

    RETURN    ${options}

Open And Inspect WealthMax Invitation Email
    [Arguments]    ${recipient_email}

    # Locate and open the invitation email
    Wait Until Element Is Visible    ${INVITATION_EMAIL_RESULT}    30s
    Scroll Element Into View    ${INVITATION_EMAIL_RESULT}
    Click Element    ${INVITATION_EMAIL_RESULT}

    # Wait until the email content is opened
    Wait Until Page Contains    Complete Your Onboarding    30s

    # Verify the email subject
    Page Should Contain    ${INVITATION_SUBJECT}

    # Verify the recipient using a case-insensitive locator
    ${recipient_email_lower}=    Convert To Lower Case    ${recipient_email}

    ${recipient_locator}=    Set Variable    xpath=//*[contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'${recipient_email_lower}')]

    Wait Until Element Is Visible    ${recipient_locator}    30s
    Element Should Be Visible    ${recipient_locator}

    Log To Console    Invitation recipient validated successfully: ${recipient_email}

    # Verify the onboarding heading and greeting
    Page Should Contain    Complete Your Onboarding
    Page Should Contain    Hi Prajwal Pal

    # Verify the invitation description
    Page Should Contain    You have been invited to onboard onto the WealthMax platform.

    Page Should Contain    Click the button below to set your password and activate your account.

    # Verify the activation instructions
    Page Should Contain    Activate your account
    Page Should Contain    Set Your Password
    Page Should Contain    This link will expire

    # Verify the required onboarding steps
    Page Should Contain    Next Steps:
    Page Should Contain    Company Information and Documents
    Page Should Contain    Admin Details and Verification
    Page Should Contain    Conduct Check Declaration
    Page Should Contain    Submit your application for review.

    # Verify that a secure, non-empty password setup link exists.
    
    ${secure_onboarding_link}=    Set Variable    xpath=//a[starts-with(@href,'https://stg.crm.wealthmax.co.uk/set-password?token=') and string-length(substring-after(@href,'token=')) > 0]

    Wait Until Element Is Visible    ${secure_onboarding_link}    30s
    Element Should Be Visible    ${secure_onboarding_link}

    # Safe logging only
    Log To Console    Invitation email opened successfully.
    Log To Console    Invitation subject validated successfully.
    Log To Console    Invitation recipient validated successfully: ${recipient_email}
    Log To Console    Invitation onboarding details validated successfully.
    Log To Console    Secure password setup link validated successfully.  

Validate Cancel Button Closes Invitation Popup
    ${generated_company_name}    ${generated_first_name}    ${generated_last_name}    ${generated_mobile}    ${generated_email}=    Generate Unique Tenants Data

    # Verify the Invitation form is displayed
    Wait Until Element Is Visible    ${INVITE_COMPANY_NAME_FIELD}    15s
    Wait Until Element Is Visible    ${INVITATION_CANCEL_BUTTON}    15s

    # Enter sample data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${generated_company_name}    2

    Fill Field By Placeholders    e.g. Steve    ${generated_first_name}    2

    Fill Field By Placeholders    e.g. Smith    ${generated_last_name}    2

    Input Text    xpath=//input[@type='tel']    9797889977

    Fill Field By Placeholder    e.g. abc.def@gmail.com     ${generated_email}    2

    Log To Console    Sample invitation data entered for: ${generated_email}

    # Click Cancel without submitting
    Click Element Custom    ${INVITATION_CANCEL_BUTTON}

    # Verify the Invitation form is closed
    Wait Until Element Is Not Visible    ${INVITE_COMPANY_NAME_FIELD}    15s
    Page Should Not Contain Element    ${INVITE_COMPANY_NAME_FIELD}

    # Verify Send Invitation is no longer displayed
    Page Should Not Contain Element    ${Send_Invitation}

    # Verify the user returned to the previous screen
    Wait Until Page Contains    Create Tenant    15s
    Page Should Contain    Create Tenant

    # Verify that no invitation was created
    Page Should Not Contain    Licensed invite created

    Log To Console    Invitation popup closed successfully.
    Log To Console    No invitation was submitted or saved.
    Log To Console    User returned to the previous Create Tenant screen.

Validate X Icon Closes Invitation Popup
    ${generated_company_name}    ${generated_first_name}    ${generated_last_name}    ${generated_mobile}    ${generated_email}=    Generate Unique Tenants Data

    # Verify the Invitation form is displayed
    Wait Until Element Is Visible    ${INVITE_COMPANY_NAME_FIELD}    15s
    Wait Until Element Is Visible    ${INVITATION_CLOSE_ICON}    15s

    # Enter sample data
    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${generated_company_name}    2

    Fill Field By Placeholders    e.g. Steve    ${generated_first_name}    2

    Fill Field By Placeholders    e.g. Smith    ${generated_last_name}    2

    Input Text    xpath=//input[@type='tel']    9797889977

    Fill Field By Placeholder    e.g. abc.def@gmail.com     ${generated_email}    2

    Log To Console    Sample invitation data entered for: ${generated_email}

    # Close the popup using the X icon
    Scroll Element Into View    ${INVITATION_CLOSE_ICON}
    Click Element    ${INVITATION_CLOSE_ICON}

    # Verify the Invitation form is closed
    Wait Until Element Is Not Visible    ${INVITE_COMPANY_NAME_FIELD}    15s
    Page Should Not Contain Element    ${INVITE_COMPANY_NAME_FIELD}

    
    # Verify that the invitation submission controls are no longer displayed
    Page Should Not Contain Element    ${Send_Invitation}

    # Verify the user returned to the previous screen
    Wait Until Page Contains    Create Tenant    15s
    Page Should Contain    Create Tenant

    # Verify that no invitation was created
    Page Should Not Contain    Licensed invite created

    Log To Console    Invitation popup closed successfully using the X icon.
    Log To Console    No invitation was submitted or saved.
    Log To Console    User returned to the previous Create Tenant screen without errors.

Validate Data Retained After Email Error
    ${company}    ${first_name}    ${last_name}    ${mobile}    ${email}=    Generate Unique Tenants Data

    ${invalid_email}=    Set Variable    admin
    ${phone}=    Set Variable    9797889977

    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${company}    2
    Fill Field By Placeholders    e.g. Steve    ${first_name}    2
    Fill Field By Placeholders    e.g. Smith    ${last_name}    2
    Input Text    xpath=//input[@type='tel']    ${phone}
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${invalid_email}    2

    Click Element Custom    ${Licensed}
    Input Text Custom    ${User_Credits1}    10
    Input Text Custom    ${Subscription_Duration}    12

    Click Element Custom    ${Send_Invitation}

    Wait Until Page Contains    Please enter a valid email address.    10s
    Page Should Contain    Please enter a valid email address.

    Element Attribute Value Should Be    ${company_name2}    value    ${company}
    Element Attribute Value Should Be    ${First_name2}    value    ${first_name}
    Element Attribute Value Should Be    ${Last_name2}    value    ${last_name}
    ${actual_phone}=    Get Element Attribute    xpath=//input[@type='tel']    value
    ${actual_phone_without_spaces}=    Remove String    ${actual_phone}    ${SPACE}

    Should Be Equal As Strings    ${actual_phone_without_spaces}    ${phone}     Phone number was not retained correctly after the email validation error.

    Element Attribute Value Should Be    ${company_email2}    value    ${invalid_email}
    Element Attribute Value Should Be    ${User_Credits1}    value    10
    Element Attribute Value Should Be    ${Subscription_Duration}    value    12

    Element Should Be Visible    ${company_email2}
    Page Should Not Contain    Licensed invite created

    Log To Console    Email validation displayed successfully.
    Log To Console    Form submission was blocked successfully.
    Log To Console    Previously entered valid data was retained successfully.    

Validate Leading Spaces Are Trimmed
    ${timestamp}=    Evaluate    str(int(__import__('time').time()))
    ${expected_company}=    Set Variable    Test Company ${timestamp}
    ${input_company}=    Catenate    SEPARATOR=    ${SPACE}${SPACE}${SPACE}    ${expected_company}

    ${company}    ${first_name}    ${last_name}    ${mobile}    ${email}=    Generate Unique Tenants Data

    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${input_company}    2
    Fill Field By Placeholders    e.g. Steve    ${first_name}    2
    Fill Field By Placeholders    e.g. Smith    ${last_name}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${email}    2

    Click Element Custom    ${Licensed}
    Input Text Custom    ${User_Credits1}    10
    Input Text Custom    ${Subscription_Duration}    12

    Click Element Custom    ${Send_Invitation}

    Wait Until Element Is Visible     xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]     15s

    Element Should Be Visible    xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]

    Log To Console    Entered company name: [${input_company}]
    Log To Console    Expected stored company name: [${expected_company}]

    Log To Console    Invitation submitted successfully.   
    Wait Until Page Contains    ${expected_company}    20s

    ${stored_company}=    Get Text    xpath=//*[normalize-space()='${expected_company}']
    Should Be Equal As Strings    ${stored_company}     ${expected_company}     Company Name was not trimmed before being stored.
    Log To Console    Stored company name: [${stored_company}]
    Log To Console    Leading spaces were removed before storing the Company Name.

Validate Trailing Spaces Removed After Submission
    ${timestamp}=    Evaluate    str(int(__import__('time').time()))
    ${expected_company}=    Set Variable    Test Company ${timestamp}
    ${input_company}=    Catenate    SEPARATOR=    ${expected_company}    ${SPACE}${SPACE}${SPACE}

    ${company}    ${first_name}    ${last_name}    ${mobile}    ${email}=    Generate Unique Tenants Data

    Fill Field By Placeholders    e.g. Wealthmax Financial Advisers    ${input_company}    2
    Fill Field By Placeholders    e.g. Steve    ${first_name}    2
    Fill Field By Placeholders    e.g. Smith    ${last_name}    2
    Input Text    xpath=//input[@type='tel']    9797889977
    Fill Field By Placeholders    e.g. abc.def@gmail.com    ${email}    2

    Click Element Custom    ${Licensed}
    Input Text Custom    ${User_Credits1}    10
    Input Text Custom    ${Subscription_Duration}    12

    Click Element Custom    ${Send_Invitation}
    Wait Until Element Is Visible     xpath=//*[@role='status' and contains(normalize-space(.),'Licensed invite created')]     15s
    Log To Console    Entered company name: [${input_company}]
    Log To Console    Expected stored company name: [${expected_company}]
    Log To Console    Invitation submitted successfully.
    Wait Until Page Contains    ${expected_company}    20s
    ${stored_company}=    Get Text    xpath=(//*[normalize-space()='${expected_company}'])[1]
    Should Be Equal As Strings    ${stored_company}     ${expected_company}    Company Name trailing spaces were not removed before storage.
    Log To Console    Stored company name: [${stored_company}]
    Log To Console    Trailing spaces were removed before storing the Company Name.

Get Onboarding Link From Invitation Email
    ${onboarding_link}=    Set Variable    xpath=//a[contains(@href,'/set-password?token=')]

    Wait Until Element Is Visible    ${onboarding_link}    30s
    Element Should Be Visible    ${onboarding_link}

    Set Log Level    NONE

    ${onboarding_url}=    Get Element Attribute    ${onboarding_link}    href

    ${valid_link}=    Evaluate    $onboarding_url.startswith("https://stg.crm.wealthmax.co.uk/set-password?token=") and len($onboarding_url.split("token=", 1)[1]) > 0

    ${link_hash}=    Evaluate    __import__('hashlib').sha256($onboarding_url.encode()).hexdigest()

    Set Log Level    INFO

    Should Be True    ${valid_link}    Invitation email does not contain a valid secure onboarding link.

    Log To Console    Secure onboarding link validated successfully.

    RETURN    ${link_hash}

Search Second Invitation Email In Outlook
    [Arguments]    ${recipient_email}

    # Close the previous active Outlook search using the back arrow
    ${close_search_button}=    Set Variable    xpath=//*[@id='topSearchInput']/preceding::button[1]

    Wait Until Element Is Visible    ${close_search_button}    15s
    Click Element    ${close_search_button}

    # Wait until Outlook returns to the normal mailbox search state
    Wait Until Element Is Visible    ${OUTLOOK_SEARCH}    30s
    Wait Until Element Is Enabled    ${OUTLOOK_SEARCH}    30s

    Click Element    ${OUTLOOK_SEARCH}
    Press Keys    ${OUTLOOK_SEARCH}    CTRL+A
    Press Keys    ${OUTLOOK_SEARCH}    BACKSPACE

    Wait Until Keyword Succeeds    5x   1s    Element Attribute Value Should Be   ${OUTLOOK_SEARCH}    value    ${EMPTY}

    # Enter the second plus-addressed email
    @{email_parts}=    Split String    ${recipient_email}    +    1
    ${email_prefix}=    Set Variable    ${email_parts}[0]
    ${email_suffix}=    Set Variable    ${email_parts}[1]

    Press Keys    ${OUTLOOK_SEARCH}    ${email_prefix}
    Press Keys    ${OUTLOOK_SEARCH}    SHIFT+=
    Press Keys    ${OUTLOOK_SEARCH}    ${email_suffix}

    ${actual_search}=    Get Element Attribute   ${OUTLOOK_SEARCH}    value

    Log To Console    Expected second Outlook search: ${recipient_email}
    Log To Console    Actual second Outlook search: ${actual_search}

    Should Be Equal As Strings    ${actual_search}    ${recipient_email}    Outlook search did not retain the complete second recipient email.

    Press Keys    ${OUTLOOK_SEARCH}    ENTER

    Wait Until Page Contains    ${INVITATION_SUBJECT}    30s
    Page Should Contain    ${INVITATION_SUBJECT}

    Log To Console    Second invitation email found for: ${recipient_email}    