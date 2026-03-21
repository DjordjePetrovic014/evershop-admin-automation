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