*** Settings ***
Documentation    Contains reusable coupon-related keywords and coupon data generators.

Library    DateTime
Resource    ../../page_objects/promotion/coupons_page.resource
Resource    ../common/web_common.resource
Resource    ../common/faker_keywords.resource

*** Keywords ***
Generate Unique Coupon Data
    [Documentation]    Generates unique coupon data using Faker and timestamp.
    ${timestamp}=           Get Time    epoch
    ${fake_word}=           Generate Fake Word
    ${coupon_code}=         Set Variable    ${fake_word}${timestamp}
    ${coupon_description}=  Generate Fake Sentence    3
    ${discount_amount}=     Set Variable    10
    RETURN    ${coupon_code}    ${coupon_description}    ${discount_amount}

Open Coupons Page
    Scroll Sidebar To Element    ${SIDEBAR_CONTAINER}    ${COUPONS_MENU}
    Sleep    1s
    Wait Until Visible Wrapper    ${COUPONS_MENU}
    Click Element Wrapper         ${COUPONS_MENU}

Open New Coupon Form
    [Documentation]    Opens the new coupon creation form.
    Click Element Wrapper    ${NEW_COUPON_BUTTON}

Enter Coupon Code
    [Documentation]    Enters coupon code into coupon code field.
    [Arguments]    ${coupon_code}
    Clear And Input Text Wrapper    ${COUPON_CODE_INPUT}    ${coupon_code}

Enter Coupon Description
    [Documentation]    Enters coupon description.
    [Arguments]    ${coupon_description}
    Clear And Input Text Wrapper    ${DESCRIPTION_INPUT}    ${coupon_description}

Enter Discount Amount
    [Documentation]    Enters discount amount.
    [Arguments]    ${discount_amount}
    Clear And Input Text Wrapper    ${DISCOUNT_AMOUNT_INPUT}    ${discount_amount}

Select Fixed Discount Type
    [Documentation]    Selects fixed discount type for coupon.
    Click Element Wrapper    ${DISCOUNT_TYPE_FIXED}
    Wait Until Page Does Not Contain Wrapper    Discount type is required

Save Coupon
    [Documentation]    Saves the coupon form.
    Click Element Wrapper    ${SAVE_COUPON_BUTTON}

Fill Required Coupon Information
    [Documentation]    Fills all required coupon fields with valid data.
    [Arguments]    ${coupon_code}    ${coupon_description}    ${discount_amount}
    Enter Coupon Code    ${coupon_code}
    Enter Coupon Description    ${coupon_description}
    Enter Discount Amount    ${discount_amount}
    Select Fixed Discount Type

Verify Required Coupon Field Errors Are Displayed
    [Documentation]    Verifies that all required field validation errors are displayed.
    Wait Until Page Contains Wrapper    Coupon code is required
    Wait Until Page Contains Wrapper    Description is required
    Wait Until Page Contains Wrapper    Discount amount is required
    Wait Until Page Contains Wrapper    Discount type is required

Verify Coupon Saved Successfully
    [Documentation]    Verifies that coupon saved successfully toast is displayed.
    Wait Until Visible Wrapper    ${COUPON_SAVED_SUCCESS_TOAST}

Verify Coupon Code Field Value
    [Documentation]    Verifies that coupon code field contains expected value.
    [Arguments]    ${coupon_code}
    Wait Until Visible Wrapper    ${COUPON_EDIT_PAGE_TITLE}
    Wait Until Visible Wrapper    ${COUPON_CODE_INPUT}
    Text Field Value Should Be Wrapper    ${COUPON_CODE_INPUT}    ${coupon_code}

Return To Coupons List
    [Documentation]    Returns from editing page back to coupons list.
    Wait Until Visible Wrapper    ${COUPON_EDIT_PAGE_TITLE}
    Scroll Into View Wrapper      ${BACK_TO_COUPONS_LINK}
    Wait Until Visible Wrapper    ${BACK_TO_COUPONS_LINK}
    Sleep    1s
    Click Element Wrapper         ${BACK_TO_COUPONS_LINK}

Search Coupon By Code
    [Documentation]    Searches coupon list by coupon code.
    [Arguments]    ${coupon_code}
    Clear And Input Text Wrapper    ${COUPON_SEARCH_INPUT}    ${coupon_code}

Verify Coupon Appears In Search Results
    [Documentation]    Verifies that searched coupon appears in coupons table.
    [Arguments]    ${coupon_code}
    Wait Until Page Contains Wrapper    ${coupon_code}

Verify Duplicate Coupon Error Is Displayed
    [Documentation]    Verifies that duplicate coupon code error toast is displayed.
    Wait Until Visible Wrapper    ${COUPON_DUPLICATE_ERROR_TOAST}

Verify Discount Amount Field Value
    [Documentation]    Verifies that discount amount field contains expected value.
    [Arguments]    ${discount_amount}
    Wait Until Visible Wrapper    ${DISCOUNT_AMOUNT_INPUT}
    Text Field Value Should Be Wrapper    ${DISCOUNT_AMOUNT_INPUT}    ${discount_amount}

Open New Coupon Form From Sidebar
    [Documentation]    Opens new coupon form from admin sidebar.
    Wait Until Visible Wrapper    ${SIDEBAR_NEW_COUPON_LINK}
    Click Element Wrapper         ${SIDEBAR_NEW_COUPON_LINK}

