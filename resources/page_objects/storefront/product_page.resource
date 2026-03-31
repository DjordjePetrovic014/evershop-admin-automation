*** Settings ***
Documentation       Contains locators and page-level actions for storefront product page.

Resource            ../../keywords/common/web_common.resource


*** Variables ***
${PRODUCT_QUANTITY_INPUT}       xpath=//input[@name="qty" or @type="number"]
${ADD_TO_CART_BUTTON}           xpath=//button[contains(normalize-space(.), "ADD TO CART")]

${VIEW_CART_BUTTON}             xpath=//button[contains(normalize-space(.), "View Cart")]
${CHECKOUT_BUTTON}              xpath=//button[contains(normalize-space(.), "Checkout")]


*** Keywords ***
Click add to cart button
    [Documentation]    Clicks Add to Cart button on storefront product page.
    Click Visible Element Wrapper    ${ADD_TO_CART_BUTTON}

Click checkout button from mini cart
    [Documentation]    Clicks Checkout button from mini cart.
    Click Visible Element Wrapper    ${CHECKOUT_BUTTON}

Click view cart button from mini cart
    [Documentation]    Clicks View Cart button from mini cart.
    Click Visible Element Wrapper    ${VIEW_CART_BUTTON}
