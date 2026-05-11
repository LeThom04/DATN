*** Settings ***
Library    ../utils/data_reader.py
Resource   ../resources/common.resource
Resource   ../resources/update_cart_keywords.resource
Resource   ../pages/update_cart_page.resource

Suite Setup       Open Browser To Website
Suite Teardown    Close Browser

*** Variables ***
${DATA_TYPE}    json

*** Test Cases ***
Update Cart Data Driven (Type)
    ${data}=    Run Keyword If    '${DATA_TYPE}'=='json'
    ...    Load Json Data    data/Data_Update_Cart.json
    ...    ELSE
    ...    Load Excel Data    data/Data_Update_Cart.xlsx

    FOR    ${item}    IN    @{data}

        ${quantity}=    Set Variable    ${item['input']}
        ${type}=        Set Variable    ${item['type']}

        Log    ===== Quantity: ${quantity} =====

        Update Cart With Data    ${quantity}

        ${alert_msg}=    Click Update Button

        ${msg}=    Get Result Message

        ${final_msg}=    Set Variable If
        ...    '${alert_msg}'!=''    ${alert_msg}
        ...    ${msg}

        Log    Final Message: ${final_msg}

        IF    '${type}' == 'update'
            Should Not Be Empty    ${final_msg}
        END

    END