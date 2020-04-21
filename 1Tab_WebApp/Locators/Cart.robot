*** Variables ***

#Products
${inc_Quantity}  xpath=(//i[@class="fa fa-plus"])[1]

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
${closePrescriptionUpload_Form}  xpath=(//button[@class="close"]/span)[1]
