*** Settings ***
Documentation       Contains locators and page-level actions for products page in admin panel.

Resource            ../../keywords/common/web_common.resource


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
${STATUS_ENABLED}               xpath=//label[@for="field-status-1"]
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
# --- Navigation ---
Click on products menu
    [Documentation]    Opens products page from admin navigation.
    Click Element Wrapper    ${PRODUCTS_MENU}

Click on new products button
    [Documentation]    Opens new product creation form.
    Click Element And Wait    ${NEW_PRODUCT_BUTTON}

Verify new product form is visible
    [Documentation]    Verifies that new product form is displayed.
    Wait Until Page Contains Wrapper    ${ERROR_TEXT}

# --- Form actions ---

Enter product name
    [Documentation]    Enters product name into product form.
    [Arguments]    ${product_name}
    Input Text And Wait    ${PRODUCT_NAME_INPUT}    ${product_name}

Enter sku
    [Documentation]    Enters product SKU into product form.
    [Arguments]    ${sku}
    Input Text And Wait    ${SKU_INPUT}    ${sku}

Enter price
    [Documentation]    Enters product price into product form.
    [Arguments]    ${price}
    Input Text And Wait    ${PRICE_INPUT}    ${price}

Open tax class dropdown
    [Documentation]    Opens tax class dropdown menu.
    Click Element And Wait    ${TAX_CLASS_DROPDOWN}

Select taxable goods option
    [Documentation]    Selects Taxable Goods from tax class options.
    Click Element And Wait    ${TAXABLE_GOODS_OPTION}

Enable product status
    [Documentation]    Sets product status to Enabled.
    Click Element Wrapper    ${STATUS_ENABLED}

Select catalog search visibility
    [Documentation]    Sets product visibility to Catalog, Search.
    Click Element Wrapper    ${VISIBILITY_CATALOG_SEARCH}

Enable manage stock
    [Documentation]    Enables stock management for product.
    Click Element Wrapper    ${MANAGE_STOCK_YES}

Select in stock option
    [Documentation]    Marks product as in stock.
    Click Element Wrapper    ${IN_STOCK_OPTION}

Enter quantity
    [Documentation]    Enters product quantity.
    [Arguments]    ${qty}
    Clear And Input Text Wrapper    ${QTY_INPUT}    ${qty}

Enter weight
    [Documentation]    Enters product weight.
    [Arguments]    ${weight}
    Clear And Input Text Wrapper    ${WEIGHT_INPUT}    ${weight}

Enter url key
    [Documentation]    Enters product URL key.
    [Arguments]    ${url_key}
    Clear And Input Text Wrapper    ${URL_KEY_INPUT}    ${url_key}

Enter meta title
    [Documentation]    Enters product meta title.
    [Arguments]    ${meta_title}
    Clear And Input Text Wrapper    ${META_TITLE_INPUT}    ${meta_title}

# --- Save ---

Click save button
    [Documentation]    Clicks save button on product form.
    Scroll Into View Wrapper    ${SAVE_BUTTON}
    Click Element Wrapper    ${SAVE_BUTTON}

Verify editing header is visible
    [Documentation]    Verifies that editing page header is visible.
    Wait Until Visible Wrapper    ${EDITING_HEADER}    10s

# --- Search & open ---

Search product
    [Documentation]    Searches for product by name in products list.
    [Arguments]    ${product_name}
    Input Text Wrapper    ${SEARCH_INPUT}    ${product_name}

Open product link by name
    [Documentation]    Opens product details page by product name.
    [Arguments]    ${product_name}
    ${product_link}=    Replace String    ${PRODUCT_LINK}    {{product_name}}    ${product_name}
    Wait Until Visible Wrapper    ${product_link}    10s
    Click Element Wrapper    ${product_link}

# --- Delete ---

Select product checkbox by name
    [Documentation]    Selects product row checkbox by product name.
    [Arguments]    ${product_name}
    ${product_checkbox}=    Replace String    ${PRODUCT_CHECKBOX}    {{product_name}}    ${product_name}
    Click Element Wrapper    ${product_checkbox}

Click on delete button in products page
    [Documentation]    Clicks delete button on products page.
    Click Element Wrapper    ${DELETE_BUTTON}

Click on delete confirm button in products page
    [Documentation]    Confirms product deletion in modal dialog.
    Wait Until Visible Wrapper    ${DELETE_CONFIRM_BUTTON}    10s
    Click Element Wrapper    ${DELETE_CONFIRM_BUTTON}
