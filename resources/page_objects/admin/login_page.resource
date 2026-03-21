
*** Variables ***
${ADMIN_URL}            http://localhost:3000/admin/login
${EMAIL_FIELD}          id=field-email
${PASSWORD_FIELD}       name=password
${LOGIN_BUTTON}         xpath=//button[normalize-space()='SIGN IN']
${USER_MENU_BUTTON}     xpath=//button[contains(., "d")]
${LOGOUT_OPTION}        xpath=//*[normalize-space(.)="Logout"]