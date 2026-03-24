*** Settings ***
Documentation    Contains locators and page-level actions for admin login page.
Resource    ../../keywords/common/web_common.resource

*** Variables ***
${ADMIN_URL}          http://localhost:3000/admin/login
${EMAIL_FIELD}        id=field-email
${PASSWORD_FIELD}     name=password
${LOGIN_BUTTON}       xpath=//button[normalize-space()='SIGN IN']
${USER_MENU_BUTTON}   xpath=//button[contains(., "d")]
${LOGOUT_OPTION}      xpath=//*[normalize-space(.)='Logout']

*** Keywords ***
Open admin login url
    [Documentation]    Opens admin login page in browser.
    Open Browser    ${ADMIN_URL}    chrome
    Set Selenium Speed    0.1s
    Maximize Browser Window

Verify login page is visible
    [Documentation]    Verifies that login page is displayed.
    Wait Until Visible Wrapper    ${EMAIL_FIELD}    10s

Enter login email
    [Documentation]    Enters email into login form.
    [Arguments]    ${email}
    Input Text And Wait    ${EMAIL_FIELD}    ${email}

Enter login password
    [Documentation]    Enters password into login form.
    [Arguments]    ${password}
    Input Text And Wait    ${PASSWORD_FIELD}    ${password}

Click on login button
    [Documentation]    Clicks login submit button.
    Click Element Wrapper    ${LOGIN_BUTTON}

Click on user menu button
    [Documentation]    Opens user menu in admin panel.
    Click Element Wrapper    ${USER_MENU_BUTTON}

Verify logout option is visible
    [Documentation]    Verifies that logout option is visible.
    Wait Until Visible Wrapper    ${LOGOUT_OPTION}    10s

Click on logout option
    [Documentation]    Clicks logout option from user menu.
    Click Element Wrapper    ${LOGOUT_OPTION}