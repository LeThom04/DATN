*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SEARCH_INPUT}      xpath=//form[@class='newFrmSearch']//input[@placeholder='Tìm kiếm...']
${SEARCH_BUTTON}     xpath=//form[@class='newFrmSearch']//button[@type='submit']

*** Keywords ***
Enter Search Keyword
    [Arguments]    ${keyword}
    Wait Until Element Is Visible    ${SEARCH_INPUT}    10s
    Clear Element Text    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${keyword}

Click Search Button
    Wait Until Element Is Visible    ${SEARCH_BUTTON}    10s
    Click Button    ${SEARCH_BUTTON}
    Sleep    3s

Get Current URL
    ${url}=    Get Location
    RETURN    ${url}

Get Browser Validation Message For Search
    ${msg}=    Get Element Attribute    ${SEARCH_INPUT}    validationMessage
    RETURN    ${msg}