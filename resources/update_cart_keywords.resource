*** Settings ***
Resource    ../pages/update_cart_page.resource

*** Keywords ***
Update Cart With Data
    [Arguments]    ${quantity}
    Open Product Page
    Add To Cart
    Update Quantity    ${quantity}