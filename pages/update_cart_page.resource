*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${PRODUCT_URL}        https://bepxinhvn.vn/products/10-hop-mica-nhua-trong-quai-xach-16x9x9cm

${ADD_TO_CART}        id=add-to-cart
${QUANTITY_INPUT}     id=quantity1
${UPDATE_BUTTON}      id=update-cart-modal
${RESULT_MESSAGE}     xpath=//h4[@id='exampleModalLabel']

*** Keywords ***
Open Product Page
    Go To    ${PRODUCT_URL}
    Wait Until Element Is Visible    ${ADD_TO_CART}    15s

Add To Cart
    Click Element    ${ADD_TO_CART}
    Sleep    2s

Update Quantity
    [Arguments]    ${quantity}
    Wait Until Element Is Visible    ${QUANTITY_INPUT}    10s
    Clear Element Text    ${QUANTITY_INPUT}
    Input Text    ${QUANTITY_INPUT}    ${quantity}
    Sleep    1s

Click Update Button
    Wait Until Element Is Visible    ${UPDATE_BUTTON}    10s

    Execute JavaScript    document.getElementById('update-cart-modal').click()

    Sleep    2s

    ${alert_status}=    Run Keyword And Return Status    Alert Should Be Present

    IF    ${alert_status}
        ${alert_text}=    Get Alert Message
        Log    ALERT: ${alert_text}
        Handle Alert    ACCEPT
        RETURN    ${alert_text}
    END

    RETURN    ""

Get Result Message
    ${status}    ${msg}=    Run Keyword And Ignore Error
    ...    Get Text    ${RESULT_MESSAGE}

    IF    '${status}' == 'FAIL'
        RETURN    ""
    END

    ${msg}=    Convert To Lower Case    ${msg}
    RETURN    ${msg}