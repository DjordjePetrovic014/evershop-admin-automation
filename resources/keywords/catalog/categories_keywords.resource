*** Settings ***
Resource    ../../page_objects/catalog/categories_page.resource
Resource    ../common/web_common.resource

*** Keywords ***
Open Categories Page
    Click Element                   ${CATEGORIES_MENU}
    Wait Until Page Contains        ${CATEGORY_TITLE}

Open New Category Form
    Click Element                   ${NEW_CATEGORY_BUTTON}
    Wait Until Page Contains        ${NEW_CATEGORY_FORM_TITLE}