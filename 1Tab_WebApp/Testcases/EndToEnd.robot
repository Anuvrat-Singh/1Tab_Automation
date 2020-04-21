*** Settings ***
Library  SeleniumLibrary
Resource  ../Keywords/Keywords.robot

Test Setup  Website is up and running
Test Teardown  Close Browser

*** Test Cases ***
Smoke Testing of a build
    User logs in to the website
    User adds product to cart from homepage
    User clicks on cart icon in header
    User applies 1TAB coupon on cart page
    User uploads a prescription in cart
    User clicks on checkout from cart page
    User adds a new address
    User selects COD and places order
    Thank You message is displayed to user
    User Logsout



