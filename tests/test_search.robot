*** Settings ***
Library    ../utils/data_reader.py
Resource    ../resources/common.resource
Resource    ../resources/search_keywords.resource
Resource    ../pages/search_page.resource

Suite Setup    Open Browser To Website
Suite Teardown    Close Browser

*** Variables ***
${DATA_TYPE}    json

*** Test Cases ***
Search Data Driven (Type)
    ${data}=    Run Keyword If    '${DATA_TYPE}'=='json'
    ...    Load Json Data    data/Data_Search.json
    ...    ELSE
    ...    Load Excel Data    data/Data_Search.xlsx

    FOR    ${item}    IN    @{data}

        ${keyword}=    Set Variable    ${item['keyword']}
        ${type}=       Set Variable    ${item['type']}

        Log    ===== ${keyword} =====

        Search Product    ${keyword}

        ${url}=    Get Current URL
        Log    URL: ${url}

        Should Contain    ${url}    search

        Reload Page

    END