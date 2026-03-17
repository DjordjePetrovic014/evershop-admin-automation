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

Create A New Product
    ${timestamp}=       Get Time        epoch
    Login With Credentials              ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page
    Open New Product Form
    Fill Basic Product Info             Test Product ${timestamp}    TEST${timestamp}    50    test-product-${timestamp}
    Save Product

Create Product With Duplicate SKU Should Fail
    ${timestamp}=    Get Time           epoch
    Login With Credentials              ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page
    Open New Product Form
    Fill Basic Product Info             Duplicate Product ${timestamp}    TEST1234    50    duplicate-product-${timestamp}
    Save Product And Expect Duplicate SKU Error

Search Product Should Return Created Product
    ${timestamp}=                   Get Time        epoch

    ${product_name}=                Set Variable    Test Product ${timestamp}
    ${sku}=                         Set Variable    TEST${timestamp}
    ${url_key}=                     Set Variable    test-product-${timestamp}

    Login With Credentials          ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page
    Open New Product Form

    Fill Basic Product Info         ${product_name}    ${sku}    50    ${url_key}
    Save Product

    Open Products Page
    Search And Open Product          ${product_name}

    Wait Until Page Contains         ${product_name}    10s

Create Product Without Name Should Fail
    ${timestamp}=                   Get Time        epoch
    ${sku}=                         Set Variable    TEST${timestamp}
    ${url_key}=                     Set Variable    test-product-${timestamp}

    Login With Credentials          ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page
    Open New Product Form

    Fill Basic Product Info         ${EMPTY}    ${sku}    50    ${url_key}
    Save Product And Expect Name Validation Error

Create Product Without SKU Should Fail
    ${timestamp}=                   Get Time        epoch
    ${product_name}=                Set Variable    Test Product ${timestamp}
    ${url_key}=                     Set Variable    test-product-${timestamp}

    Login With Credentials          ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page
    Open New Product Form

    Fill Basic Product Info         ${product_name}    ${EMPTY}    50    ${url_key}
    Save Product And Expect SKU Validation Error

Create Product Without Price Should Fail
    ${timestamp}=                   Get Time        epoch
    ${product_name}=                Set Variable    Test Product ${timestamp}
    ${sku}=                         Set Variable    TEST${timestamp}
    ${url_key}=                     Set Variable    test-product-${timestamp}

    Login With Credentials          ${VALID_EMAIL}    ${VALID_PASSWORD}
    Admin Dashboard Should Be Visible
    Open Products Page
    Open New Product Form

    Fill Basic Product Info         ${product_name}    ${sku}    ${EMPTY}    ${url_key}

    Save Product And Expect Price Validation Error