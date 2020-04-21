*** Variables ***

#Random Page Elements
${company_Info}  xpath=//*[text()='We Know Your Value']
${signIn_Link}  xpath=(//div[@class="p-1 tab_options_btns ng-tns-c8-0 ng-star-inserted"])[1]

#Upload Prescription Header
${uploadPrescriptionHeader_Button}  xpath=//button[@class="btn tab_btn_default m-auto"]
${Logout}  xpath=//div[@class="p-1 tab_options_btns ng-tns-c8-0 ng-star-inserted"][1]

#Products
${dabur_Sitopladi}  xpath=//div[@title="Dabur Sitopaladi Churna"]
${sitopladi_AddToCart}  xpath=(//div[@title="Dabur Sitopaladi Churna"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[1]
${kasamrit_AddToCart}  xpath=(//div[@title="Baidyanath Kasamrit Syrup"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[1]
${honitus_AddToCart}  xpath=(//div[@title="Dabur Honitus Cough Syrup (Free Honitus Sip)"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[1]
${nityamChurn_AddToCart}  xpath=(//div[@title="Zandu Nityam Churn"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[1]
${cyclopam_AddToCart}  xpath=(//div[@title="Cyclopam Suspension"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[1]
${cart_Icon}  xpath=(//i[@class="fa fa-shopping-cart" and @tabindex="0"])[1]
