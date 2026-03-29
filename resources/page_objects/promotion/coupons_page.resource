*** Settings ***
Documentation    Contains locators and page-level actions for Coupons page in admin panel.

Resource    ../../keywords/common/web_common.resource

*** Variables ***
${COUPONS_MENU}         xpath=//a[contains(@href, "/admin/coupons")]

${SIDEBAR_CONTAINER}    css=.admin-navigation

${NEW_COUPON_BUTTON}        xpath=//button[contains(., "New Coupon")]
${COUPON_SEARCH_INPUT}      xpath=//input[@placeholder="Search"]

${COUPON_CODE_INPUT}        xpath=//*[contains(normalize-space(.), "Coupon Code")]/following::input[1]
${DESCRIPTION_INPUT}        xpath=//textarea[@name="description"]
${DISCOUNT_AMOUNT_INPUT}    xpath=//input[@name="discount_amount"]

${DISCOUNT_TYPE_FIXED}    xpath=//label[@for="field-discount_type-fixed_discount_to_entire_order"]

${SAVE_COUPON_BUTTON}       xpath=//button[normalize-space()="Save"]

${COUPON_CODE_ERROR}        xpath=//*[contains(text(), "Coupon code is required")]
${DESCRIPTION_ERROR}        xpath=//*[contains(text(), "Description is required")]
${DISCOUNT_AMOUNT_ERROR}    xpath=//*[contains(text(), "Discount amount is required")]
${DISCOUNT_TYPE_ERROR}      xpath=//*[contains(text(), "Discount type is required")]

${BACK_TO_COUPONS_LINK}    xpath=//div[contains(@class,"page-heading")]//a[contains(@href,"/admin/coupons")]
${COUPON_SAVED_SUCCESS_TOAST}   xpath=//div[@role="alert" and contains(normalize-space(.), "Saved successfully")]

${COUPON_EDIT_PAGE_TITLE}    xpath=//h1[contains(., "Editing")]

${COUPON_DUPLICATE_ERROR_TOAST}    xpath=//div[@role="alert" and contains(normalize-space(.), "duplicate key value violates unique constraint")]

${SIDEBAR_NEW_COUPON_LINK}    xpath=//a[contains(@href, "/admin/coupon/new")]

*** Keywords ***

# --- Navigation ---
Click on coupons menu
    [Documentation]    Opens Coupons page from admin navigation.
    Scroll Sidebar To Element    ${SIDEBAR_CONTAINER}    ${COUPONS_MENU}
    Click Visible Element Wrapper    ${COUPONS_MENU}

Click on new coupon button
    [Documentation]    Opens new coupon form from Coupons page.
    Click Visible Element Wrapper    ${NEW_COUPON_BUTTON}

Click on new coupon link from sidebar
    [Documentation]    Opens new coupon form from admin sidebar.
    Click Visible Element Wrapper    ${SIDEBAR_NEW_COUPON_LINK}

Click on back to coupons link
    [Documentation]    Returns from editing page back to coupons list.
    Scroll Into View Wrapper    ${BACK_TO_COUPONS_LINK}
    Sleep    1s
    Click Visible Element Wrapper    ${BACK_TO_COUPONS_LINK}


# --- Form actions ---
Enter coupon code in coupons page
    [Documentation]    Enters coupon code into coupon code field.
    [Arguments]    ${coupon_code}
    Clear And Input Text Wrapper    ${COUPON_CODE_INPUT}    ${coupon_code}

Enter coupon description in coupons page
    [Documentation]    Enters coupon description.
    [Arguments]    ${coupon_description}
    Clear And Input Text Wrapper    ${DESCRIPTION_INPUT}    ${coupon_description}

Enter discount amount in coupons page
    [Documentation]    Enters discount amount.
    [Arguments]    ${discount_amount}
    Clear And Input Text Wrapper    ${DISCOUNT_AMOUNT_INPUT}    ${discount_amount}

Select fixed discount type in coupons page
    [Documentation]    Selects fixed discount type for coupon.
    Click Visible Element Wrapper    ${DISCOUNT_TYPE_FIXED}

Click on save coupon button
    [Documentation]    Clicks save button on coupon form.
    Click Visible Element Wrapper    ${SAVE_COUPON_BUTTON}


# --- Search ---
Search coupon by code in coupons page
    [Documentation]    Searches coupon list by coupon code.
    [Arguments]    ${coupon_code}
    Clear And Input Text Wrapper    ${COUPON_SEARCH_INPUT}    ${coupon_code}


# --- Verifications ---
Verify coupon edit page is visible
    [Documentation]    Verifies that coupon editing page is displayed.
    Wait Until Visible Wrapper    ${COUPON_EDIT_PAGE_TITLE}

Verify coupon saved success toast is visible in coupons page
    [Documentation]    Verifies that coupon saved success toast is displayed.
    Wait Until Visible Wrapper    ${COUPON_SAVED_SUCCESS_TOAST}

Verify duplicate coupon error toast is visible in coupons page
    [Documentation]    Verifies that duplicate coupon code error toast is displayed.
    Wait Until Visible Wrapper    ${COUPON_DUPLICATE_ERROR_TOAST}

Verify required coupon field errors are visible in coupons page
    [Documentation]    Verifies that all required coupon field validation errors are displayed.
    Wait Until Visible Wrapper    ${COUPON_CODE_ERROR}
    Wait Until Visible Wrapper    ${DESCRIPTION_ERROR}
    Wait Until Visible Wrapper    ${DISCOUNT_AMOUNT_ERROR}
    Wait Until Visible Wrapper    ${DISCOUNT_TYPE_ERROR}

Verify coupon code field value in coupons page
    [Documentation]    Verifies that coupon code field contains expected value.
    [Arguments]    ${coupon_code}
    Wait Until Visible Wrapper    ${COUPON_CODE_INPUT}
    Text Field Value Should Be Wrapper    ${COUPON_CODE_INPUT}    ${coupon_code}

Verify discount amount field value in coupons page
    [Documentation]    Verifies that discount amount field contains expected value.
    [Arguments]    ${discount_amount}
    Wait Until Visible Wrapper    ${DISCOUNT_AMOUNT_INPUT}
    Text Field Value Should Be Wrapper    ${DISCOUNT_AMOUNT_INPUT}    ${discount_amount}

Verify coupon appears in search results in coupons page
    [Documentation]    Verifies that searched coupon appears in coupons table.
    [Arguments]    ${coupon_code}
    Wait Until Page Contains Wrapper    ${coupon_code}