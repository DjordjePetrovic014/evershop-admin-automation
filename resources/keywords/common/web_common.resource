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
    [Documentation]    Waits until element becomes visible on the page.
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}

Clear Element Text Wrapper
    [Arguments]    ${locator}
    Clear Element Text    ${locator}

Clear And Input Text Wrapper
    [Documentation]    Clears input field and types new value.
    [Arguments]    ${locator}    ${text}
    Clear Element Text Wrapper    ${locator}
    Input Text Wrapper            ${locator}    ${text}

Wait Until Page Contains Wrapper
    [Arguments]    ${text}    ${timeout}=10s
    Wait Until Page Contains    ${text}    ${timeout}

Wait Until Page Does Not Contain Wrapper
    [Arguments]    ${text}    ${timeout}=10s
    Wait Until Page Does Not Contain    ${text}    ${timeout}