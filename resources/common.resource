*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://bepxinhvn.vn/
${BROWSER}    Chrome

*** Keywords ***
Open Browser To Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close Browser
    Close All Browsers