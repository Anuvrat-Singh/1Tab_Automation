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

*** Variables ***
${testData_Path}  ${CURDIR}/../testData.xls
${prescriptionJPG_Path}    ${EXECDIR}/1Tab_WebApp/Prescription.jpg
${prescriptionPDF_Path}    ${EXECDIR}/1Tab_WebApp/Prescription2.pdf

*** Keywords ***
Website is up and running
    Open Browser  https://prod.1tab.com/  Chrome
    Maximize Browser Window
    sleep  3s
    Wait Until Page Contains Element  ${company_Info}


User logs in to the website
#    [Arguments]  ${email_Login}  ${user_Password}

    Click Element  ${signIn_Link}
#    Click Element  ${input_UserName}
#---------------------------------------------------------------------------------
# step1 use a for loop
# call a method to read data from excel
# use the return value and pass in the below steps

    ${max_rows}=  get_row_count  ${testData_Path}  Login
    ${max_cols}=  get_column_count  ${testData_Path}  Login
    : For   ${row_num}    IN RANGE    0   ${max_rows}
    \   ${user_Username}=  read_data_from_excel  ${testData_Path}  Login  ${row_num}  ${0}
    \   ${user_Password}=  read_data_from_excel  ${testData_Path}  Login  ${row_num}  ${1}
    \    Input Text  ${input_UserName}  ${user_Username}  clear=True
#   \    Click Element  ${input_Password}
    \    Input Password  ${input_Password}  ${user_Password}  clear=True
    \   Wait Until Element Is Enabled  ${submit_Button}
    \    Click Button  ${submit_Button}

User adds product to cart from homepage
    Set Selenium Speed  1 seconds
    Wait Until Page Contains Element  ${dabur_Sitopladi}
#    Mouse Over  //div[@title="Dabur Sitopaladi Churna"]/following-sibling::div[4]/button[@data-hover="  Add to Cart"]
    Click Element  ${sitopladi_AddToCart}
#    Mouse Over  //div[@title="Baidyanath Kasamrit Syrup"]/following-sibling::div[4]/button[@data-hover="  Add to Cart"]
    Click Element  ${kasamrit_AddToCart}
#    Mouse Over  //div[@title="Moisturex Wash"]/following-sibling::div[4]/button[@data-hover="  Add to Cart"]
    Click Element  ${honitus_AddToCart}
    Click Element  ${nityamChurn_AddToCart}
    Click Element  ${cyclopam_AddToCart}

User clicks on cart icon in header
#    Wait Until Page Contains Element  ${cart_Icon}
    Click Element  ${cart_Icon}

User applies 1TAB coupon on cart page
    Wait Until Page Contains Element  ${firstOrder_Coupon}
    Click Element  ${inc_Quantity}
    Click Element  ${inc_Quantity}
    Click Element  ${inc_Quantity}
    Wait Until Element Is Enabled  ${firstOrder_Coupon}
    Click Element  ${firstOrder_Coupon}
    Wait Until Element Is Enabled  ${firstOrder_Coupon}
    Page Should Contain Element  ${coupon_Failure}

User uploads a prescription in cart
    Click Element  ${uploadPrescriptionCart_Button}
    Wait Until Page Contains Element  ${fileUpload_Form}
    Wait Until Element Is Enabled  ${fileUpload_Selector}
    Choose File  ${fileUpload_Selector}  ${prescriptionJPG_Path}
    Click Element  ${prescriptionSubmit_Button}
    Click Element  ${closePrescriptionUpload_Form}

User clicks on checkout from cart page
    Click Element  ${checkout_Button}

User adds a new address
#    [Arguments]  ${name}  ${address1}  ${address2}  ${landmark}  ${city}  ${state}  ${pincode}

    Wait Until Page Contains Element  ${add_New_Address_Button}
    Click Element  ${add_New_Address_Button}

    ${max_rows}=  get_row_count  ${testData_Path}  Address
    ${max_cols}=  get_column_count  ${testData_Path}  Address
#    ${type_string}=  read_data_from_excel  ${testData_Path}  Address  ${0}  ${7}
#    Log  ${type_string}
    : For   ${row_num}    IN RANGE    0   ${max_rows}
    \   ${name}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${0}
    \    Input Text  ${customer_Name}  ${name}  clear = True
    \   ${mobile}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${1}
    \    Input Text  ${customer_Mobile}  ${mobile}  clear=True
    \   ${address1}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${2}
    \    Input Text  ${address_Line1}  ${address1}  clear=True
    \   ${address2}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${3}
    \    Input Text  ${address_Line2}  ${address2}  clear=True
    \   ${landmark}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${4}
    \    Input Text  ${customer_Landmark}  ${landmark}  clear=True
    \   ${city}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${5}
    \    Input Text  ${customer_City}  ${city}  clear=True
    \   ${state}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${6}
    \    Input Text  ${customer_State}  ${state}  clear=True
    \   ${pincode}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${7}
    \   ${pincode}=  Convert To String  ${pincode}
    \    Input Text  ${customer_Pincode}  ${pincode}  clear=True
    \    Click Element  ${address_Selector_Home}
    \    Click Button  ${save_Address_Button}
#    \    Click Element  ${clear_Button}
    Set Selenium Speed  0.5 seconds
    Wait Until Element Is Enabled  ${select_First_Address}
    Click Element  ${select_First_Address}
    Click Button  ${make_Payment_Button}

User selects COD and places order
    Set Selenium Speed  0.5 seconds
    Wait Until Page Contains Element  ${cod}
#    Set Selenium Speed  0 seconds
    Click Element  ${cod}
    Click Button  ${make_Payment_Button}

Thank You message is displayed to user
#    Set Selenium Speed  3 seconds
    Wait Until Page Contains Element  ${thank_You_Message}

User Increases Product Quantity
    Wait Until Page Contains Element  ${inc_Quantity}
    Click Element  ${inc_Quantity}

User adds a new address via upload prescription
#    [Arguments]  ${name}  ${address1}  ${address2}  ${landmark}  ${city}  ${state}  ${pincode}
    Sleep  3s
    Wait Until Element Is Enabled  ${UP_addNewAddress_Button}
    Click Element  ${UP_addNewAddress_Button}

    ${max_rows}=  get_row_count  ${testData_Path}  Address
    ${max_cols}=  get_column_count  ${testData_Path}  Address
#    ${type_string}=  read_data_from_excel  ${testData_Path}  Address  ${0}  ${7}
#    Log  ${type_string}
    : For   ${row_num}    IN RANGE    0   ${max_rows}
    \   ${UP_name}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${0}
    \    Input Text  ${UP_customer_Name}  ${UP_name}  clear = True
    \   ${UP_mobile}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${1}
    \    Input Text  ${UP_customer_Mobile}  ${UP_mobile}  clear=True
    \   ${UP_address1}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${2}
    \    Input Text  ${UP_address_Line1}  ${UP_address1}  clear=True
    \   ${UP_address2}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${3}
    \    Input Text  ${UP_address_Line2}  ${UP_address2}  clear=True
    \   ${UP_landmark}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${4}
    \    Input Text  ${UP_customer_Landmark}  ${UP_landmark}  clear=True
    \   ${UP_city}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${5}
    \    Input Text  ${UP_customer_City}  ${UP_city}  clear=True
    \   ${UP_state}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${6}
    \    Input Text  ${UP_customer_State}  ${UP_state}  clear=True
    \   ${UP_pincode}=  read_data_from_excel  ${testData_Path}  Address  ${row_num}  ${7}
    \   ${UP_pincode}=  Convert To String  ${UP_pincode}
    \    Input Text  ${UP_customer_Pincode}  ${UP_pincode}  clear=True
    \    Click Element  ${UP_address_Selector_Office}
    \    Wait Until Element Is Enabled  ${UP_save_Address_Button}
    \    Click Button  ${UP_save_Address_Button}
    Sleep  2s
    Wait Until Element Is Enabled  ${UP_select_First_Address}
    Click Element  ${UP_select_First_Address}
    Sleep  2s
    Click Element  ${UP_addressConfirm_Button}

Place Order Via Upload Prescription Flow
#    Wait Until Page Contains Element  ${uploadPrescription_Button}
    Click Element  ${uploadPrescriptionHeader_Button}
    Wait Until Element Is Enabled  ${fileUpload_Button}
    Choose File  ${fileUpload_Button}  ${prescriptionPDF_Path}
    Input Text  ${userNotes_Textarea}  This is a sample input text
    Click Element  ${next_Button}
    Wait Until Element is Enabled  ${firstOption_Label}
    Click Element  ${firstOption_Label}
    Click Element  ${confirm_Button}
    User adds a new address via upload prescription

User Logsout
    Click Element  ${Logout}