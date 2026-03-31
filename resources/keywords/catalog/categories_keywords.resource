*** Settings ***
Documentation       Contains reusable category-related workflows such as create and delete.

Library             FakerLibrary
Resource            ../../page_objects/catalog/categories_page.resource
Resource            ../../keywords/common/web_common.resource
Resource            ../common/faker_keywords.resource


*** Keywords ***
Open Categories Page
    [Documentation]    Navigates to categories page from admin menu.
    Click on categories menu
    Verify categories page is visible

Open New Category Form
    [Documentation]    Opens form for creating a new category.
    Click on new category button
    Verify new category form is visible

Fill Category Form
    [Documentation]    Fills category form with provided category data.
    [Arguments]    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Enter category name    ${category_name}
    Enter category url key    ${url_key}
    Enter category meta title    ${meta_title}
    Enter category meta description    ${meta_description}

Save Category
    [Documentation]    Saves category and waits for success message.
    Click on save category button
    Verify category created success message

Create Category
    [Documentation]    Creates a new category with provided data through admin UI.
    [Arguments]    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Open Categories Page
    Open New Category Form
    Fill Category Form    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Save Category

Generate Unique Category Data
    [Documentation]    Generates unique category data as dictionary.
    ${unique_value}=    Generate Unique Fake Word With Timestamp
    ${meta_title_fake}=    Generate Fake Sentence    3
    ${meta_desc_fake}=    Generate Fake Sentence    6
    ${category_name}=    Set Variable    ${unique_value}
    ${url_key}=    Set Variable    ${unique_value}
    ${meta_title}=    Set Variable    ${meta_title_fake}
    ${meta_description}=    Set Variable    ${meta_desc_fake}
    VAR    &{category_data}
    ...    name=${category_name}
    ...    url_key=${url_key}
    ...    meta_title=${meta_title}
    ...    meta_description=${meta_description}
    RETURN    ${category_data}

Category Should Appear In Categories List
    [Documentation]    Verifies that created category is visible in categories list.
    [Arguments]    ${category_name}
    Open Categories Page
    Wait Until Page Contains Wrapper    ${category_name}

Select First Category In List
    [Documentation]    Selects the first category row in categories list.
    Select first category checkbox in categories page

Click Delete Category Button
    [Documentation]    Clicks delete button for selected category rows.
    Click on delete category button in categories page

Confirm Category Deletion
    [Documentation]    Confirms category deletion in confirmation modal.
    Click on confirm delete category button in categories page

Category Should Not Appear In Categories List
    [Documentation]    Verifies that deleted category is no longer visible in categories list.
    [Arguments]    ${category_name}
    Open Categories Page
    Wait Until Page Does Not Contain Wrapper    ${category_name}    10s
