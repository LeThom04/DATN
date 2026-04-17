*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_BUTTON}           xpath=//a[contains(text(),'Đăng nhập')]
${FORGOT_PASSWORD_LINK}   xpath=//a[contains(text(),'Quên mật khẩu?')]
${EMAIL_INPUT}            xpath=//input[@id='recover-email']
${SEND_BUTTON}            xpath=//input[@value='Gửi']
${MESSAGE_ALERT}          css=.errors ul li, .note.form-success

*** Keywords ***
Open Forgot Password Form
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    10s
    Click Element    ${LOGIN_BUTTON}

    Wait Until Element Is Visible    ${FORGOT_PASSWORD_LINK}    10s
    Click Element    ${FORGOT_PASSWORD_LINK}

    Sleep    2s
    Wait Until Page Contains Element    ${EMAIL_INPUT}    10s

Enter Email
    [Arguments]    ${email}
    Input Text    ${EMAIL_INPUT}    ${email}

Click Send Button
    Wait Until Page Contains Element    ${SEND_BUTTON}    10s
    Click Element    ${SEND_BUTTON}
    Sleep    2s

Get Result Message
    ${status}    ${msg}=    Run Keyword And Ignore Error
    ...    Get Text    ${MESSAGE_ALERT}

    IF    '${status}' == 'FAIL'
        RETURN    ""
    END

    RETURN    ${msg}

Get Browser Validation Message
    ${msg}=    Get Element Attribute    ${EMAIL_INPUT}    validationMessage
    RETURN    ${msg}