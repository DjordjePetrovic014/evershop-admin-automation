*** Settings ***
Resource    ../../resources/keywords/admin/login_keywords.resource
Resource    ../../resources/keywords/catalog/products_keywords.resource

# RUN TEST
# robot -d results tests/catalog/products_tests.robot

Test Setup    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
Test Teardown    Close Browser

*** Variables ***
${VALID_EMAIL}       djolevukas@gmail.com
${VALID_PASSWORD}    test1234

*** Test Cases ***

# Positive / happy path tests
Open Products Page Successfully
    Open Products Page

Open New Product Form Successfully
    Open Products Page
    Open New Product Form

Create A New Product Successfully
    ${timestamp}=       Get Time        epoch
    Open Products Page
    Open New Product Form
    Fill Required Product Information             Test Product ${timestamp}    TEST${timestamp}    50    test-product-${timestamp}
    Save Product

Search Product Should Return Created Product
    ${timestamp}=                   Get Time        epoch

    ${product_name}=                Set Variable    Test Product ${timestamp}
    ${sku}=                         Set Variable    TEST${timestamp}
    ${url_key}=                     Set Variable    test-product-${timestamp}

    Open Products Page
    Open New Product Form

    Fill Required Product Information         ${product_name}    ${sku}    50    ${url_key}
    Save Product

    Open Products Page
    Search And Open Product          ${product_name}

    Wait Until Page Contains         ${product_name}    10s

Edit Product Price Successfully
    ${timestamp}=       Get Time        epoch
    ${product_name}=    Set Variable    Test Product ${timestamp}
    ${sku}=             Set Variable    TEST${timestamp}
    ${url_key}=         Set Variable    test-product-${timestamp}
    ${updated_price}=   Set Variable    80

    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${product_name}    ${sku}    50    ${url_key}
    Save Product

    Open Products Page
    Search And Open Product    ${product_name}

    Update Product Price    ${updated_price}

    Save Product And Expect Success Message

Create And Delete Product Successfully
    ${timestamp}=       Get Time        epoch
    ${product_name}=    Set Variable    Test Product ${timestamp}
    ${sku}=             Set Variable    TEST${timestamp}
    ${url_key}=         Set Variable    test-product-${timestamp}

    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${product_name}    ${sku}    50    ${url_key}
    Save Product

    Open Products Page
    Product Should Be Visible In List    ${product_name}
    Select Product Checkbox              ${product_name}
    Click Delete Button
    Confirm Product Deletion
    Product Should Not Be Visible In List    ${product_name}

# Negative / validation tests
Create Product With Duplicate SKU Should Fail
    ${timestamp}=        Get Time        epoch
    ${duplicate_sku}=    Set Variable    TEST${timestamp}

    Open Products Page
    Open New Product Form
    Fill Required Product Information    Product A ${timestamp}    ${duplicate_sku}    50    product-a-${timestamp}
    Save Product

    Open Products Page
    Open New Product Form
    Fill Required Product Information    Product B ${timestamp}    ${duplicate_sku}    50    product-b-${timestamp}
    Save Product And Expect Duplicate SKU Error

Create Product Without Name Should Fail
    ${timestamp}=                   Get Time        epoch
    ${sku}=                         Set Variable    TEST${timestamp}
    ${url_key}=                     Set Variable    test-product-${timestamp}

    Open Products Page
    Open New Product Form

    Fill Required Product Information         ${EMPTY}    ${sku}    50    ${url_key}
    Save Product And Expect Name Validation Error


Create Product Without SKU Should Fail
    ${timestamp}=                   Get Time        epoch
    ${product_name}=                Set Variable    Test Product ${timestamp}
    ${url_key}=                     Set Variable    test-product-${timestamp}
    Open Products Page
    Open New Product Form

    Fill Required Product Information         ${product_name}    ${EMPTY}    50    ${url_key}
    Save Product And Expect SKU Validation Error

Create Product Without Price Should Fail
    ${timestamp}=                   Get Time        epoch
    ${product_name}=                Set Variable    Test Product ${timestamp}
    ${sku}=                         Set Variable    TEST${timestamp}
    ${url_key}=                     Set Variable    test-product-${timestamp}

    Open Products Page
    Open New Product Form

    Fill Required Product Information         ${product_name}    ${sku}    ${EMPTY}    ${url_key}

    Save Product And Expect Price Validation Error
