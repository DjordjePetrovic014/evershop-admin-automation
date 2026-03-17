*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADMIN_URL}            http://localhost:3000/admin/login
${EMAIL_FIELD}          id=field-email
${PASSWORD_FIELD}       name=password
${LOGIN_BUTTON}         SIGN IN
${USER_MENU_BUTTON}     xpath=//button[contains(., "d")]
${LOGOUT_OPTION}        xpath=//*[normalize-space(.)="Logout"]

*** Keywords ***
Open Admin Login Page
    Open Browser                     ${ADMIN_URL}     chrome
    Set Selenium Speed               0.1s
    Maximize Browser Window
    Wait Until Element Is Visible    ${EMAIL_FIELD}    10s

Enter Email
    [Arguments]         ${email}
    Input Text          ${EMAIL_FIELD}    ${email}

Enter Password
    [Arguments]         ${password}
    Input Password      ${PASSWORD_FIELD}    ${password}

Click Login
    Click Button        ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]         ${email}    ${password}
    Enter Email         ${email}
    Enter Password      ${password}
    Click Login

Login As Admin
    [Arguments]                      ${email}    ${password}
    Open Admin Login Page
    Login With Credentials           ${email}    ${password}
    Admin Dashboard Should Be Visible

Admin Dashboard Should Be Visible
    Wait Until Page Contains         Dashboard           10s

Logout Admin User
    Wait Until Keyword Succeeds      10s    1s    Click Element    ${USER_MENU_BUTTON}
    Wait Until Element Is Visible    ${LOGOUT_OPTION}    10s
    Click Element                    ${LOGOUT_OPTION}
    Wait Until Element Is Visible    ${EMAIL_FIELD}      10s