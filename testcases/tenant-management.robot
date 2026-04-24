*** Settings ***
Resource    ../keywords/kw1.robot
Resource    ../keywords/kw2.robot

*** Test Cases ***
Verify Admin Able To Upload Tenant Documents
    login to stageCRM
    # Sleep   20s
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
    # Sleep     5s
    # ${tenant_docs}=     Set Variable    C:/Users/lenovo/Downloads
    # Upload Multiple Documents    Identity (ID)    ${tenant_docs}/input.pdf
    # Upload Multiple Documents    Address Proof    ${tenant_docs}/input.pdf
    log out
