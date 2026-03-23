*** Settings ***
Resource    ../../resources/keywords/admin/login_keywords.resource
Resource    ../../resources/keywords/catalog/categories_keywords.resource

# Test run:
# robot -d results tests/catalog/categories_tests.robot

Test Setup          Open Admin Login Page
Test Teardown       Close all active browsers

*** Variables ***
${VALID_EMAIL}       djolevukas@gmail.com
${VALID_PASSWORD}    test1234

*** Test Cases ***
Open Categories Page Successfully
    [Tags]                          smoke    category
    Login As Admin                      ${VALID_EMAIL}    ${VALID_PASSWORD}
    Open Categories Page

Open New Category Form Successfully
    [Tags]                          category    create
    Login As Admin                      ${VALID_EMAIL}    ${VALID_PASSWORD}
    Open Categories Page
    Open New Category Form

Create a New Category Successfully
    [Tags]                          smoke    category    create
    Login As Admin                      ${VALID_EMAIL}    ${VALID_PASSWORD}

    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}=    Generate Unique Category Data

    Create Category    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Category Should Appear In Categories List    ${category_name}

Create And Delete Category Successfully
    [Tags]                          category    create    delete    regression
    Login As Admin                      ${VALID_EMAIL}    ${VALID_PASSWORD}

    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}=    Generate Unique Category Data

    Create Category    ${category_name}    ${url_key}    ${meta_title}    ${meta_description}
    Category Should Appear In Categories List    ${category_name}

    Select First Category In List
    Click Delete Category Button
    Confirm Category Deletion

    Category Should Not Appear In Categories List    ${category_name}

