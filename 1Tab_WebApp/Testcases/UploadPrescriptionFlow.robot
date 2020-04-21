*** Settings ***
Library  SeleniumLibrary
Resource  ../Keywords/Keywords.robot

Test Setup  Website is up and running
Test Teardown  Close Browser

*** Test Cases ***
Verify upload prescription flow is working
    User logs in to the website
    Place Order Via Upload Prescription Flow
    User Logsout
