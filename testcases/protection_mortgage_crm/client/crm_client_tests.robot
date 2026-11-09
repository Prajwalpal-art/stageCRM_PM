*** Settings ***
Resource    ../../../keywords/protection_mortgage_crm/client/crm_client_keywords.robot

*** Test Cases ***
CRM_CL_001 - Client smoke placeholder
    Login to stage_CRM
    Sleep    2s
    Create Client1
    Close All Browsers      
