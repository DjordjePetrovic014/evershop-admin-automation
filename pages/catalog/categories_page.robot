*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CATEGORIES_MENU}                  xpath=//a[contains(., "Categories")]
${NEW_CATEGORY_BUTTON}              xpath=//a[contains(., "New Category")]
${CATEGORY_TITLE}                   Categories

*** Keywords ***
Open Categories Page
    Click Element                   ${CATEGORIES_MENU}
    Wait Until Page Contains        ${CATEGORY_TITLE}