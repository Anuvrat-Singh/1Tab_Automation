*** Settings ***
Library  SeleniumLibrary
Resource  ../Locators/HomePage.robot
Resource  ../Locators/Order_Status.robot
Variables  ../Config/config.py

*** Keywords ***
Website is up and running
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    sleep  3s
    Wait Until Page Contains Element  ${company_Info}

User clicks on cart icon in header
    Click Element  ${cart_Icon}

Thank You message is displayed to user
    Wait Until Page Contains Element  ${thank_You_Message}