*** Settings ***
Documentation    Contains locators for storefront product page.

*** Variables ***
${PRODUCT_QUANTITY_INPUT}    xpath=//input[@name="qty" or @type="number"]
${ADD_TO_CART_BUTTON}        xpath=//button[contains(normalize-space(.), "ADD TO CART")]

${VIEW_CART_BUTTON}    xpath=//button[contains(normalize-space(.), "View Cart")]
${CHECKOUT_BUTTON}     xpath=//button[contains(normalize-space(.), "Checkout")]