*** Settings ***
Documentation    Contains common reusable web interaction keywords used across all pages.

Library    SeleniumLibrary

*** Keywords ***

Click Element Wrapper
    [Documentation]    Clicks element using provided locator.
    [Arguments]    ${locator}
    Click Element    ${locator}

Input Text Wrapper
    [Documentation]    Inputs text into element using provided locator.
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Input Text And Wait
    [Documentation]    Waits for element and inputs text.
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    10s
    Input Text    ${locator}    ${text}

Wait Until Visible Wrapper
    [Documentation]    Waits until element becomes visible on the page.
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}

Clear Element Text Wrapper
    [Documentation]    Clears text from input field.
    [Arguments]    ${locator}
    Clear Element Text    ${locator}

Clear And Input Text Wrapper
    [Documentation]    Clears input field and types new value.
    [Arguments]    ${locator}    ${text}
    Clear Element Text Wrapper    ${locator}
    Input Text Wrapper            ${locator}    ${text}

Wait Until Page Contains Wrapper
    [Documentation]    Waits until given text is visible on page.
    [Arguments]    ${text}    ${timeout}=10s
    Wait Until Page Contains    ${text}    ${timeout}

Wait Until Page Does Not Contain Wrapper
    [Documentation]    Waits until given text is no longer visible on page.
    [Arguments]    ${text}    ${timeout}=10s
    Wait Until Page Does Not Contain    ${text}    ${timeout}

Close all active browsers
    [Documentation]    Closes all active browser instances.
    Close All Browsers

Scroll Into View Wrapper
    [Documentation]    Scrolls element into view.
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}

Click Element And Wait
    [Documentation]    Waits for element and clicks it.
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Click Element    ${locator}

Scroll Sidebar To Element
    [Documentation]    Scrolls sidebar container until element is visible.
    [Arguments]    ${container}    ${element}
    ${container_el}=    Get WebElement    ${container}
    ${target_el}=       Get WebElement    ${element}
    Execute JavaScript    arguments[0].scrollTop = arguments[1].offsetTop;    ARGUMENTS    ${container_el}    ${target_el}

Text Field Value Should Be Wrapper
    [Documentation]    Verifies that text field value matches expected value.
    [Arguments]    ${locator}    ${expected_value}
    Textfield Value Should Be    ${locator}    ${expected_value}