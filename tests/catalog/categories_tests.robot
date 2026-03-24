*** Settings ***
Resource    ../../resources/keywords/admin/login_keywords.resource
Resource    ../../resources/keywords/catalog/categories_keywords.resource

# Test run:
# robot -d results tests/catalog/categories_tests.robot

Test Setup          Open Admin Login Page
Test Teardown       Close all active browsers

*** Test Cases ***
Open Categories Page Successfully
    [Documentation]                 Verifies that admin can successfully open the categories page.
    [Tags]                          smoke    category
    Login As Admin                      ${VALID_EMAIL}    ${VALID_PASSWORD}
    Open Categories Page

Open New Category Form Successfully
     [Documentation]                Verifies that admin can open the new category creation form.
    [Tags]                          category    create
    Login As Admin                      ${VALID_EMAIL}    ${VALID_PASSWORD}
    Open Categories Page
    Open New Category Form

Create a New Category Successfully
    [Documentation]                 Verifies that admin can create a new category with valid data.
    [Tags]                          smoke    category    create
    Login As Admin                      ${VALID_EMAIL}    ${VALID_PASSWORD}

    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}=    Generate Unique Category Data

    Create Category    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Category Should Appear In Categories List    ${category_name}

Create And Delete Category Successfully
    [Documentation]    Verifies that admin can create and then delete a category successfully.
    [Tags]                          category    create    delete    regression
    Login As Admin                      ${VALID_EMAIL}    ${VALID_PASSWORD}

    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}=    Generate Unique Category Data

    Create Category    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Category Should Appear In Categories List    ${category_name}

    Select First Category In List
    Click Delete Category Button
    Confirm Category Deletion

    Category Should Not Appear In Categories List    ${category_name}

