*** Settings ***
Library  SeleniumLibrary
Resource  ../Keywords/Keywords.robot

Suite Setup  Website is up and running
#Suite Teardown  Close Browser

*** Test Cases ***
Test searchBar
    User searches an item