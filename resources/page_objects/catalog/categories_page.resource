*** Variables ***

# --- Navigation ---
${CATEGORIES_MENU}                  xpath=//a[contains(., "Categories")]
${NEW_CATEGORY_BUTTON}              xpath=//button[contains(., "New Category")]
${CATEGORY_TITLE}                   Categories
${NEW_CATEGORY_FORM_TITLE}          Create a new category

# --- Form Inputs ---
${CATEGORY_NAME_INPUT}              xpath=//input[@name='name']
${URL_KEY_INPUT}                    xpath=//input[@name='url_key']
${META_TITLE_INPUT}                 xpath=//input[@name='meta_title']
${META_DESCRIPTION_INPUT}           xpath=//textarea[@name='meta_description']

# --- Actions ---
${SAVE_CATEGORY_BUTTON}             xpath=//button[normalize-space()='Save']
${DELETE_CATEGORY_BUTTON}           xpath=//button[normalize-space()='Delete']
${CONFIRM_DELETE_BUTTON}            xpath=(//button[normalize-space()='Delete'])[last()]

# --- Feedback / Validation ---
${CATEGORY_CREATED_SUCCESS_TOAST}       xpath=//*[contains(normalize-space(.),'Category created successfully!')]
${CATEGORY_CREATED_SUCCESS_MESSAGE}     Category created successfully!

# --- Table ---
${FIRST_CATEGORY_CHECKBOX}              xpath=(//span[@role='checkbox'])[2]