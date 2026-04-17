*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${A_REGISTER}        xpath=//a[contains(text(),'Đăng ký')]
${LASTNAME_INPUT}    xpath=//input[@id='last_name']
${FIRSTNAME_INPUT}   xpath=//input[@id='first_name']
${EMAIL_INPUT}       xpath=//input[@id='email']
${PASSWORD_INPUT}    xpath=//input[@id='password']
${REGISTER_BUTTON}   xpath=//input[@value='Đăng ký']

${ERROR_MESSAGE}     xpath=//div[@class='errors']
${SUCCESS_MESSAGE}   xpath=//h1[contains(text(),'Tài khoản của bạn')]

*** Keywords ***
Click Register Link
    Click Element    ${A_REGISTER}

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
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Register Button
    Click Button    ${REGISTER_BUTTON}

Get Browser Validation Message
    [Arguments]    ${locator}
    ${msg}=    Get Element Attribute    ${locator}    validationMessage
    RETURN    ${msg}