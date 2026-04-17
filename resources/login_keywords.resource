*** Settings ***
Resource    ../pages/login_page.resource

*** Keywords ***
Login With Data
    [Arguments]    ${email}    ${password}
    Click Login Link
    Enter Email    ${email}
    Enter Password    ${password}
    Click Login Button