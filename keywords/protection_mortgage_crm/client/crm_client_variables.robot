*** Variables ***
${CRM_CL_NAME_LOCATOR}     id:REPLACE_WITH_CLIENT_NAME_FIELD_ID
${CRM_CL_EMAIL_LOCATOR}    id:REPLACE_WITH_CLIENT_EMAIL_FIELD_ID
${CRM_CL_SAVE_LOCATOR}     id:REPLACE_WITH_CLIENT_SAVE_BUTTON_ID
${Client}    //li[contains(@class,'justify-center')]//a[@href='/clients' and .//span[normalize-space()='Clients']]
${Create_Client}    //app-button-reusable[@variant='primary']//button[@type='button' and .//span[normalize-space()='Create Client']]
${Title_Dropdown}    //*[normalize-space()='Title' or normalize-space()='Title *']/following::button[1]
${First_Name}    //*[contains(normalize-space(),'First Name')]/following::input[1]
${Middle_Name}    //*[normalize-space()='Middle Name']/following::input[1]
${Last_Name}    //*[contains(normalize-space(),'Last Name')]/following::input[1]
${Email}    //*[contains(normalize-space(),'Email')]/following::input[1]
${Mobile_Number}    //*[contains(normalize-space(),'Mobile Number')]/following::input[1]
${Product_Intrested}    //*[contains(normalize-space(),'Product Interested')]/following::button[1]
${Client_Source}    (//button[.//*[normalize-space()='Select']])[3]
${Create}    //button[normalize-space()='Create']
${Cancel}    //button[normalize-space()='Cancel']