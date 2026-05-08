*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LASTNAME_INPUT}    xpath=//input[@id='last_name']

${FIRSTNAME_INPUT}   xpath=//input[@id='first_name']

${EMAIL_INPUT}       xpath=//input[@id='email']

${PASSWORD_INPUT}    xpath=//input[@id='password']

${REGISTER_BUTTON}   xpath=//input[@value='Đăng ký']

${SUCCESS_MESSAGE}   xpath=//h1[contains(text(),'Tài khoản của bạn')]

*** Keywords ***

Enter Ho
    [Arguments]    ${ho}

    Input Text    ${LASTNAME_INPUT}    ${ho}

Enter Ten
    [Arguments]    ${ten}

    Input Text    ${FIRSTNAME_INPUT}    ${ten}

Enter Register Email
    [Arguments]    ${email}

    Input Text    ${EMAIL_INPUT}    ${email}

Enter Register Password
    [Arguments]    ${matkhau}

    Input Text    ${PASSWORD_INPUT}    ${matkhau}

Click Register Button

    Click Button    ${REGISTER_BUTTON}

Get Browser Validation Message
    [Arguments]    ${locator}

    ${msg}=    Get Element Attribute
    ...    ${locator}
    ...    validationMessage

    RETURN    ${msg}