*** Settings ***
Library    SeleniumLibrary
Test Setup       Open Admin Login Page
Test Teardown    Close Browser

# Run *** Test Cases ***
# robot -d results tests/admin_login_tests.robot

*** Variables ***
${ADMIN_URL}                http://localhost:3000/admin/login
${BROWSER}                  chrome
${VALID_EMAIL}              djolevukas@gmail.com
${INVALID_EMAIL}            wrong@email.com
${INVALID_EMAIL_FORMAT}     djolevukas
${VALID_PASSWORD}           test1234
${INVALID_PASSWORD}         wrong_password
${SHORT_PASSWORD}           1234


*** Test Cases ***
Valid Admin Login And Logout
    Login With Credentials          ${VALID_EMAIL}    ${VALID_PASSWORD}
    Wait Until Page Contains         Dashboard    10s
    Wait Until Keyword Succeeds      10s    1s    Click Element    xpath=//button[contains(., "d")]
    Wait Until Element Is Visible    xpath=//*[normalize-space(.)="Logout"]    10s
    Click Element                    xpath=//*[normalize-space(.)="Logout"]
    Wait Until Element Is Visible    id=field-email    10s

Invalid Admin Login With Wrong Password
    Login With Credentials      ${VALID_EMAIL}    ${INVALID_PASSWORD}
    Wait Until Page Contains    Invalid email or password    10s

Invalid Admin Login With Wrong Email
    Login With Credentials      ${INVALID_EMAIL}    ${VALID_PASSWORD}
    Wait Until Page Contains    Invalid email or password    10s

Invalid Admin Login With Empty Password
    Login With Credentials      ${VALID_EMAIL}    ${EMPTY}
    Wait Until Page Contains    Password is required

Invalid Admin Login With Empty Email
    Login With Credentials      ${EMPTY}    ${VALID_PASSWORD}
    Wait Until Page Contains    Email is required

Invalid Admin Login With Empty Email And Password
    Login With Credentials      ${EMPTY}    ${EMPTY}
    Wait Until Page Contains    Email is required

Invalid Admin Login With Short Password
    Login With Credentials      ${VALID_EMAIL}    ${SHORT_PASSWORD}
    Wait Until Page Contains    Password must be at least 6 characters long

Invalid Admin Login With Invalid Email Format
    Login With Credentials      ${INVALID_EMAIL_FORMAT}    ${VALID_PASSWORD}
    Wait Until Page Contains    Please enter a valid email address


*** Keywords ***
Open Admin Login Page
    Open Browser                    ${ADMIN_URL}    ${BROWSER}
    #Set Selenium Speed    0.5s
    Maximize Browser Window
    Wait Until Element Is Visible    id=field-email    10s

Login With Credentials
    [Arguments]         ${email}    ${password}
    Input Text          id=field-email    ${email}
    Input Password      name=password    ${password}
    Click Button        SIGN IN