*** Settings ***
Documentation    Contains reusable storefront checkout-related keywords.

Resource    ../../page_objects/storefront/checkout_page.resource
Resource    ../common/web_common.resource

*** Keywords ***
Enter Coupon Code On Checkout
    [Documentation]    Enters coupon code on checkout page.
    [Arguments]    ${coupon_code}
    Enter checkout coupon code    ${coupon_code}

Apply Coupon On Checkout
    [Documentation]    Applies coupon on checkout page.
    Click apply coupon button

Verify Coupon Applied Successfully
    [Documentation]    Verifies that coupon is successfully applied on checkout page.
    Verify coupon applied success toast is visible
    Verify discount row is visible