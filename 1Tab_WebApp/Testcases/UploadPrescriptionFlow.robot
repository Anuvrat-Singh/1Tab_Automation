*** Settings ***
Library  SeleniumLibrary
Resource  ../Keywords/Keywords.robot
Resource  Common.robot

Suite Setup  Website is up and running
Suite Teardown  Close Browser
Resource  ../Keywords/Common.robot
Resource  ../PageObjects/HomePage.robot

*** Test Cases ***
Verify upload prescription flow is working
    User logs in to the website
    Place Order Via Upload Prescription Flow
    User Logsout
