*** Settings ***
Library    ../utils/data_reader.py
Resource    ../resources/common.resource
Resource    ../resources/forgot_password_keywords.resource
Resource    ../pages/forgot_password_page.resource

Suite Setup    Open Browser To Website
Suite Teardown    Close Browser

*** Variables ***
${DATA_TYPE}    json

*** Test Cases ***
Forgot Password Data Driven (Type)
    ${data}=    Run Keyword If    '${DATA_TYPE}'=='json'
    ...    Load Json Data    data/Data_Forgot_Password.json
    ...    ELSE
    ...    Load Excel Data    data/Data_Forgot_Password.xlsx

    FOR    ${item}    IN    @{data}

        ${email}=    Set Variable    ${item['email']}
        ${type}=     Set Variable    ${item['type']}

        Log    ===== ${email} =====

        Forgot Password With Data    ${email}

        IF    '${type}' == 'invalid'
            ${msg}=    Get Browser Validation Message
            Should Not Be Empty    ${msg}

        ELSE IF    '${type}' == 'not_exist'
            Page Should Contain Element    ${MESSAGE_ALERT}
        END

        Reload Page

    END