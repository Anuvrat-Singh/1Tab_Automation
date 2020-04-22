*** Variables ***

#Random Page Elements
${company_Info}  xpath=//*[text()='We Know Your Value']
${signIn_Link}  xpath=(//div[@class="p-1 tab_options_btns ng-tns-c8-0 ng-star-inserted"])[1]

#Upload Prescription Header
${uploadPrescriptionHeader_Button}  xpath=//button[@class="btn tab_btn_default m-auto"]
${Logout}  xpath=//div[@class="p-1 tab_options_btns ng-tns-c8-0 ng-star-inserted"][1]

#Products
${boroPuls_19ml}  xpath=//div[@title="Boro Plus Antiseptic Cream-19 Ml"]
${oilatum_AddToCart}  xpath=(//div[@title="Oilatum 100gm Soap"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[1]
${boroPuls_40ml_AddToCart}  xpath=(//div[@title="Boro Plus Antiseptic Cream-40 Ml"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[1]
${viccoTurmeric_AddToCart}  xpath=(//div[@title="Vicco Turmeric Skin Cream"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[1]
${fair&Handsome_AddToCart}  xpath=(//div[@title="Fair And Handsome Instant Fairness Face Wash (Free Cream)"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[1]
${dermi5_AddToCart}  xpath=(//div[@title="Dermi-5 Cream"]/following-sibling::div[4]/div/button[@class='btn btn-primary mr-1'])[3]
${cart_Icon}  xpath=(//i[@class="fa fa-shopping-cart" and @tabindex="0"])[1]


*** Keywords ***
User adds product to cart from homepage
    Set Selenium Speed  0.5 seconds
    Wait Until Page Contains Element  ${boroPuls_19ml}
    Click Element  ${viccoTurmeric_AddToCart}
    Click Element  ${oilatum_AddToCart}
#    Click Element  ${boroPuls_40ml_AddToCart}
    Click Element  ${dermi5_AddToCart}
    Click Element  ${fair&Handsome_AddToCart}

User Logsout
    Click Element  ${Logout}