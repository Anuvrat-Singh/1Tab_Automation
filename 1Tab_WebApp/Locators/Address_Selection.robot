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
