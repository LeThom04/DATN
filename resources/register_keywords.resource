*** Settings ***
Resource    ../pages/register_page.resource

*** Keywords ***

Register With Data
    [Arguments]    ${ho}    ${ten}    ${email}    ${password}

    Click Register Link
    Enter Ho    ${ho}
    Enter Ten    ${ten}
    Enter Register Email    ${email}
    Enter Register Password    ${password}
    Click Register Button


Validate Register Result
    [Arguments]    ${type}    ${expected}

    ${email_msg}=    Get Browser Validation Message    ${EMAIL_INPUT}
    ${pass_msg}=     Get Browser Validation Message    ${PASSWORD_INPUT}
    ${ho_msg}=       Get Browser Validation Message    ${LASTNAME_INPUT}

    # ===== HTML5 =====
    IF    '${type}' == 'email_empty'
        Should Contain    ${email_msg}    ${expected}

    ELSE IF    '${type}' == 'password_empty'
        Should Contain    ${pass_msg}    ${expected}

    ELSE IF    '${type}' == 'ho_empty'
        Should Contain    ${ho_msg}    ${expected}

    ELSE IF    '${type}' == 'email_invalid'
        Should Contain    ${email_msg}    ${expected}

    # ===== BACKEND =====
    ELSE IF    '${type}' == 'password_short'
        ${msg}=    Get Text    ${ERROR_MESSAGE}
        Should Contain    ${msg}    ${expected}

    # ===== SUCCESS =====
    ELSE IF    '${type}' == 'register_success'
        ${msg}=    Get Text    ${SUCCESS_MESSAGE}
        Should Contain    ${msg}    ${expected}

    END