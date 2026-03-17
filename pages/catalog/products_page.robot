*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCTS_MENU}                xpath=//a[contains(., "Products")]
${NEW_PRODUCT_BUTTON}           xpath=(//button[@title="New Product"])[last()]
${NEW_PRODUCT_MENU}             xpath=//a[@href="/admin/products/new"]

${PRODUCT_NAME_INPUT}           xpath=//input[@name='name']
${SKU_INPUT}                    xpath=//input[@name='sku']
${PRICE_INPUT}                  xpath=//input[@name='price']
${TAX_CLASS_DROPDOWN}           xpath=//button[@id='field-tax_class']
${TAXABLE_GOODS_OPTION}         xpath=//div[@role='option' and contains(.,'Taxable Goods')]
${STATUS_ENABLED}               xpath=//label[contains(.,'Enabled')]
${VISIBILITY_CATALOG_SEARCH}    xpath=//label[contains(.,'Catalog, Search')]
${MANAGE_STOCK_YES}             xpath=//label[contains(.,'Yes')]
${IN_STOCK_OPTION}              xpath=//label[contains(.,'In Stock')]
${QTY_INPUT}                    xpath=//input[@name='qty']
${WEIGHT_INPUT}                 xpath=//input[@name='weight']
${URL_KEY_INPUT}                xpath=//input[@name='url_key']
${META_TITLE_INPUT}             xpath=//input[@name='meta_title']
${SAVE_BUTTON}                  xpath=//button[contains(.,'Save')]
${EDITING_HEADER}               xpath=//h1[contains(.,'Editing')]

*** Keywords ***
Open Products Page
    Click Element                   ${PRODUCTS_MENU}
    Wait Until Page Contains        Create a new product        10s

Open New Product Form
    Wait Until Element Is Visible    ${NEW_PRODUCT_BUTTON}      10s
    Click Element                    ${NEW_PRODUCT_BUTTON}
    Wait Until Page Contains         Product Name               10s

Fill Basic Product Info
    Clear Element Text              ${PRODUCT_NAME_INPUT}
    Input Text                      ${PRODUCT_NAME_INPUT}       Test Product 1234

    Clear Element Text              ${SKU_INPUT}
    Input Text                      ${SKU_INPUT}                TEST1234

    Clear Element Text              ${PRICE_INPUT}
    Input Text                      ${PRICE_INPUT}              50

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
    Input Text                      ${URL_KEY_INPUT}        test-product-1234

    Clear Element Text              ${META_TITLE_INPUT}
    Input Text                      ${META_TITLE_INPUT}     Test Product 1234

Save Product
    Scroll Element Into View        ${SAVE_BUTTON}
    Click Element                   ${SAVE_BUTTON}

    Wait Until Element Is Visible   ${EDITING_HEADER}       10s

    Scroll Element Into View        ${SAVE_BUTTON}
    Click Element                   ${SAVE_BUTTON}