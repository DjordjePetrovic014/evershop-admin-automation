*** Settings ***
Documentation    Contains reusable login-related keywords and authentication flows.

Resource    ../../page_objects/admin/login_page.resource
Resource    ../common/web_common.resource

*** Variables ***
${VALID_EMAIL}       djolevukas@gmail.com
${VALID_PASSWORD}    test1234

*** Keywords ***
Open Admin Login Page
    [Documentation]    Opens admin login page and verifies it is displayed.
    Open admin login url
    Verify login page is visible

Login With Credentials
    [Documentation]    Enters provided credentials and submits login form.
    [Arguments]    ${email}    ${password}
    Enter login email    ${email}
    Enter login password    ${password}
    Click on login button

Login As Admin
    [Documentation]    Performs full admin login flow and verifies dashboard.
    [Arguments]    ${email}    ${password}
    Login With Credentials    ${email}    ${password}
    Admin Dashboard Should Be Visible

Admin Dashboard Should Be Visible
    [Documentation]    Verifies that admin dashboard is displayed after login.
    Wait Until Page Contains    Dashboard    10s

Logout Admin User
    [Documentation]    Logs out admin user and verifies return to login page.
    Wait Until Keyword Succeeds    10s    1s    Click on user menu button
    Verify logout option is visible
    Click on logout option
    Verify login page is visible