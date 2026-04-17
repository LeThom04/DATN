*** Settings ***
Library    ../utils/data_reader.py
Resource    ../resources/common.resource
Resource    ../resources/login_keywords.resource
Resource    ../pages/login_page.resource

Suite Setup    Open Browser To Website
Suite Teardown    Close Browser

*** Variables ***
${DATA_TYPE}    json

*** Test Cases ***
Login Data Driven (Type)
    ${data}=    Run Keyword If    '${DATA_TYPE}'=='json'
    ...    Load Json Data    data/Data_Login.json
    ...    ELSE
    ...    Load Excel Data    data/Data_Login.xlsx

    FOR    ${item}    IN    @{data}

        ${email}=    Set Variable    ${item['email']}
        ${password}=    Set Variable    ${item['password']}
        ${type}=    Set Variable    ${item['type']}

        Log    ===== ${email} =====

        Login With Data    ${email}    ${password}

        IF    '${type}' == 'email_empty'
            ${msg}=    Get Browser Validation Message    ${USERNAME_INPUT}
            Should Not Be Empty    ${msg}

        ELSE IF    '${type}' == 'email_invalid'
            ${msg}=    Get Browser Validation Message    ${USERNAME_INPUT}
            Should Not Be Empty    ${msg}

        ELSE IF    '${type}' == 'login_fail'
            Page Should Contain Element    ${ERROR_MESSAGE}

        ELSE IF    '${type}' == 'login_success'
            Page Should Contain Element    ${SUCCESS_MESSAGE}
        END

        Reload Page

    END