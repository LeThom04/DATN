*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://bepxinhvn.vn/

*** Keywords ***
Open Browser To Website
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("window-size=1920,1080")

    Create Webdriver    Chrome    options=${options}

    Go To    ${URL}

Close Browser
    Close All Browsers