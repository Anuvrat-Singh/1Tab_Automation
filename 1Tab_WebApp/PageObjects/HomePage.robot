*** Settings ***
Resource  ../Keywords/Keywords.robot
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
${elem}  xpath=(//div/div/button[@class='btn btn-primary mr-1'])
${i}
${searchBar}  xpath=//input[@formcontrolname="search"]
${search_Dropdown}  xpath=//div[@class="tab_dropdown_content p-0 ng-tns-c8-0 ng-star-inserted"]
${searchResult_MatchingString}  xpath=//div[@class="d-flex w-100"]/div[contains(text(),'Boro Plus')]
${search_NoResults}  xpath=//p[text()="No Results Found"]

*** Keywords ***
User adds product to cart from homepage
    : For   ${i}   In Range    17   27
    \   ${res}=  catenate    SEPARATOR=   ${elem}     [${i}]
    \   Log to console  ${res}
    \   ${flag}  run keyword and return status  Element should be visible  ${res}
    \   Run keyword if  '${flag}'=='True'   Click element  ${res}

User Logsout
    Click Element  ${Logout}

User searches an item
    Set Selenium speed  0.5 seconds
    Input text  ${searchBar}  Anuvrat
    Wait Until Element Is Visible  ${search_Dropdown}
    ${flag}  Run Keyword And Return Status  Element Should Be Visible  ${searchResult_MatchingString}
    Run Keyword If  '${flag}'=='True'   Click Element  ${searchResult_MatchingString}
    ...  ELSE  Element Should Be Visible  ${search_NoResults}