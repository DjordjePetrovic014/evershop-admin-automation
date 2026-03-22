*** Settings ***
Resource    ../../page_objects/catalog/categories_page.resource
Resource    ../common/web_common.resource

*** Keywords ***
Open Categories Page
    [Documentation]                     Navigates to categories page from admin menu.
    Click Element Wrapper               ${CATEGORIES_MENU}
    Wait Until Page Contains Wrapper    ${CATEGORY_TITLE}

Open New Category Form
    [Documentation]                     Opens form for creating a new category.
    Click Element Wrapper               ${NEW_CATEGORY_BUTTON}
    Wait Until Page Contains Wrapper    ${NEW_CATEGORY_FORM_TITLE}

Fill Category Form
    [Documentation]                     Fills category form with provided category data.
    [Arguments]    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Input Text     ${CATEGORY_NAME_INPUT}       ${category_name}
    Input Text     ${URL_KEY_INPUT}             ${url_key}
    Input Text     ${META_TITLE_INPUT}          ${meta_title}
    Input Text     ${META_DESCRIPTION_INPUT}    ${meta_description}

Save Category
    [Documentation]                     Saves category and waits for success message.
    Click Element Wrapper               ${SAVE_CATEGORY_BUTTON}
    Wait Until Page Contains Wrapper    ${CATEGORY_CREATED_SUCCESS_MESSAGE}

Create Category
    [Documentation]    Creates a new category with provided data through admin UI.
    [Arguments]    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Open Categories Page
    Open New Category Form
    Fill Category Form    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Save Category

Generate Unique Category Data
    [Documentation]         Generates unique category data using timestamp to avoid duplicates.
    ${timestamp}=           Get Time        epoch
    ${category_name}=       Set Variable    Test Category ${timestamp}
    ${url_key}=             Set Variable    test-category-${timestamp}
    ${meta_title}=          Set Variable    Meta Title ${timestamp}
    ${meta_description}=    Set Variable    Meta Description ${timestamp}

    RETURN    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}

Category Should Appear In Categories List
    [Documentation]    Verifies that created category is visible in categories list.
    [Arguments]    ${category_name}
    Open Categories Page
    Wait Until Page Contains Wrapper    ${category_name}

Select First Category In List
    [Documentation]                  Selects the first category row in categories list.
    Click Element Wrapper            ${FIRST_CATEGORY_CHECKBOX}

Click Delete Category Button
    [Documentation]                  Clicks delete button for selected category rows.
    Wait Until Element Is Visible    ${DELETE_CATEGORY_BUTTON}
    Click Element Wrapper            ${DELETE_CATEGORY_BUTTON}

Confirm Category Deletion
    [Documentation]                  Confirms category deletion in confirmation modal.
    Wait Until Element Is Visible    ${CONFIRM_DELETE_BUTTON}
    Click Element Wrapper            ${CONFIRM_DELETE_BUTTON}

Category Should Not Appear In Categories List
    [Documentation]    Verifies that deleted category is no longer visible in categories list.
    [Arguments]    ${category_name}
    Open Categories Page
    Wait Until Page Does Not Contain    ${category_name}    10s