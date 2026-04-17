*** Settings ***
Resource    ../resources/common.resource
Resource    ../resources/register_keywords.resource

Suite Setup    Open Browser To Website
Suite Teardown    Close Browser

*** Variables ***
${DATA_TYPE}    json

*** Test Cases ***
Register Data Driven

    ${data}=    Run Keyword If    '${DATA_TYPE}'=='json'
    ...    Load Json Data    data/Data_Register.json
    ...    ELSE
    ...    Load Excel Data    data/Data_Register.xlsx

    FOR    ${item}    IN    @{data}

        Log    ===== TEST: ${item['type']} =====

        Register With Data
        ...    ${item['ho']}
        ...    ${item['ten']}
        ...    ${item['email']}
        ...    ${item['matkhau']}

        Validate Register Result
        ...    ${item['type']}
        ...    ${item['expected']}

        Reload Page

    END