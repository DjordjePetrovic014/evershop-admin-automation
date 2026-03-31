*** Settings ***
Documentation       Contains locators and page-level actions for categories page in admin panel.

Resource            ../../keywords/common/web_common.resource


*** Variables ***
# --- Navigation ---
${CATEGORIES_MENU}                      xpath=//a[contains(., "Categories")]
${NEW_CATEGORY_BUTTON}                  xpath=//button[contains(., "New Category")]
${CATEGORY_TITLE}                       Categories
${NEW_CATEGORY_FORM_TITLE}              Create a new category

# --- Form Inputs ---
${CATEGORY_NAME_INPUT}                  xpath=//input[@name='name']
${URL_KEY_INPUT}                        xpath=//input[@name='url_key']
${META_TITLE_INPUT}                     xpath=//input[@name='meta_title']
${META_DESCRIPTION_INPUT}               xpath=//textarea[@name='meta_description']

# --- Actions ---
${SAVE_CATEGORY_BUTTON}                 xpath=//button[normalize-space()='Save']
${DELETE_CATEGORY_BUTTON}               xpath=//button[normalize-space()='Delete']
${CONFIRM_DELETE_BUTTON}                xpath=(//button[normalize-space()='Delete'])[last()]

# --- Feedback / Validation ---
${CATEGORY_CREATED_SUCCESS_MESSAGE}     Category created successfully!

# --- Table ---
${FIRST_CATEGORY_CHECKBOX}              xpath=(//span[@role='checkbox'])[2]


*** Keywords ***
# --- Navigation ---
Click on categories menu
    [Documentation]    Opens categories page from admin navigation.
    Click Element Wrapper    ${CATEGORIES_MENU}

Verify categories page is visible
    [Documentation]    Verifies that categories page is displayed.
    Wait Until Page Contains Wrapper    ${CATEGORY_TITLE}

Click on new category button
    [Documentation]    Opens new category creation form.
    Click Element Wrapper    ${NEW_CATEGORY_BUTTON}

Verify new category form is visible
    [Documentation]    Verifies that new category form is displayed.
    Wait Until Page Contains Wrapper    ${NEW_CATEGORY_FORM_TITLE}

# --- Form actions ---

Enter category name
    [Documentation]    Enters category name into category form.
    [Arguments]    ${category_name}
    Input Text Wrapper    ${CATEGORY_NAME_INPUT}    ${category_name}

Enter category url key
    [Documentation]    Enters category URL key into category form.
    [Arguments]    ${url_key}
    Input Text Wrapper    ${URL_KEY_INPUT}    ${url_key}

Enter category meta title
    [Documentation]    Enters category meta title.
    [Arguments]    ${meta_title}
    Input Text Wrapper    ${META_TITLE_INPUT}    ${meta_title}

Enter category meta description
    [Documentation]    Enters category meta description.
    [Arguments]    ${meta_description}
    Input Text Wrapper    ${META_DESCRIPTION_INPUT}    ${meta_description}

# --- Save / feedback ---

Click on save category button
    [Documentation]    Clicks save button on category form.
    Click Element Wrapper    ${SAVE_CATEGORY_BUTTON}

Verify category created success message
    [Documentation]    Verifies that category creation success message is displayed.
    Wait Until Page Contains Wrapper    ${CATEGORY_CREATED_SUCCESS_MESSAGE}

# --- Delete ---

Select first category checkbox in categories page
    [Documentation]    Selects first category row checkbox in categories list.
    Click Element Wrapper    ${FIRST_CATEGORY_CHECKBOX}

Click on delete category button in categories page
    [Documentation]    Clicks delete button on categories page.
    Wait Until Visible Wrapper    ${DELETE_CATEGORY_BUTTON}    10s
    Click Element Wrapper    ${DELETE_CATEGORY_BUTTON}

Click on confirm delete category button in categories page
    [Documentation]    Confirms category deletion in modal dialog.
    Wait Until Visible Wrapper    ${CONFIRM_DELETE_BUTTON}    10s
    Click Element Wrapper    ${CONFIRM_DELETE_BUTTON}
