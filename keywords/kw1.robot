*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process
Library    ImapLibrary

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
${first_Name_Xpath}    xpath=//input[@placeholder='e.g. Steve']
${last_Name_Xpath}     xpath=//input[@placeholder='e.g. Smith']
${First_Name}    Prajwal Pal
${Last_Name}    Singh
${User_Email_Xpath}    xpath=//input[@placeholder="e.g. abc.def@company.com"]
${User_Email}    prajwal.s+000@wealthmax.co.uk
${User_phonenumber_xpath}    xpath=//input[@placeholder="Enter mobile number"]
${User_phonenumber}    1111111116
${Role_Select_BUtton_Xpath}    //*[contains(text(), 'Select Role')]
${General_Management_Role_Xpath}    //*[contains(@class,'block') and contains(.,'General Management')]
${Create_Xpath}    (//*[contains(text(), 'Create')])[4]
${General_Management}     (//button[contains(text(), 'General Manager')])
${Onboarding_Button}    (//button[contains(text(), 'Onboarding')])
${Search_Button}    //input[@placeholder='Search']
${Role_Dropdown_Xpath}    (//*[contains(@class,'f-12') and contains(@class,'truncate')])[1]
${Status_Dropdown_Xpath}    (//*[contains(@class,'f-12') and contains(@class,'truncate')])[2]
${Active_Option_Xpath}    (//button[contains(text(), 'Active')])
${Inactive_Option_Xpath}    (//button[contains(text(), 'Inactive')])
${Date_Xpath}    //*[contains(text(), 'dd-mm-yyyy - dd-mm-yyyy')]
${From_Date_Xpath}    (//input[@placeholder='01-04-2026'])[1]
${To_Date_Xpath}    (//input[@placeholder='01-05-2026'])[2]
${Document_Type_Dropdown}    //*[contains(text(), 'Select Document type')]
${Document_File_Input}    xpath=//input[@type='file']
${Upload_Area}    xpath=//*[contains(normalize-space(.), 'Click or Drag') or contains(normalize-space(.), 'Click or drag')][1]
${Upload_Document_Button}    xpath=//button[contains(text(), 'Upload Document')]
${Tenant_Management}    //*[contains(text(), 'Tenant Management')]
${Create_Tenant}    //*[contains(text(), 'Create Tenant')]
${Manual_Tenant_Creation}    //*[contains(text(), 'Fill the complete tenant profile on behalf of the tenant')]
${Run_Conduct_Check_Button}    xpath=//button[contains(text(), 'Run Conduct Check')]
${Document_Type_Select}    xpath=//button[contains(text(), 'Select Document type')]
${Document_Upload_Input}    xpath=//input[@type='file']
${Upload_Button}    xpath=//button[contains(text(), 'Upload Document')]
${Continue_With_Manual}    //*[contains(text(), ' Continue with Manual')]
${Enter_Company_Name}    (//*[contains(@placeholder, 'Enter company name')])[2]
# ${Company_Name}    Prajwal2
${Company_Title}    (//*[contains(@placeholder,'e.g. Ltd, PLC')])[2]
${Company_Number}    (//*[contains(@placeholder, 'e.g. 12345678')])[2]
${Registration_Number}    (//*[contains(@placeholder, 'e.g. 123456')])[2]
${Tenant_Website}    (//*[contains(@placeholder, 'https://yourcompany.com')])[2]
${Company_Mobile_Number}    (//*[contains(@placeholder, '00 0000 0000')])[2]
${Company_Email}    (//*[contains(@placeholder, 'info@company.com')])[2]
${Complaince_Email}    (//*[contains(@placeholder, 'compliance@company.com')])[2]
${Postal_Code}    (//*[contains(@placeholder, 'e.g. SW1A 1AA')])[2]


${Start_Date_Button}    xpath=(//button[normalize-space()='1'])[1]
${End_Date_Button}      xpath=(//button[normalize-space()='1'])[2]


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
Select Date Range
    Click Element Custom    ${Date_Xpath}
    Wait Until Element Is Visible    ${Start_Date_Button}    timeout=15s
    Click Element Custom    ${Start_Date_Button}
    Click Element Custom    ${End_Date_Button}
login to stageCRM
    Open Browser    https://stg.superadmin.wealthmax.co.uk/login   chrome
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
    # Sleep    5s  
log out
    Click Element Custom    ${Profile_Button} 
    Click Element Custom    ${Logout_Button}
View Profile
    Click Element Custom    ${Profile_Button}
    Click Element Custom    ${View_Profile}
    Scroll Down    0    200
    # Sleep    5s
Create User Management
    Click Element Custom    ${User_Management}
    Click Element Custom    ${Create_User_Button}
    Input Text Custom    ${first_Name_Xpath}    ${First_Name}
    Input Text Custom    ${last_Name_Xpath}    ${Last_Name}
    # Sleep    5s 
    Input Text Custom    ${User_Email_Xpath}    ${User_Email}
    Input Text Custom    ${User_phonenumber_xpath}    ${User_phonenumber}
    Click Element Custom    ${Role_Select_BUtton_Xpath}
    Click Element Custom    ${General_Management}
    Click Element Custom    ${Create_Xpath}

# Read Password From Email
#     Read Password From Email
#     Open Mailbox    host=${IMAP_HOST}    user=${IMAP_USER}    password=${IMAP_PASS}    port=${IMAP_PORT}    ssl=True
#     Select Folder    ${MAILBOX}
#     ${uids}=    Search Messages    SUBJECT "${SUBJECT}"
#     Should Not Be Empty    ${uids}
#     ${message}=    Get Message    ${uids}[-1]
#     ${body}=    Get Body Text    ${message}
#     Log    ${body}
#     Close Mailbox
Search User
    Click Element Custom    ${User_Management}
    Input Text Custom    ${Search_Button}    ${First_Name}
    Sleep    5s
    Click Element Custom    ${Role_Dropdown_Xpath}
    Click Element Custom    ${Onboarding_Button}
    Click Element Custom    ${Status_Dropdown_Xpath}
    Click Element Custom    ${Active_Option_Xpath}
    Select Date Range    
View User Deatails
    Click Element Custom    ${User_Management}
    Sleep    5s
    Scroll Down    0    200
    # Sleep    100s
    Click Element Custom    (//*[contains(@class, 'relative inline-block')])[5]
    Click Element Custom    //*[contains(text(), 'View Details')]
    Click Element Custom    //*[contains(text(), 'Update Profile')]
    
Export User Deatails
    Click Element Custom    ${User_Management}
    Sleep    5s   
    Click Element Custom    (//*[contains(@type, 'checkbox')])[3]
    Click Element Custom    //*[contains(text(), 'Export')] 

Get Default Download Directory
    ${userprofile}=    Get Environment Variable    USERPROFILE
    ${download_dir}=    Join Path    ${userprofile}    Downloads
    [Return]    ${download_dir}

Wait For Downloaded XLS File
    [Arguments]    ${filename}    ${timeout}=60s
    ${download_dir}=    Get Default Download Directory
    ${file_path}=    Join Path    ${download_dir}    ${filename}
    Wait Until Keyword Succeeds    ${timeout}    5s    File Should Exist    ${file_path}
    [Return]    ${file_path}

Open Downloaded XLS File
    [Arguments]    ${filename}
    ${file_path}=    Wait For Downloaded XLS File    ${filename}
    Start Process    explorer.exe    ${file_path}

