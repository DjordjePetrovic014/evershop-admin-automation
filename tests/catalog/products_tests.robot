*** Settings ***
Resource    ../../pages/admin_login_page.robot
Resource    ../../pages/catalog/products_page.robot

# RUN TEST
# -d results tests/catalog/products_tests.robot

Test Setup       Open Admin Login Page
Test Teardown    Close Browser

*** Variables ***
${VALID_EMAIL}       djolevukas@gmail.com
${VALID_PASSWORD}    test1234

*** Test Cases ***
Open Products Page Successfully
    Login With Credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page