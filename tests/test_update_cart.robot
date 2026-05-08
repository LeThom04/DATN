*** Settings ***
Library    ../utils/data_reader.py
Resource   ../resources/common.resource
Resource   ../resources/update_cart_keywords.resource
Resource   ../pages/update_cart_page.resource

Suite Setup       Open Browser To Website

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

        # 👉 Click + bắt alert (nếu có)
        ${alert_msg}=    Click Update Button

        # 👉 Lấy message modal
        ${msg}=    Get Result Message

        # 👉 Ưu tiên alert nếu có
        ${final_msg}=    Set Variable If
        ...    '${alert_msg}'!=''    ${alert_msg}
        ...    ${msg}

        Log    Final Message: ${final_msg}

        # 👉 Assert giống LOGIN
        IF    '${type}' == 'update'
            Should Not Be Empty    ${final_msg}
        END

    END