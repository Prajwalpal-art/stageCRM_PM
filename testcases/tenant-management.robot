*** Settings ***
Resource    ../keywords/kw1.robot
Resource    ../keywords/kw2.robot

*** Test Cases ***
Verify Admin Able To Upload Tenant Documents
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/lenovo/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/cyprus-1302383_1920.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input.pdf
    Upload Tenant Document    IDD    ${tenant_docs_dir}/input.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input.pdf
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element Custom    (//*[contains(text(), 'Save & Next')])
    Sleep    6s
    Create Tenant2
    Run Conduct Check
    ${tenant_docs}=     Set Variable    C:/Users/lenovo/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs}/input.pdf
    Upload Multiple Documents    Proof of Address    ${tenant_docs}/input.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Sleep    20s
    log out
Verify That Tenant Is Able To Create With Invite Method
    login to stageCRM
    Invite Tenant Creation
    Create Invite Tenant Licenced 1
    Sleep    10s
    log out
Verify That tenant Is Able To Create With Invite Method With Free Trial
    login to stageCRM
    Invite Tenant Creation
    Create Invite Tenant Licenced 2
    Sleep    10s
    log out 
User Able To Create Both Free Trial And Licensed Tenants
    login to stageCRM
    Invite Tenant Creation
    Create Invite Tenant Licenced 1
    Sleep    3s
    Invite Tenant Creation
    Create Invite Tenant Licenced 2
    Sleep    3s
    log out       
Whole Tenant Creation Flow Including Manual Creation And Invite Creation
    login to stageCRM
    Create Tenant
    ${tenant_docs_dir}=    Set Variable    C:/Users/lenovo/Downloads
    Upload Tenant Document    Company Logo    ${tenant_docs_dir}/cyprus-1302383_1920.jpg
    Upload Tenant Document    Privacy Policy Document    ${tenant_docs_dir}/input.pdf
    Upload Tenant Document    Letter Head    ${tenant_docs_dir}/input.pdf
    Upload Tenant Document    IDD    ${tenant_docs_dir}/input.pdf
    Upload Tenant Document    Invoice    ${tenant_docs_dir}/input.pdf
    Scroll Down    0    500
    Wait Until Element Is Enabled    xpath=//*[contains(text(), 'Save & Next')]    timeout=15s
    Click Element Custom    //app-button-reusable//button[.//span[normalize-space()='Save & Next']]
    Sleep    6s
    Create Tenant2
    Sleep    3s
    Run Conduct Check
    ${tenant_docs}=     Set Variable    C:/Users/lenovo/Downloads
    Upload Multiple Documents    Identity (ID)    ${tenant_docs}/input.pdf
    Sleep    2s
    Upload Multiple Documents    Proof of Address    ${tenant_docs}/input.pdf
    Click Element Custom    //*[contains(text(), 'Save & Next')]
    Tenant credits
    Sleep    3s
    Invite Tenant Creation
    Create Invite Tenant Licenced 1
    Sleep    3s
    Invite Tenant Creation
    Create Invite Tenant Licenced 2
    Sleep    3s
    log out
