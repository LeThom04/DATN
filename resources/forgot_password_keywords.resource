*** Settings ***
Resource    ../pages/forgot_password_page.resource

*** Keywords ***
Forgot Password With Data
    [Arguments]    ${email}
    Open Forgot Password Form
    Enter Email    ${email}
    Click Send Button