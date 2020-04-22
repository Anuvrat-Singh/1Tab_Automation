*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  ../Library/ExcelOperations.py
Resource  ../Locators/Address_Selection.robot
Resource  ../Locators/Cart.robot
Resource  ../Locators/HomePage.robot
Resource  ../Locators/Login_Signup.robot
Resource  ../Locators/PaymentMethod_Selector.robot
Resource  ../Locators/Order_Status.robot
Resource  ../Locators/Upload_Prescription.robot
Resource  Common.robot

*** Variables ***
${testData_Path}  ${CURDIR}/../testData.xls
${prescriptionJPG_Path}    ${EXECDIR}/1Tab_WebApp/Prescription.jpg
${prescriptionPDF_Path}    ${EXECDIR}/1Tab_WebApp/Prescription2.pdf




















