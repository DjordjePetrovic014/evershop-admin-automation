*** Settings ***
Documentation    Contains reusable coupon-related keywords and coupon data generators.

Library    DateTime
Resource    ../../page_objects/promotion/coupons_page.resource
Resource    ../common/web_common.resource
Resource    ../common/faker_keywords.resource

*** Keywords ***
Generate Unique Coupon Data
    [Documentation]    Generates unique coupon data using reusable faker keywords.
    ${coupon_code}=         Generate Unique Fake Word With Timestamp
    ${coupon_description}=  Generate Fake Sentence    3
    ${discount_amount}=     Set Variable    10
    RETURN    ${coupon_code}    ${coupon_description}    ${discount_amount}

Open Coupons Page
    [Documentation]    Opens Coupons page from admin navigation.
    Click on coupons menu

Open New Coupon Form From Coupons Page
    [Documentation]    Opens new coupon form from Coupons page.
    Click on new coupon button

Open New Coupon Form From Sidebar
    [Documentation]    Opens new coupon form from admin sidebar.
    Click on new coupon link from sidebar

Enter Coupon Code
    [Arguments]    ${coupon_code}
    Enter coupon code in coupons page    ${coupon_code}

Enter Coupon Description
    [Arguments]    ${coupon_description}
    Enter coupon description in coupons page    ${coupon_description}

Enter Discount Amount
    [Arguments]    ${discount_amount}
    Enter discount amount in coupons page    ${discount_amount}

Select Fixed Discount Type
    [Documentation]    Selects fixed discount type for coupon.
    Select fixed discount type in coupons page
    Wait Until Page Does Not Contain Wrapper    Discount type is required

Save Coupon
    [Documentation]    Saves the coupon form.
    Click on save coupon button

Fill Required Coupon Information
    [Documentation]    Fills all required coupon fields with valid data.
    [Arguments]    ${coupon_code}    ${coupon_description}    ${discount_amount}
    Enter Coupon Code    ${coupon_code}
    Enter Coupon Description    ${coupon_description}
    Enter Discount Amount    ${discount_amount}
    Select Fixed Discount Type

Verify Required Coupon Field Errors Are Displayed
    [Documentation]    Verifies that all required field validation errors are displayed.
    Verify required coupon field errors are visible in coupons page

Verify Coupon Saved Successfully
    [Documentation]    Verifies that coupon saved successfully toast is displayed.
    Verify coupon saved success toast is visible in coupons page

Verify Coupon Code Field Value
    [Documentation]    Verifies that coupon code field contains expected value.
    [Arguments]    ${coupon_code}
    Verify coupon edit page is visible
    Verify coupon code field value in coupons page    ${coupon_code}

Return To Coupons List
    [Documentation]    Returns from editing page back to coupons list.
    Verify coupon edit page is visible
    Click on back to coupons link

Search Coupon By Code
    [Documentation]    Searches coupon list by coupon code.
    [Arguments]    ${coupon_code}
    Search coupon by code in coupons page    ${coupon_code}

Verify Coupon Appears In Search Results
    [Documentation]    Verifies that searched coupon appears in coupons table.
    [Arguments]    ${coupon_code}
    Verify coupon appears in search results in coupons page    ${coupon_code}

Verify Duplicate Coupon Error Is Displayed
    [Documentation]    Verifies that duplicate coupon code error toast is displayed.
    Verify duplicate coupon error toast is visible in coupons page

Verify Discount Amount Field Value
    [Documentation]    Verifies that discount amount field contains expected value.
    [Arguments]    ${discount_amount}
    Verify discount amount field value in coupons page    ${discount_amount}

Create Coupon Successfully
    [Documentation]    Creates coupon and verifies it is saved successfully.
    [Arguments]    ${coupon_code}    ${coupon_description}    ${discount_amount}

    Open Coupons Page
    Open New Coupon Form From Coupons Page
    Fill Required Coupon Information    ${coupon_code}    ${coupon_description}    ${discount_amount}
    Save Coupon
    Verify Coupon Code Field Value    ${coupon_code}
    Save Coupon
    Verify Coupon Saved Successfully