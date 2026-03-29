*** Settings ***
Resource    ../../resources/keywords/admin/login_keywords.resource
Resource    ../../resources/keywords/promotion/coupons_keywords.resource
Resource    ../../resources/keywords/catalog/products_keywords.resource
Resource    ../../resources/keywords/storefront/product_keywords.resource
Resource    ../../resources/keywords/storefront/checkout_keywords.resource

Test Setup       Open Admin Login Page
Test Teardown    Close Browser

*** Variables ***
${VALID_EMAIL}       djolevukas@gmail.com
${VALID_PASSWORD}    test1234

*** Test Cases ***
# Negative / validation tests
Create Coupon With Empty Required Fields Should Fail
    [Documentation]    Verifies that coupon creation fails when all required fields are left empty.
    [Tags]    coupon    negative

    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}

    Open Coupons Page
    Open New Coupon Form From Coupons Page
    Save Coupon
    Verify Required Coupon Field Errors Are Displayed

Create Coupon With Duplicate Code Should Fail
    [Documentation]    Verifies that coupon creation fails when duplicate coupon code is used.
    [Tags]    coupon    negative    duplicate

    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}

    ${coupon_code}    ${coupon_description}    ${discount_amount}=    Generate Unique Coupon Data

    Create Coupon Successfully    ${coupon_code}    ${coupon_description}    ${discount_amount}
    Return To Coupons List

    Open New Coupon Form From Coupons Page
    Fill Required Coupon Information    ${coupon_code}    ${coupon_description}    ${discount_amount}
    Save Coupon
    Verify Duplicate Coupon Error Is Displayed

# Positive / happy path tests
Create New Coupon Successfully
    [Documentation]    Verifies that admin can create a new coupon with valid data and find it in search results.
    [Tags]    coupon    positive    create

    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}

    ${coupon_code}    ${coupon_description}    ${discount_amount}=    Generate Unique Coupon Data

    Create Coupon Successfully    ${coupon_code}    ${coupon_description}    ${discount_amount}

    Return To Coupons List
    Search Coupon By Code    ${coupon_code}
    Verify Coupon Appears In Search Results    ${coupon_code}

Edit Coupon Discount Amount Successfully
    [Documentation]    Verifies that admin can edit coupon discount amount successfully.
    [Tags]    coupon    positive    edit

    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}

    ${coupon_code}    ${coupon_description}    ${discount_amount}=    Generate Unique Coupon Data
    ${updated_discount_amount}=    Set Variable    25

    Create Coupon Successfully    ${coupon_code}    ${coupon_description}    ${discount_amount}

    Enter Discount Amount    ${updated_discount_amount}
    Save Coupon
    Verify Coupon Saved Successfully
    Verify Discount Amount Field Value    ${updated_discount_amount}

# End-to-end / integration tests
Create Product And Coupon Then Apply Coupon During Checkout Successfully
    [Documentation]    Verifies end-to-end flow of product purchase with coupon application.
    ...
    ...    The test performs the following actions:
    ...    1. Creates a new product in admin panel and captures its URL key.
    ...    2. Creates a new coupon with valid data using admin panel.
    ...    3. Navigates to the storefront using the product URL.
    ...    4. Adds the product to cart and proceeds to checkout.
    ...    5. Applies the created coupon code during checkout.
    ...    6. Verifies that the coupon is accepted and successfully applied.

    [Tags]    coupon    product    e2e    checkout

    Login As Admin    ${VALID_EMAIL}    ${VALID_PASSWORD}

    ${product_name}    ${sku}    ${price}    ${url_key}=    Generate Unique Product Data
    ${coupon_code}    ${coupon_description}    ${discount_amount}=    Generate Unique Coupon Data

    Create Product Successfully    ${product_name}    ${sku}    ${price}    ${url_key}
    Create Coupon Successfully    ${coupon_code}    ${coupon_description}    ${discount_amount}

    Open Storefront Product Page    ${url_key}
    Add Product To Cart
    Open Checkout From Mini Cart
    Enter Coupon Code On Checkout    ${coupon_code}
    Apply Coupon On Checkout
    Verify Coupon Applied Successfully