*** Variables ***

#Products
${inc_Quantity}  xpath=(//button[@class="btn tab_btn_plus"])[1]

#Coupons
${firstOrder_Coupon}  xpath=(//span[@class="tab_checkmark"])[1]
${coupon_Success}  xpath=//p[@class="tab_green_text"]
${coupon_Failure}  xpath=//p[@class="red-text"]

#Order-Summary-Section
${checkout_Button}  xpath=//button[@class="btn tab_btn_default w-100 mt-3 ng-star-inserted"]
${uploadPrescriptionCart_Button}  xpath=(//button[@class="btn tab_btn_default w-100 mt-3 ng-star-inserted"])[2]
${fileUpload_Form}  xpath=//form[@class="ng-untouched ng-pristine ng-invalid ng-star-inserted"]
${fileUpload_Selector}  xpath=//input[@id="file-input"]
${prescriptionSubmit_Button}  xpath=//button[@class="btn tab_btn_default w-25"]
${thankYou_Message}  xpath=//h2[text()="THANK YOU"]
${closePrescriptionUpload_Form}  xpath=(//button[@class="close"]/span)[1]
${available_Prescriptions}  xpath=//div[@class="d-flex tab_cart_prescription"]

*** Keywords ***
User applies 1TAB coupon on cart page
    Wait Until Page Contains Element  ${firstOrder_Coupon}
    User Increases Product Quantity
    Wait Until Element Is Enabled  ${firstOrder_Coupon}
    Click Element  ${firstOrder_Coupon}
    Wait Until Element Is Enabled  ${firstOrder_Coupon}
    Page Should Contain Element  ${coupon_Failure}

User uploads a prescription in cart
    Click Element  ${uploadPrescriptionCart_Button}
    Wait Until Page Contains Element  ${fileUpload_Form}
    Wait Until Element Is Enabled  ${fileUpload_Selector}
    Choose File  ${fileUpload_Selector}  ${prescriptionJPG_Path}
    Click Element  ${prescriptionSubmit_Button}
    Wait Until Element Is Visible  ${thankYou_Message}
    Click Element  ${closePrescriptionUpload_Form}
    Wait Until Page Contains Element  ${available_Prescriptions}

User clicks on checkout from cart page
    Click Element  ${checkout_Button}

User Increases Product Quantity
    : For   ${i}    IN RANGE    1   3
    \   Wait Until Element Is Enabled  ${inc_Quantity}
    \   Click Button  ${inc_Quantity}
