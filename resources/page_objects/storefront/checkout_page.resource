*** Settings ***
Documentation    Contains locators for storefront checkout page.

*** Variables ***
${CHECKOUT_COUPON_INPUT}              xpath=//input[@name="coupon" or @placeholder="Enter coupon code"]
${APPLY_COUPON_BUTTON}                xpath=//button[contains(normalize-space(.), "Apply")]
${COUPON_APPLIED_SUCCESS_TOAST}       xpath=//div[@role="alert" and contains(normalize-space(.), "Coupon applied successfully")]
${DISCOUNT_ROW}                       xpath=//*[contains(normalize-space(.), "Discount(")]