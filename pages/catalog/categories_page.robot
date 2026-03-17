*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CATEGORIES_MENU}                  xpath=//a[contains(., "Categories")]
${NEW_CATEGORY_BUTTON}              xpath=//button[contains(., "New Category")]
${CATEGORY_TITLE}                   Categories
${NEW_CATEGORY_FORM_TITLE}          Create a new category

*** Keywords ***
Open Categories Page
    Click Element                   ${CATEGORIES_MENU}
    Wait Until Page Contains        ${CATEGORY_TITLE}

Open New Category Form
    Click Element                   ${NEW_CATEGORY_BUTTON}
    Wait Until Page Contains        ${NEW_CATEGORY_FORM_TITLE}