*** Settings ***
Resource    ../../page_objects/admin/login_page.resource
Resource    ../common/web_common.resource

*** Keywords ***

Open Admin Login Page
    [Documentation]                  Opens admin login page and waits for login form.
    Open Browser                     ${ADMIN_URL}     chrome
    Set Selenium Speed               0.1s
    Maximize Browser Window
    Wait Until Visible Wrapper       ${EMAIL_FIELD}    10s


Enter Email
    [Arguments]             ${email}
    Input Text Wrapper      ${EMAIL_FIELD}    ${email}

Enter Password
    [Arguments]             ${password}
    Input Text Wrapper      ${PASSWORD_FIELD}    ${password}

Click Login
    Click Element Wrapper    ${LOGIN_BUTTON}

Login With Credentials
    [Documentation]         Enters email and password and submits login form.
    [Arguments]             ${email}    ${password}
    Enter Email             ${email}
    Enter Password          ${password}
    Click Login

Admin Dashboard Should Be Visible
    Wait Until Page Contains         Dashboard           10s

Login As Admin
    [Documentation]                  Performs full login flow and verifies dashboard is visible.
    [Arguments]                      ${email}    ${password}
    Open Admin Login Page
    Login With Credentials           ${email}    ${password}
    Admin Dashboard Should Be Visible

Logout Admin User
    [Documentation]                  Logs out admin user and verifies return to login page.
    Wait Until Keyword Succeeds      10s    1s    Click Element Wrapper    ${USER_MENU_BUTTON}
    Wait Until Visible Wrapper       ${LOGOUT_OPTION}    10s
    Click Element Wrapper            ${LOGOUT_OPTION}
    Wait Until Visible Wrapper       ${EMAIL_FIELD}    10s
