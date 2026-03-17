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
    Login With Credentials             ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page

Open New Product Form Successfully
    Login With Credentials              ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page
    Open New Product Form

Create Product - Basic Info Only
    ${timestamp}=       Get Time        epoch
    Login With Credentials              ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page
    Open New Product Form
    Fill Basic Product Info    Test Product ${timestamp}    TEST${timestamp}    test-product-${timestamp}
    Save Product

Create Product With Duplicate SKU Should Fail
    ${timestamp}=    Get Time    epoch
    Login With Credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page
    Open New Product Form
    Fill Basic Product Info    Duplicate Product ${timestamp}    TEST1234    duplicate-product-${timestamp}
    Save Product And Expect Duplicate SKU Error