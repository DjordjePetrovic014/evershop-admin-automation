*** Settings ***
Resource    ../../resources/keywords/admin/login_keywords.resource
Resource    ../../resources/keywords/catalog/categories_keywords.resource

# Test run:
# robot -d results tests/catalog/categories_tests.robot

Test Setup       Open Admin Login Page
Test Teardown    Close Browser

*** Variables ***
${VALID_EMAIL}       djolevukas@gmail.com
${VALID_PASSWORD}    test1234

*** Test Cases ***
Open Categories Page Successfully
    Login With Credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Categories Page

Open New Category Form Successfully
    Login With Credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Categories Page
    Open New Category Form