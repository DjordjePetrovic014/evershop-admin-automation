*** Settings ***
Resource            ../../resources/keywords/admin/login_keywords.resource
Resource            ../../resources/keywords/catalog/products_keywords.resource

# RUN TEST
# robot -d results tests/catalog/products_tests.robot
Test Setup          Open Admin Login Page
Test Teardown       Close all active browsers


*** Test Cases ***
# Positive / happy path tests
Open Products Page Successfully
    [Documentation]    Verifies that admin can successfully open the products page.
    [Tags]    smoke    product
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Open Products Page

Open New Product Form Successfully
    [Documentation]    Verifies that admin can open the new product creation form.
    [Tags]    product    create
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Open Products Page
    Open New Product Form

Create A New Product Successfully
    [Documentation]    Verifies that admin can create a new product with valid data.
    [Tags]    product    create
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    ${product}=    Generate Unique Product Data
    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${product.name}    ${product.sku}    ${product.price}    ${product.url_key}
    Save Product

Search Product Should Return Created Product
    [Documentation]    Verifies that a created product can be found using search functionality.
    [Tags]    product    search
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    ${product}=    Generate Unique Product Data
    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${product.name}    ${product.sku}    ${product.price}    ${product.url_key}
    Save Product
    Open Products Page
    Search And Open Product    ${product.name}
    Wait Until Page Contains    ${product.name}    10s

Edit Product Price Successfully
    [Documentation]    Verifies that admin can update the product price successfully.
    [Tags]    product    update
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    ${product}=    Generate Unique Product Data
    VAR    ${updated_price}    80
    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${product.name}    ${product.sku}    ${product.price}    ${product.url_key}
    Save Product
    Open Products Page
    Search And Open Product    ${product.name}
    ${updated_price}=    Set Variable    80
    Save Product And Expect Success Message

Create And Delete Product Successfully
    [Documentation]    Verifies that admin can create and then delete a product successfully.
    [Tags]    product    delete    crud
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    ${product}=    Generate Unique Product Data
    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${product.name}    ${product.sku}    ${product.price}    ${product.url_key}
    Save Product
    Open Products Page
    Product Should Be Visible In List    ${product.name}
    Select Product Checkbox    ${product.name}
    Click Delete Button
    Confirm Product Deletion
    Product Should Not Be Visible In List    ${product.name}

# Negative / validation tests

Create Product With Duplicate SKU Should Fail
    [Documentation]    Verifies that product creation fails when duplicate SKU is used.
    [Tags]    product    negative
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    ${timestamp}=    Get Time    epoch
    ${duplicate_sku}=    Set Variable    TEST${timestamp}
    ${name_a}=    Word
    ${name_b}=    Word
    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${name_a}-${timestamp}    ${duplicate_sku}    50    ${name_a}-${timestamp}
    Save Product
    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${name_b}-${timestamp}    ${duplicate_sku}    50    ${name_b}-${timestamp}
    Save Product And Expect Duplicate SKU Error

Create Product Without Name Should Fail
    [Documentation]    Verifies that product creation fails when name is missing.
    [Tags]    product    negative
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    ${timestamp}=    Get Time    epoch
    ${fake_word}=    Word
    ${sku}=    Set Variable    TEST${timestamp}
    ${url_key}=    Set Variable    ${fake_word}-${timestamp}
    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${EMPTY}    ${sku}    50    ${url_key}
    Save Product And Expect Name Validation Error

Create Product Without SKU Should Fail
    [Documentation]    Verifies that product creation fails when SKU is missing.
    [Tags]    product    negative
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    ${timestamp}=    Get Time    epoch
    ${fake_word}=    Word
    ${product_name}=    Set Variable    ${fake_word}-${timestamp}
    ${url_key}=    Set Variable    ${fake_word}-${timestamp}
    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${product_name}    ${EMPTY}    50    ${url_key}
    Save Product And Expect SKU Validation Error

Create Product Without Price Should Fail
    [Documentation]    Verifies that product creation fails when price is missing.
    [Tags]    product    negative
    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}
    ${timestamp}=    Get Time    epoch
    ${fake_word}=    Word
    ${product_name}=    Set Variable    ${fake_word}-${timestamp}
    ${sku}=    Set Variable    TEST${timestamp}
    ${url_key}=    Set Variable    ${fake_word}-${timestamp}
    Open Products Page
    Open New Product Form
    Fill Required Product Information    ${product_name}    ${sku}    ${EMPTY}    ${url_key}
    Save Product And Expect Price Validation Error
