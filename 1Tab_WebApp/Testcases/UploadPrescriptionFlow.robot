*** Settings ***
Library  SeleniumLibrary
Resource  ../Keywords/Keywords.robot
Resource  ../Keywords/Common.robot
Resource  ../PageObjects/HomePage.robot

Suite Setup  Website is up and running
Suite Teardown  Close Browser

*** Test Cases ***
Verify upload prescription flow is working
    User logs in to the website
    Place Order Via Upload Prescription Flow
    User Logsout
