*** Variables ***
#Address-Selector-Section
${add_New_Address_Button}  xpath=//*[contains(text(),"Add New Address")]

#Add-Edit-Address-Form
${customer_Name}  xpath=//input[@id="name"]
${customer_Mobile}  xpath=//input[@id="mobile"]
${address_Line1}  xpath=//input[@id="address1"]
${address_Line2}  xpath=//input[@id="address2"]
${customer_Landmark}  xpath=//input[@id="landmark"]
${customer_City}  xpath=//input[@id="city"]
${customer_State}  xpath=//input[@id="state"]
${customer_Pincode}  xpath=//input[@id="pincode"]
${address_Selector_Home}  xpath=//label[@class="tab_checkbox"]/p/b[text()="Home"]
${save_Address_Button}  xpath=//button[@class="btn tab_btn_default w-50"]
${clear_Button}  xpath=//button[@class="btn tab_btn_link ml-2"]
${select_First_Address}  xpath=(//span[@class="tab_checkmark"])[1]
${make_Payment_Button}  xpath=//button[@class="btn tab_btn_default w-100 mt-3 ng-star-inserted"]

*** Keywords ***
User adds a new address
    Wait Until Page Contains Element  ${add_New_Address_Button}
    Click Element  ${add_New_Address_Button}

    ${max_rows}=  get_row_count  ${testData_Path}  Address
    ${max_cols}=  get_column_count  ${testData_Path}  Address
#    ${type_string}=  read_data_from_excel  ${testData_Path}  Address  ${0}  ${7}
#    Log  ${type_string}
    : For   ${row_num}    IN RANGE    0   ${max_rows}
    \   ${name}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${0}
    \    Input Text  ${customer_Name}  ${name}  clear = True
    \   ${mobile}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${1}
    \    Input Text  ${customer_Mobile}  ${mobile}  clear=True
    \   ${address1}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${2}
    \    Input Text  ${address_Line1}  ${address1}  clear=True
    \   ${address2}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${3}
    \    Input Text  ${address_Line2}  ${address2}  clear=True
    \   ${landmark}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${4}
    \    Input Text  ${customer_Landmark}  ${landmark}  clear=True
    \   ${city}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${5}
    \    Input Text  ${customer_City}  ${city}  clear=True
    \   ${state}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${6}
    \    Input Text  ${customer_State}  ${state}  clear=True
    \   ${pincode}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${7}
    \   ${pincode}=  Convert To String  ${pincode}
    \    Input Text  ${customer_Pincode}  ${pincode}  clear=True
    \    Click Element  ${address_Selector_Home}
    \    Click Button  ${save_Address_Button}
#    \    Click Element  ${clear_Button}

    Set Selenium Implicit Wait  10 seconds
    Wait Until Element Is Enabled  ${select_First_Address}
    Click Element  ${select_First_Address}
    Click Button  ${make_Payment_Button}

