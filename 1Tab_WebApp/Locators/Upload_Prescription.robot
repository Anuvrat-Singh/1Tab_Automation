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