*** Settings ***
Documentation    Contains locators for Coupons page in admin panel.

*** Variables ***
${COUPONS_MENU}         xpath=//a[contains(@href, "/admin/coupons")]

${SIDEBAR_CONTAINER}    css=.admin-navigation

${NEW_COUPON_BUTTON}        xpath=//button[contains(., "New Coupon")]
${COUPON_SEARCH_INPUT}      xpath=//input[@placeholder="Search"]

${COUPON_CODE_INPUT}        xpath=//*[contains(normalize-space(.), "Coupon Code")]/following::input[1]
${DESCRIPTION_INPUT}        xpath=//textarea[@name="description"]
${DISCOUNT_AMOUNT_INPUT}    xpath=//input[@name="discount_amount"]

${DISCOUNT_TYPE_FIXED}    xpath=//label[@for="field-discount_type-fixed_discount_to_entire_order"]

${STATUS_ENABLED}           xpath=//input[@value="1"]

${SAVE_COUPON_BUTTON}       xpath=//button[normalize-space()="Save"]

${COUPON_CODE_ERROR}        xpath=//*[contains(text(), "Coupon code is required")]
${DESCRIPTION_ERROR}        xpath=//*[contains(text(), "Description is required")]
${DISCOUNT_AMOUNT_ERROR}    xpath=//*[contains(text(), "Discount amount is required")]
${DISCOUNT_TYPE_ERROR}      xpath=//*[contains(text(), "Discount type is required")]

${COUPON_ROW}               xpath=//tr

${BACK_TO_COUPONS_LINK}    xpath=//div[contains(@class,"page-heading")]//a[contains(@href,"/admin/coupons")]
${COUPON_SAVED_SUCCESS_TOAST}   xpath=//div[@role="alert" and contains(normalize-space(.), "Saved successfully")]

${COUPON_EDIT_PAGE_TITLE}    xpath=//h1[contains(., "Editing")]

${COUPON_DUPLICATE_ERROR_TOAST}    xpath=//div[@role="alert" and contains(normalize-space(.), "duplicate key value violates unique constraint")]

${SIDEBAR_NEW_COUPON_LINK}    xpath=//a[contains(@href, "/admin/coupon/new")]