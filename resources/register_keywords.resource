*** Settings ***
Library    String
Resource    ../pages/register_page.resource

*** Keywords ***

Register With Data
    [Arguments]
    ...    ${ho}
    ...    ${ten}
    ...    ${email}
    ...    ${matkhau}
    ...    ${type}

    IF    '${type}' == 'register_success'

        ${random}=    Generate Random String    5    [NUMBERS]

        ${email}=    Set Variable
        ...    thom${random}@gmail.com

    END

    Enter Ho    ${ho}
    Enter Ten    ${ten}
    Enter Register Email    ${email}
    Enter Register Password    ${matkhau}

    Click Register Button

Validate Register Result
    [Arguments]    ${type}    ${expected}

    ${email_msg}=    Get Browser Validation Message    ${EMAIL_INPUT}

    ${pass_msg}=     Get Browser Validation Message
    ...    ${PASSWORD_INPUT}

    ${ho_msg}=       Get Browser Validation Message
    ...    ${LASTNAME_INPUT}

    IF    '${type}' == 'email_empty'

        Should Contain    ${email_msg}    ${expected}

    ELSE IF    '${type}' == 'password_empty'

        Should Contain    ${pass_msg}    ${expected}

    ELSE IF    '${type}' == 'ho_empty'

        Should Contain    ${ho_msg}    ${expected}

    ELSE IF    '${type}' == 'email_invalid'

        Should Contain    ${email_msg}    ${expected}

    ELSE IF    '${type}' == 'register_success'

        Wait Until Element Is Visible
        ...    ${SUCCESS_MESSAGE}
        ...    10s

        ${msg}=    Get Text    ${SUCCESS_MESSAGE}

        Should Contain    ${msg}    ${expected}

    END