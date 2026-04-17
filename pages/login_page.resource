*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${A_LOGIN}           xpath=//a[contains(text(),'Đăng nhập')]
${USERNAME_INPUT}    id=customer_email
${PASSWORD_INPUT}    id=customer_password
${LOGIN_BUTTON}      xpath=//input[@value='Đăng nhập']
${ERROR_MESSAGE}     xpath=//div[@class='errors']
${SUCCESS_MESSAGE}   xpath=//h1[contains(text(),'Tài khoản của bạn')]

*** Keywords ***
Click Login Link
    Click Element    ${A_LOGIN}

Enter Email
    [Arguments]    ${email}
    Input Text    ${USERNAME_INPUT}    ${email}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Get Browser Validation Message
    [Arguments]    ${locator}
    ${msg}=    Get Element Attribute    ${locator}    validationMessage
    RETURN    ${msg}