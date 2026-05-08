*** Settings ***
Library    ../utils/data_reader.py

Resource    ../resources/common.resource
Resource    ../resources/register_keywords.resource

Suite Setup    Open Browser To Website

*** Variables ***
${DATA_TYPE}    json

*** Test Cases ***
Register Data Driven

    ${data}=    Run Keyword If
    ...    '${DATA_TYPE}'=='json'
    ...    Load Json Data    data/Data_Register.json
    ...    ELSE
    ...    Load Excel Data    data/Data_Register.xlsx

    FOR    ${item}    IN    @{data}

        Log    ===== TEST: ${item['type']} =====

        Go To    https://bepxinhvn.vn/account/register

        Register With Data
        ...    ${item['ho']}
        ...    ${item['ten']}
        ...    ${item['email']}
        ...    ${item['matkhau']}
        ...    ${item['type']}

        Validate Register Result
        ...    ${item['type']}
        ...    ${item['expected']}

    END