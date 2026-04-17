*** Settings ***
Resource    ../pages/search_page.resource

*** Keywords ***
Search Product
    [Arguments]    ${keyword}
    Enter Search Keyword    ${keyword}
    Click Search Button