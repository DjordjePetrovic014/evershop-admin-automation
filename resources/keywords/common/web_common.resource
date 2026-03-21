*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Click Element Wrapper
    [Arguments]    ${locator}
    Click Element    ${locator}

Input Text Wrapper
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Wait Until Visible Wrapper
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}

Clear Element Text Wrapper
    [Arguments]    ${locator}
    Clear Element Text    ${locator}

Clear And Input Text Wrapper
    [Arguments]    ${locator}    ${text}
    Clear Element Text Wrapper    ${locator}
    Input Text Wrapper            ${locator}    ${text}