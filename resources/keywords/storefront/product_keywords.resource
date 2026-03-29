*** Settings ***
Documentation    Contains reusable storefront product-related keywords.

Resource    ../../page_objects/storefront/product_page.resource
Resource    ../common/web_common.resource

*** Keywords ***
Open Storefront Product Page
    [Documentation]    Opens storefront product page using provided URL key.
    [Arguments]    ${url_key}
    Go To    http://localhost:3000/${url_key}

Add Product To Cart
    [Documentation]    Adds storefront product to cart.
    Wait Until Visible Wrapper    ${ADD_TO_CART_BUTTON}
    Click Element Wrapper         ${ADD_TO_CART_BUTTON}

Open Checkout From Mini Cart
    [Documentation]    Opens checkout page from mini cart.
    Wait Until Visible Wrapper    ${CHECKOUT_BUTTON}
    Click Element Wrapper         ${CHECKOUT_BUTTON}