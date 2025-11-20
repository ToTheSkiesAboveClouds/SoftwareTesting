*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To DemoBlaze
Suite Teardown    Close Browser Session
Test Setup        Set Browser Capabilities

*** Variables ***
${URL}                      https://www.demoblaze.com/
${USERNAME}                 myuser123
${PASSWORD}                 mypass123

${BROWSERSTACK_USERNAME}    tothesky_9SuHMA
${BROWSERSTACK_ACCESS_KEY}  6rBkZAsYEGwB4LXsnyqJ
${REMOTE_URL}               https://${BROWSERSTACK_USERNAME}:${BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub

@{BROWSERS}                 chrome    firefox    safari

*** Keywords ***
Set Browser Capabilities
    [Arguments]    ${browser}=chrome
    &{CAPS}=    
    ...    browserName=${browser}
    ...    browserVersion=latest
    ...    os=Windows
    ...    osVersion=11
    ...    name=DemoBlaze Tests
    ...    build=RobotFramework Homework
    Set Suite Variable    &{CAPS}

Open Browser To DemoBlaze
    [Arguments]    ${browser}=chrome
    Open Browser    ${URL}    ${browser}    remote_url=${REMOTE_URL}    desired_capabilities=${CAPS}

Close Browser Session
    Close Browser

Handle Possible Alert
    ${result}=    Run Keyword And Ignore Error    Handle Alert    action=ACCEPT
    Log To Console    Alert handled or not present: ${result}

*** Test Cases ***
Sign Up
    Click Element    id=signin2
    Wait Until Element Is Visible    id=sign-username   7s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']
    Handle Possible Alert

Log In
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername   7s
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Page Contains Element    id=logout2
    Log To Console    Successfully logged in!

Buy Product
    Click Element    xpath=//a[text()='Laptops']
    Wait Until Element Is Visible    xpath=//a[text()='MacBook air']   7s
    Click Element    xpath=//a[text()='MacBook air']
    Wait Until Element Is Visible    xpath=//a[text()='Add to cart']   7s
    Click Element    xpath=//a[text()='Add to cart']
    Handle Possible Alert
    Click Element    id=cartur
    Wait Until Page Contains    MacBook air    5s
    Log To Console    Product added to cart.

Place Order
    Click Element    id=cartur
    Wait Until Page Contains Element    xpath=//button[text()='Place Order']
    Click Element    xpath=//button[text()='Place Order']

    Input Text    id=name      gabennagibatoranime
    Input Text    id=country   Kazakhstan
    Input Text    id=city      Almaty
    Input Text    id=card      4111111111111111
    Input Text    id=month     12
    Input Text    id=year      2025

    Click Button    xpath=//button[text()='Purchase']
    Wait Until Page Contains    Thank you for your purchase!
    Click Button    xpath=//button[text()='OK']

Log Out
    Click Element    id=logout2
    Wait Until Page Contains Element    id=login2   7s
    Log To Console    Logged out.
