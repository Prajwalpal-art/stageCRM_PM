*** Settings ***
Resource    ../keywords/kw1.robot
Resource    ../keywords/kw2.robot
Test Teardown    Close All Browsers

*** Test Cases ***
Verify Admin Able To Create Manual Tenant
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Create Tenant2
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Sleep    2000s
    Tenant credits
    Close All Browsers
    
Verify That Tenant Is Able To Create With Invite Method Licensed Type
    login to stageCRM
    Invite Tenant Creation
    Create Invite Tenant Licenced 1
    Sleep    10s
    log out
    Sleep    3s
    Close All Browsers
Verify That tenant Is Able To Create With Invite Method With Free Trial
    login to stageCRM
    Invite Tenant Creation
    Create Invite Tenant Licenced 2
    Sleep    10s
    log out 
    Sleep    3s
    Close All Browsers
User Able To Create Both Free Trial And Licensed Tenants
    login to stageCRM
    Invite Tenant Creation
    Create Invite Tenant Licenced 1
    Sleep    3s
    Invite Tenant Creation
    Create Invite Tenant Licenced 2
    Sleep    3s
    log out 
    Sleep    3s
    Close All Browsers      
Whole Tenant Creation Flow Including Manual Creation And Invite Creation
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element Custom    //app-button-reusable//button[.//span[normalize-space()='Save & Next']]
    Create Tenant2
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Invite Tenant Creation
    Create Invite Tenant Licenced 1
    Invite Tenant Creation
    Create Invite Tenant Licenced 2
    log out
    Close All Browsers    
Verify Company Name Accepts Valid Input
    login to stageCRM
    Vaild Company Name    
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Create Tenant2
    Run Conduct Check
    
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers
Verify Company Name cannot be left blank
    login to stageCRM
    Blank Company Name    
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Create Tenant2
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers
Verify that the Email field is mandatory and appropriate validation is displayed when no value is entered.
    login to stageCRM
    Email Mandatory Field Validation
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Create Tenant2
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers
verify the maximum character limit for the Company Name field
    login to stageCRM
    Company Name Maximum Length Validation
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
     Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Create Tenant2
 verify that the First Name field accepts valid alphabetic characters
    login to stageCRM
    First Name Valid Entry
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Create Tenant Company In formantion
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers    
Verify that the First Name field is mandatory
    login to stageCRM
    First Name Valid Entry
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    First Name Mandatory Field Validation
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
Verify that the Company Name field accepts permitted special characters
    login to stageCRM
    Company Name Special Characters Validation
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Create Tenant Company In formantion
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers
Verify that numeric characters are not allowed in the First Name field
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    First Name Numeric Character Validation
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers 
Verify that the Last Name field is mandatory
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Last Name Mandatory Field Validation
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers    
Verify that a valid mobile number with the India country code is accepted   
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Mobile Valid Entry
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers
Verify Mobile Number Mandatory Validation in Licensed Tenant Creation
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Mobile Number field left blank  
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]  
Verify Invalid Mobile Number Format Validation in Licensed Tenant Creation    
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Incorrect Mobile Number format
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
Verify Valid Email Format Acceptance in Licensed Tenant Creation
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Email field with valid email format
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers
Verify Email Mandatory Validation in Licensed Tenant Creation
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf   
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Email field is left blank
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')] 
Verify Invalid Email Format Validation in Licensed Tenant Creation
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf    
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Invalid email format
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
Verify Duplicate Email Validation in Licensed Tenant Creation
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document     Duty of Care Leaflet     ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Terms of Business    ${tenant_docs_dir}/input (1).pdf.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input (1).pdf.pdf
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element    (//*[contains(text(), 'Save & Next')])
    Already registered email addresses
    Run Conduct Check
    ${tenant_docs_dir}=     Set Variable    C:/Users/PRAJWAL SINGH/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs_dir}/bikes-5972672_1920.jpg.jpg
    Upload Multiple Documents    Proof of Address    ${tenant_docs_dir}/input (1).pdf.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Close All Browsers
