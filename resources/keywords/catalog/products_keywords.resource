*** Settings ***
Documentation    Contains reusable product-related workflows such as create, update, search and delete.

Library    String
Library    FakerLibrary
Resource    ../../page_objects/catalog/products_page.resource
Resource    ../common/web_common.resource

*** Keywords ***
Open Products Page
    [Documentation]    Opens products page from admin navigation.
    Click on products menu

Open New Product Form
    [Documentation]    Opens new product creation form.
    Click on new products button
    Verify new product form is visible

Fill Required Product Information
    [Documentation]    Fills all required fields for product creation.
    [Arguments]    ${product_name}    ${sku}    ${price}    ${url_key}
    Enter product name    ${product_name}
    Enter sku    ${sku}
    Enter price    ${price}

    Open tax class dropdown
    Select taxable goods option

    Enable product status
    Select catalog search visibility
    Enable manage stock
    Select in stock option

    Enter quantity    10
    Enter weight    1
    Enter url key    ${url_key}
    Enter meta title    ${product_name}

Generate Unique Product Data
    [Documentation]    Generates unique product data using FakerLibrary and timestamp.
    ${timestamp}=    Get Time    epoch
    ${fake_word}=    Word

    ${product_name}=    Set Variable    ${fake_word}-${timestamp}
    ${sku}=    Set Variable    TEST${timestamp}
    ${price}=    Set Variable    50
    ${url_key}=    Set Variable    ${fake_word}-${timestamp}

    RETURN    ${product_name}    ${sku}    ${price}    ${url_key}

Update Product Price
    [Documentation]    Updates product price in product form.
    [Arguments]    ${new_price}
    Enter price    ${new_price}

Save Product
    [Documentation]    Saves product and verifies editing page is displayed.
    Click save button
    Verify editing header is visible
    Click save button

Save Product And Expect Duplicate SKU Error
    [Documentation]    Attempts to save product and verifies duplicate SKU error.
    Click save button
    Wait Until Page Contains Wrapper    duplicate key value violates unique constraint "PRODUCT_SKU_UNIQUE"    10s

Search And Open Product
    [Documentation]    Searches for product and opens product details page.
    [Arguments]    ${product_name}
    Search product    ${product_name}
    Open product link by name    ${product_name}

Save Product And Expect Name Validation Error
    [Documentation]    Verifies validation error when product name is missing.
    Click save button
    Wait Until Page Contains Wrapper    Product Name is required    10s

Save Product And Expect SKU Validation Error
    [Documentation]    Verifies validation error when SKU is missing.
    Click save button
    Wait Until Page Contains Wrapper    SKU is required    10s

Save Product And Expect Price Validation Error
    [Documentation]    Verifies validation error when price is missing.
    Click save button
    Wait Until Page Contains Wrapper    Price is required    10s

Save Product And Expect Success Message
    [Documentation]    Verifies success message after saving product.
    Click save button
    Wait Until Page Contains Wrapper    Product updated successfully    10s

Product Should Be Visible In List
    [Documentation]    Verifies that product is visible in products list.
    [Arguments]    ${product_name}
    Wait Until Page Contains Wrapper    ${product_name}    10s

Select Product Checkbox
    [Documentation]    Selects product checkbox by product name.
    [Arguments]    ${product_name}
    Select product checkbox by name    ${product_name}

Click Delete Button
    [Documentation]    Clicks delete button for selected product.
    Click on delete button in products page

Confirm Product Deletion
    [Documentation]    Confirms product deletion in modal dialog.
    Click on delete confirm button in products page

Product Should Not Be Visible In List
    [Documentation]    Verifies that product is no longer visible in products list.
    [Arguments]    ${product_name}
    Wait Until Page Does Not Contain Wrapper    ${product_name}    10s