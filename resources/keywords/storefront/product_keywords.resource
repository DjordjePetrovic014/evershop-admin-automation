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
    Click add to cart button

Open Checkout From Mini Cart
    [Documentation]    Opens checkout page from mini cart.
    Click checkout button from mini cart