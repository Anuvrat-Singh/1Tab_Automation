*** Variables ***

${fileUpload_Button}  xpath=//input[@name="mainFile"]
${userNotes_Textarea}  xpath=//textarea[@name="user_notes"]
${next_Button}  xpath=//button[@class="btn tab_btn_default w-50"]
${firstOption_Label}  xpath=(//label[@class="tab_checkbox"])[1]
${confirm_Button}  xpath=//button[@class="btn tab_btn_default w-100"]

#Address Part
${UP_addNewAddress_Button}  xpath=//button[contains(text(),"Add New Address")]
${UP_customer_Name}  xpath=//input[@id="name"]
${UP_customer_Mobile}  xpath=//input[@id="mobile"]
${UP_address_Line1}  xpath=//input[@id="address1"]
${UP_address_Line2}  xpath=//input[@id="address2"]
${UP_customer_Landmark}  xpath=//input[@id="landmark"]
${UP_customer_City}  xpath=//input[@id="city"]
${UP_customer_State}  xpath=//input[@id="state"]
${UP_customer_Pincode}  xpath=//input[@id="pincode"]
${UP_address_Selector_Office}  xpath=//b[text()="Office"]
${UP_save_Address_Button}  xpath=(//button[@class="btn tab_btn_default w-25"])[1]
${UP_select_First_Address}  xpath=//span[@class="tab_checkmark"]
${UP_addressConfirm_Button}  xpath=//button[text()="Confirm"]

#Thank You Page
${UP_thankYou_Message}  xpath=//h2[text()="THANK YOU"]

*** Keywords ***
User adds a new address via upload prescription
    Set Selenium Implicit Wait  10 seconds
    Wait Until Element Is Enabled  ${UP_addNewAddress_Button}
    Click Element  ${UP_addNewAddress_Button}

    ${max_rows}=  get_row_count  ${testData_Path}  Address
    ${max_cols}=  get_column_count  ${testData_Path}  Address
#    ${type_string}=  read_data_from_excel  ${testData_Path}  Address  ${0}  ${7}
#    Log  ${type_string}
    : For   ${row_num}    IN RANGE    0   ${max_rows}
    \   ${UP_name}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${0}
    \    Input Text  ${UP_customer_Name}  ${UP_name}  clear = True
    \   ${UP_mobile}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${1}
    \    Input Text  ${UP_customer_Mobile}  ${UP_mobile}  clear=True
    \   ${UP_address1}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${2}
    \    Input Text  ${UP_address_Line1}  ${UP_address1}  clear=True
    \   ${UP_address2}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${3}
    \    Input Text  ${UP_address_Line2}  ${UP_address2}  clear=True
    \   ${UP_landmark}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${4}
    \    Input Text  ${UP_customer_Landmark}  ${UP_landmark}  clear=True
    \   ${UP_city}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${5}
    \    Input Text  ${UP_customer_City}  ${UP_city}  clear=True
    \   ${UP_state}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${6}
    \    Input Text  ${UP_customer_State}  ${UP_state}  clear=True
    \   ${UP_pincode}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${7}
    \   ${UP_pincode}=  Convert To String  ${UP_pincode}
    \    Input Text  ${UP_customer_Pincode}  ${UP_pincode}  clear=True
    \    Click Element  ${UP_address_Selector_Office}
    \    Wait Until Element Is Enabled  ${UP_save_Address_Button}
    \    Click Button  ${UP_save_Address_Button}
#    Sleep  2s
    Wait Until Element Is Enabled  ${UP_select_First_Address}
    Click Element  ${UP_select_First_Address}
#    Sleep  2s
    Click Element  ${UP_addressConfirm_Button}

Place Order Via Upload Prescription Flow
#    Wait Until Page Contains Element  ${uploadPrescription_Button}
    Click Element  ${uploadPrescriptionHeader_Button}
    Wait Until Element Is Enabled  ${fileUpload_Button}
    Choose File  ${fileUpload_Button}  ${prescriptionPDF_Path}
    Input Text  ${userNotes_Textarea}  This is a sample input text
    Click Element  ${next_Button}
    Wait Until Element is Enabled  ${firstOption_Label}
    Click Element  ${firstOption_Label}
    Click Element  ${confirm_Button}
    User adds a new address via upload prescription