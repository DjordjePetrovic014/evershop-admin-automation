*** Settings ***
Resource    ../../keywords/common/web_common.resource

*** Variables ***
# Navigation
${PRODUCTS_MENU}                xpath=//a[contains(., "Products")]
${NEW_PRODUCT_BUTTON}           xpath=(//button[@title="New Product"])[last()]
${SEARCH_INPUT}                 xpath=//input[@placeholder='Search']

# Form fields
${PRODUCT_NAME_INPUT}           xpath=//input[@name='name']
${SKU_INPUT}                    xpath=//input[@name='sku']
${PRICE_INPUT}                  xpath=//input[@name='price']
${QTY_INPUT}                    xpath=//input[@name='qty']
${WEIGHT_INPUT}                 xpath=//input[@name='weight']
${URL_KEY_INPUT}                xpath=//input[@name='url_key']
${META_TITLE_INPUT}             xpath=//input[@name='meta_title']

# Dropdowns and options
${TAX_CLASS_DROPDOWN}           xpath=//button[@id='field-tax_class']
${TAXABLE_GOODS_OPTION}         xpath=//div[@role='option' and contains(.,'Taxable Goods')]
${STATUS_ENABLED}               xpath=//label[contains(.,'Enabled')]
${VISIBILITY_CATALOG_SEARCH}    xpath=//label[contains(.,'Catalog, Search')]
${MANAGE_STOCK_YES}             xpath=//label[contains(.,'Yes')]
${IN_STOCK_OPTION}              xpath=//label[contains(.,'In Stock')]

# Page state / actions
${SAVE_BUTTON}                  xpath=//button[contains(.,'Save')]
${EDITING_HEADER}               xpath=//h1[contains(.,'Editing')]

# Delete actions
${DELETE_BUTTON}                xpath=//button[contains(.,'Delete')]
${DELETE_CONFIRM_BUTTON}        xpath=(//button[contains(.,'Delete')])[last()]

# Product link and check box
${PRODUCT_LINK}                 xpath=//a[contains(.,'{{product_name}}')]
${PRODUCT_CHECKBOX}             xpath=//td[contains(.,'{{product_name}}')]/ancestor::tr//span[@role='checkbox']
${ERROR_TEXT}                   Create a new product


*** Keywords ***
Click on products menu
    Click Element Wrapper  ${PRODUCTS_MENU}
    
Verify that create a new product page is visible
    Wait Until Page Contains Wrapper  ${ERROR_TEXT}

Click on new products button
    Click Element Wrapper  ${NEW_PRODUCT_BUTTON}
