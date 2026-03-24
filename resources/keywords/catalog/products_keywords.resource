*** Settings ***
Library     String
Library     FakerLibrary

Resource    ../../page_objects/catalog/products_page.resource
Resource    ../common/web_common.resource

*** Keywords ***
Open Products Page
    [Documentation]                     Navigates to products page from admin catalog menu.
    Click on products menu
    Wait Until Page Contains Wrapper    Create a new product        10s

Open New Product Form
    [Documentation]                      Opens form for creating a new product.
    Wait Until Visible Wrapper           ${NEW_PRODUCT_BUTTON}      10s

    Click on new products button
    Wait Until Page Contains Wrapper     Product Name               10s

Fill Required Product Information
    [Documentation]                     Fills all mandatory fields required to create a product.
    [Arguments]                         ${product_name}    ${sku}    ${price}    ${url_key}
    Clear And Input Text Wrapper        ${PRODUCT_NAME_INPUT}       ${product_name}

    Clear And Input Text Wrapper        ${SKU_INPUT}                ${sku}

    Clear And Input Text Wrapper        ${PRICE_INPUT}              ${price}

    Click Element Wrapper               ${TAX_CLASS_DROPDOWN}
    Wait Until Visible Wrapper          ${TAXABLE_GOODS_OPTION}    10s
    Click Element Wrapper               ${TAXABLE_GOODS_OPTION}

    Click Element Wrapper               ${STATUS_ENABLED}
    Click Element Wrapper               ${VISIBILITY_CATALOG_SEARCH}

    Click Element Wrapper               ${MANAGE_STOCK_YES}
    Click Element Wrapper               ${IN_STOCK_OPTION}

    Clear And Input Text Wrapper        ${QTY_INPUT}            10

    Clear And Input Text Wrapper        ${WEIGHT_INPUT}          1

    Clear And Input Text Wrapper        ${URL_KEY_INPUT}        ${url_key}

    Clear And Input Text Wrapper        ${META_TITLE_INPUT}     ${product_name}

Generate Unique Product Data
    [Documentation]    Generates unique product data using FakerLibrary and timestamp.
    ${timestamp}=       Get Time    epoch
    ${fake_word}=       Word

    ${product_name}=    Set Variable    ${fake_word}-${timestamp}
    ${sku}=             Set Variable    TEST${timestamp}
    ${price}=           Set Variable    50
    ${url_key}=         Set Variable    ${fake_word}-${timestamp}

    RETURN    ${product_name}    ${sku}    ${price}    ${url_key}

Update Product Price
    [Arguments]    ${new_price}
    Clear And Input Text Wrapper        ${PRICE_INPUT}    ${new_price}

Save Product
    Scroll Element Into View            ${SAVE_BUTTON}
    Click Element Wrapper               ${SAVE_BUTTON}

    Wait Until Visible Wrapper          ${EDITING_HEADER}       10s

    Scroll Element Into View            ${SAVE_BUTTON}
    Click Element Wrapper               ${SAVE_BUTTON}

Save Product And Expect Duplicate SKU Error
    Scroll Element Into View            ${SAVE_BUTTON}
    Click Element Wrapper               ${SAVE_BUTTON}
    Wait Until Page Contains Wrapper    duplicate key value violates unique constraint "PRODUCT_SKU_UNIQUE"    10s

Search And Open Product
    [Documentation]                         Searches product by name and opens product details page.
    [Arguments]                             ${product_name}
    Input Text Wrapper                      ${SEARCH_INPUT}    ${product_name}
    ${product_link}=    Replace String      ${PRODUCT_LINK}    {{product_name}}    ${product_name}
    Wait Until Visible Wrapper              ${product_link}    10s
    Click Element Wrapper                   ${product_link}

Save Product And Expect Name Validation Error
    Scroll Element Into View            ${SAVE_BUTTON}
    Click Element Wrapper               ${SAVE_BUTTON}
    Wait Until Page Contains Wrapper    Product Name is required    10s

Save Product And Expect SKU Validation Error
    Scroll Element Into View            ${SAVE_BUTTON}
    Click Element Wrapper               ${SAVE_BUTTON}
    Wait Until Page Contains Wrapper    SKU is required    10s

Save Product And Expect Price Validation Error
    Scroll Element Into View            ${SAVE_BUTTON}
    Click Element Wrapper               ${SAVE_BUTTON}
    Wait Until Page Contains Wrapper    Price is required   10s

Save Product And Expect Success Message
    Scroll Element Into View            ${SAVE_BUTTON}
    Click Element Wrapper               ${SAVE_BUTTON}
    Wait Until Page Contains Wrapper    Product updated successfully    10s

Product Should Be Visible In List
    [Arguments]    ${product_name}
    Wait Until Page Contains Wrapper    ${product_name}    10s

Select Product Checkbox
    [Arguments]    ${product_name}
    ${product_checkbox}=                Replace String    ${PRODUCT_CHECKBOX}    {{product_name}}    ${product_name}
    Click Element Wrapper               ${product_checkbox}

Click Delete Button
    Click Element Wrapper               ${DELETE_BUTTON}

Confirm Product Deletion
    Wait Until Visible Wrapper          ${DELETE_CONFIRM_BUTTON}    10s
    Click Element Wrapper               ${DELETE_CONFIRM_BUTTON}


Product Should Not Be Visible In List
    [Arguments]                                     ${product_name}
    Wait Until Page Does Not Contain Wrapper        ${product_name}    10s