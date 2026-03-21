*** Settings ***
Resource    ../../page_objects/catalog/products_page.resource
Resource    ../common/web_common.resource

*** Keywords ***
Open Products Page
    Click Element                   ${PRODUCTS_MENU}
    Wait Until Page Contains        Create a new product        10s

Open New Product Form
    Wait Until Element Is Visible    ${NEW_PRODUCT_BUTTON}      10s
    Click Element                    ${NEW_PRODUCT_BUTTON}
    Wait Until Page Contains         Product Name               10s

Fill Required Product Information
    [Arguments]                     ${product_name}    ${sku}    ${price}    ${url_key}
    Clear Element Text              ${PRODUCT_NAME_INPUT}
    Input Text                      ${PRODUCT_NAME_INPUT}       ${product_name}

    Clear Element Text              ${SKU_INPUT}
    Input Text                      ${SKU_INPUT}                ${sku}

    Clear Element Text              ${PRICE_INPUT}
    Input Text                      ${PRICE_INPUT}              ${price}

    Click Element                   ${TAX_CLASS_DROPDOWN}
    Wait Until Element Is Visible   ${TAXABLE_GOODS_OPTION}    10s
    Click Element                   ${TAXABLE_GOODS_OPTION}

    Click Element                   ${STATUS_ENABLED}
    Click Element                   ${VISIBILITY_CATALOG_SEARCH}

    Click Element                   ${MANAGE_STOCK_YES}
    Click Element                   ${IN_STOCK_OPTION}

    Clear Element Text              ${QTY_INPUT}
    Input Text                      ${QTY_INPUT}            10


    Clear Element Text              ${WEIGHT_INPUT}
    Input Text                      ${WEIGHT_INPUT}          1

    Clear Element Text              ${URL_KEY_INPUT}
    Input Text                      ${URL_KEY_INPUT}        ${url_key}

    Clear Element Text              ${META_TITLE_INPUT}
    Input Text                      ${META_TITLE_INPUT}     ${product_name}

Update Product Price
    [Arguments]    ${new_price}
    Clear Element Text    ${PRICE_INPUT}
    Input Text            ${PRICE_INPUT}    ${new_price}

Save Product
    Scroll Element Into View        ${SAVE_BUTTON}
    Click Element                   ${SAVE_BUTTON}

    Wait Until Element Is Visible   ${EDITING_HEADER}       10s

    Scroll Element Into View        ${SAVE_BUTTON}
    Click Element                   ${SAVE_BUTTON}

Save Product And Expect Duplicate SKU Error
    Scroll Element Into View        ${SAVE_BUTTON}
    Click Element                   ${SAVE_BUTTON}
    Wait Until Page Contains        duplicate key value violates unique constraint "PRODUCT_SKU_UNIQUE"    10s

Search And Open Product
    [Arguments]                     ${product_name}
    Input Text                      ${SEARCH_INPUT}    ${product_name}
    Wait Until Element Is Visible   xpath=//a[contains(.,'${product_name}')]    10s
    Click Element                   xpath=//a[contains(.,'${product_name}')]

Save Product And Expect Name Validation Error
    Scroll Element Into View        ${SAVE_BUTTON}
    Click Element                   ${SAVE_BUTTON}
    Wait Until Page Contains        Product Name is required    10s

Save Product And Expect SKU Validation Error
    Scroll Element Into View        ${SAVE_BUTTON}
    Click Element                   ${SAVE_BUTTON}
    Wait Until Page Contains        SKU is required    10s

Save Product And Expect Price Validation Error
    Scroll Element Into View        ${SAVE_BUTTON}
    Click Element                   ${SAVE_BUTTON}
    Wait Until Page Contains        Price is required   10s

Save Product And Expect Success Message
    Scroll Element Into View        ${SAVE_BUTTON}
    Click Element                   ${SAVE_BUTTON}
    Wait Until Page Contains        Product updated successfully    10s

Product Should Be Visible In List
    [Arguments]    ${product_name}
    Wait Until Page Contains    ${product_name}    10s

Select Product Checkbox
    [Arguments]    ${product_name}
    Click Element    xpath=//td[contains(.,'${product_name}')]/ancestor::tr//span[@role='checkbox']

Click Delete Button
    Click Element                   ${DELETE_BUTTON}

Confirm Product Deletion
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON}    10s
    Click Element                    ${DELETE_CONFIRM_BUTTON}


Product Should Not Be Visible In List
    [Arguments]                         ${product_name}
    Wait Until Page Does Not Contain    ${product_name}    10s