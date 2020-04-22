*** Variables ***
${input_UserName}  xpath=//input[@id="user_input"]
${input_Password}  xpath=//input[@id="password"]
${submit_Button}  xpath=//button[@class="btn btn-success tab_yellowbtn w-100"]

*** Keywords ***
User logs in to the website
    Click Element  ${signIn_Link}
    ${max_rows}=  get_row_count  ${testData_Path}  Login
    ${max_cols}=  get_column_count  ${testData_Path}  Login
    : For   ${row_num}    IN RANGE    0   ${max_rows}
    \   ${user_Username}=  read_data_from_excel  ${testData_Path}  Login  ${row_num}  ${0}
    \   ${user_Password}=  read_data_from_excel  ${testData_Path}  Login  ${row_num}  ${1}
    \    Input Text  ${input_UserName}  ${user_Username}  clear=True
    \    Input Password  ${input_Password}  ${user_Password}  clear=True
    \   Wait Until Element Is Enabled  ${submit_Button}
    \    Click Button  ${submit_Button}