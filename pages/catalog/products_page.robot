*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCTS_MENU}    xpath=//a[contains(., "Products")]

*** Keywords ***
Open Products Page
    Click Element    ${PRODUCTS_MENU}
    Wait Until Page Contains    Products    10s