*** Settings ***
Documentation       Contains locators and page-level actions for storefront checkout page.

Resource            ../../keywords/common/web_common.resource


*** Variables ***
${CHECKOUT_COUPON_INPUT}            xpath=//input[@name="coupon" or @placeholder="Enter coupon code"]
${APPLY_COUPON_BUTTON}              xpath=//button[contains(normalize-space(.), "Apply")]
${COUPON_APPLIED_SUCCESS_TOAST}     xpath=//div[@role="alert" and contains(normalize-space(.), "Coupon applied successfully")]
${DISCOUNT_ROW}                     xpath=//*[contains(normalize-space(.), "Discount(")]


*** Keywords ***
Enter checkout coupon code
    [Documentation]    Enters coupon code on checkout page.
    [Arguments]    ${coupon_code}
    Clear And Input Text Wrapper    ${CHECKOUT_COUPON_INPUT}    ${coupon_code}

Click apply coupon button
    [Documentation]    Clicks Apply button on checkout page.
    Click Visible Element Wrapper    ${APPLY_COUPON_BUTTON}

Verify coupon applied success toast is visible
    [Documentation]    Verifies that coupon applied success toast is displayed.
    Wait Until Visible Wrapper    ${COUPON_APPLIED_SUCCESS_TOAST}

Verify discount row is visible
    [Documentation]    Verifies that discount row is displayed in checkout summary.
    Wait Until Visible Wrapper    ${DISCOUNT_ROW}
