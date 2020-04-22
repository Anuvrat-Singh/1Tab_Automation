*** Variables ***
#Payment-Method-Selector

${cod}  xpath=//a[@data-target="#codPayment"]
${make_Payment_Button}  xpath=//button[@class="btn tab_btn_default w-100 mt-3 ng-star-inserted"]

*** Keywords ***
User selects COD and places order
    Set Selenium Speed  0.5 seconds
    Wait Until Page Contains Element  ${cod}
#    Set Selenium Speed  0 seconds
    Click Element  ${cod}
    Click Button  ${make_Payment_Button}