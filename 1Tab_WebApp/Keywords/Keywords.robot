*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  ../Library/ExcelOperations.py
Resource  ../PageObjects/Address_Selection.robot
Resource  ../PageObjects/Cart.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Login_Signup.robot
Resource  ../PageObjects/PaymentMethod_Selector.robot
Resource  ../PageObjects/Order_Status.robot
Resource  ../PageObjects/Upload_Prescription.robot
Resource  Common.robot

*** Variables ***
${testData_Path}  ${CURDIR}/../testData.xls
${prescriptionJPG_Path}    ${EXECDIR}/1Tab_WebApp/Prescription.jpg
${prescriptionPDF_Path}    ${EXECDIR}/1Tab_WebApp/Prescription2.pdf
