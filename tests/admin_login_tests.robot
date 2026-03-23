*** Settings ***
Resource    ../resources/keywords/admin/login_keywords.resource

Test Setup       Open Admin Login Page
Test Teardown    Close all active browsers

# Run *** Test Cases ***
# robot -d results tests/admin_login_tests.robot

*** Variables ***
${VALID_EMAIL}              djolevukas@gmail.com
${INVALID_EMAIL}            wrong@email.com
${INVALID_EMAIL_FORMAT}     djolevukas
${VALID_PASSWORD}           test1234
${INVALID_PASSWORD}         wrong_password
${SHORT_PASSWORD}           1234


*** Test Cases ***
Valid Admin Login And Logout
    [Documentation]    This test tries to perform login with valid credentials
    [Tags]   smoke    login    positive
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Logout Admin User

Invalid Admin Login With Wrong Password
    [Tags]                      login    negative
    Login With Credentials      ${VALID_EMAIL}    ${INVALID_PASSWORD}
    Wait Until Page Contains    Invalid email or password    10s

Invalid Admin Login With Wrong Email
    [Tags]                      login    negative
    Login With Credentials      ${INVALID_EMAIL}    ${VALID_PASSWORD}
    Wait Until Page Contains    Invalid email or password    10s

Invalid Admin Login With Empty Password
    [Tags]                      login    negative
    Login With Credentials      ${VALID_EMAIL}    ${EMPTY}
    Wait Until Page Contains    Password is required

Invalid Admin Login With Empty Email
    [Tags]                      login    negative
    Login With Credentials      ${EMPTY}    ${VALID_PASSWORD}
    Wait Until Page Contains    Email is required

Invalid Admin Login With Empty Email And Password
    [Tags]                      login    negative
    Login With Credentials      ${EMPTY}    ${EMPTY}
    Wait Until Page Contains    Email is required

Invalid Admin Login With Short Password
    [Tags]                      login    negative
    Login With Credentials      ${VALID_EMAIL}    ${SHORT_PASSWORD}
    Wait Until Page Contains    Password must be at least 6 characters long

Invalid Admin Login With Invalid Email Format
    [Tags]                      login    negative
    Login With Credentials      ${INVALID_EMAIL_FORMAT}    ${VALID_PASSWORD}
    Wait Until Page Contains    Please enter a valid email address

#TODO Move variable to page object ( check the test structure in my project for web/web_tests/access/login_tests.robot test)
#TODO Add Documentation tag to all tests
#TODO COMPLETED: Set Test Setup to use Open Admin Login Page only
#TODO Implement Faker library
