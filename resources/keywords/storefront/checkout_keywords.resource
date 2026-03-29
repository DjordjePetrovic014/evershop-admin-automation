*** Settings ***
Documentation    Contains reusable storefront checkout-related keywords.

Resource    ../../page_objects/storefront/checkout_page.resource
Resource    ../common/web_common.resource

*** Keywords ***
Enter Coupon Code On Checkout
    [Documentation]    Enters coupon code on checkout page.
    [Arguments]    ${coupon_code}
    Clear And Input Text Wrapper    ${CHECKOUT_COUPON_INPUT}    ${coupon_code}

Apply Coupon On Checkout
    [Documentation]    Applies coupon on checkout page.
    Click Element Wrapper    ${APPLY_COUPON_BUTTON}

Verify Coupon Applied Successfully
    [Documentation]    Verifies that coupon is successfully applied on checkout page.
    Wait Until Visible Wrapper    ${COUPON_APPLIED_SUCCESS_TOAST}
    Wait Until Visible Wrapper    ${DISCOUNT_ROW}