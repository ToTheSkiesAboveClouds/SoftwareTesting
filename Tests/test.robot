*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To DemoBlaze
Suite Teardown    Close Browser Session

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.demoblaze.com/
${USERNAME}       dasdmmkedfmk213213
${PASSWORD}       awdmlg;213123

*** Keywords ***
Open Browser To DemoBlaze
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close Browser Session
    Close Browser

Handle Possible Alert
    ${result}=    Run Keyword And Ignore Error    Handle Alert
    Log To Console    Alert handled or not present: ${result}

*** Test Cases ***
Sign Up
    [Documentation]    Create a new user account on DemoBlaze.
    Click Element    id=signin2
    Sleep    3s
    Wait Until Element Is Visible    id=sign-username   7s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']
    Sleep    3s
    
    Run Keyword And Ignore Error    Handle Alert    action=ACCEPT
    Sleep    3s
   
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Sleep    3s

Log In
    [Documentation]    Log in using the previously registered account.
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername   3s
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Page Contains Element    id=logout2
    Log To Console    ✅ Successfully logged in!

    Run Keyword And Ignore Error    Handle Alert    action=ACCEPT
    Sleep    3s
   
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Sleep    3s

Place Order
    [Documentation]    Complete a purchase by filling out order details.
    Click Element    id=cartur
    Wait Until Page Contains Element    xpath=//button[text()='Place Order']
    Click Element    xpath=//button[text()='Place Order']
    Sleep    2s

    Input Text    id=name      gabennagibatoranime
    Input Text    id=country   Kazakhstan
    Input Text    id=city      Almaty
    Input Text    id=card      4111111111111111
    Input Text    id=month     12
    Input Text    id=year      2025

    Click Button    xpath=//button[text()='Purchase']
    Sleep    2s

    Wait Until Page Contains    Thank you for your purchase!
    Log To Console    💳 Order successfully placed!

    Click Button    xpath=//button[text()='OK']
    Sleep    2s

Open And Close About Us
    [Documentation]    Open the 'About Us' modal and then close it.
    Click Element    xpath=//a[text()='About us']
    Wait Until Element Is Visible    id=videoModal    5s
    Sleep    2s

    Log To Console    🎬 'About Us' modal opened successfully.

    Click Element    xpath=//div[@id='videoModal']//button[@class='close']
    Sleep    2s
    Log To Console    ❎ 'About Us' modal closed successfully.


Buy Product
    [Documentation]    Add a product to the cart.
    Click Element    xpath=//a[text()='Laptops']
    Wait Until Page Contains Element    xpath=//a[text()='MacBook air']
    Click Element    xpath=//a[text()='MacBook air']
    Wait Until Element Is Visible    xpath=//a[text()='Add to cart']
    Click Element    xpath=//a[text()='Add to cart']
    Sleep    3s
    Handle Possible Alert
    Click Element    id=cartur
    Wait Until Page Contains    MacBook air    5s
    Log To Console    🛒 Product successfully added to cart.


Log Out
    [Documentation]    Log out of the DemoBlaze account.
    Click Element    id=logout2
    Wait Until Page Contains Element    id=login2   3s
    Log To Console    👋 Logged out successfully.
